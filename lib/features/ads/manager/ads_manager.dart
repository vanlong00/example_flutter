import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/ad_unit_ids.dart';
import '../constants/ads_enums.dart';

const _kAgeRestrictedKey = 'ads_age_restricted';
const _kAppOpenAdMaxAge = Duration(hours: 1);

@lazySingleton
class AdsManager {
  NativeAd? _cachedNativeAd;
  AppOpenAd? _appOpenAd;
  DateTime? _appOpenAdLoadTime;

  // ── Age Restriction ──────────────────────────────────────────────────────────

  Future<bool> loadAgeRestricted() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_kAgeRestrictedKey) ?? false;
  }

  Future<void> setAgeRestricted({required bool value}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_kAgeRestrictedKey, value);
  }

  // ── Consent (UMP SDK) ────────────────────────────────────────────────────────

  /// Runs the full UMP consent flow and returns the resolved [AdsConsentStatus].
  /// In debug mode uses EEA geography to always trigger the consent dialog.
  Future<AdsConsentStatus> requestConsent() async {
    final params = ConsentRequestParameters(
      consentDebugSettings: kDebugMode
          ? ConsentDebugSettings(debugGeography: DebugGeography.debugGeographyEea, testIdentifiers: AdUnitIds.testDeviceIds)
          : null,
    );

    // Step 1 — request consent info update
    final updateCompleter = Completer<void>();
    ConsentInformation.instance.requestConsentInfoUpdate(
      params,
      () {
        if (!updateCompleter.isCompleted) updateCompleter.complete();
      },
      (FormError error) {
        debugPrint('[AdsManager] Consent info error: ${error.message}');
        if (!updateCompleter.isCompleted) {
          updateCompleter.completeError(Exception(error.message));
        }
      },
    );

    try {
      await updateCompleter.future;
    } catch (_) {
      return AdsConsentStatus.unknown;
    }

    // Step 2 — load and present form if required
    FormError? formError;
    try {
      await ConsentForm.loadAndShowConsentFormIfRequired((error) {
        formError = error;
      });
    } catch (e) {
      debugPrint('[AdsManager] Consent form exception: $e');
      return AdsConsentStatus.unknown;
    }

    if (formError != null) {
      debugPrint('[AdsManager] Consent form error: ${formError!.message}');
      // Form had an error but UMP may still allow ad requests in some regions.
      // Return unknown so the cubit decides to proceed with non-personalized ads.
      return AdsConsentStatus.unknown;
    }

    debugPrint('[AdsManager] Consent flow completed successfully');
    return AdsConsentStatus.obtained;
  }

  // ── SDK Initialization ───────────────────────────────────────────────────────

  /// Must be called AFTER consent resolves.
  Future<void> initializeSdk({required bool isAgeRestricted}) async {
    MobileAds.instance.updateRequestConfiguration(
      RequestConfiguration(
        tagForChildDirectedTreatment: isAgeRestricted ? TagForChildDirectedTreatment.yes : TagForChildDirectedTreatment.unspecified,
        tagForUnderAgeOfConsent: isAgeRestricted ? TagForUnderAgeOfConsent.yes : TagForUnderAgeOfConsent.unspecified,
        testDeviceIds: kDebugMode ? AdUnitIds.testDeviceIds : null,
      ),
    );

    await MobileAds.instance.initialize();
    debugPrint('[AdsManager] MobileAds SDK initialized');
  }

  // ── Ad Request Builder ───────────────────────────────────────────────────────

  AdRequest _adRequest({required bool isAgeRestricted}) {
    return AdRequest(
      // Force non-personalized ads for under-age or restricted users
      extras: isAgeRestricted ? {'npa': '1'} : null,
    );
  }

  // ── Native Ad ───────────────────────────────────────────────────────────────

  Future<void> loadNativeAd({required bool isAgeRestricted, required void Function(NativeAd ad) onLoaded, required void Function() onFailed}) async {
    // Dispose any previously cached ad
    _cachedNativeAd?.dispose();
    _cachedNativeAd = null;

    final ad = NativeAd(
      adUnitId: AdUnitIds.native,
      request: _adRequest(isAgeRestricted: isAgeRestricted),
      // TODO: customise NativeTemplateStyle colours and fonts to match branding
      nativeTemplateStyle: NativeTemplateStyle(templateType: TemplateType.medium),
      listener: NativeAdListener(
        onAdLoaded: (loadedAd) {
          debugPrint('[AdsManager] NativeAd loaded');
          _cachedNativeAd = loadedAd as NativeAd;
          onLoaded(_cachedNativeAd!);
        },
        onAdFailedToLoad: (failedAd, error) {
          debugPrint('[AdsManager] NativeAd failed: ${error.message}');
          failedAd.dispose();
          onFailed();
        },
      ),
    );

    await ad.load();
  }

  // ── App Open Ad ──────────────────────────────────────────────────────────────

  Future<void> loadAppOpenAd({
    required bool isAgeRestricted,
    required void Function(AppOpenAd ad) onLoaded,
    required void Function() onFailed,
  }) async {
    _appOpenAd?.dispose();
    _appOpenAd = null;
    _appOpenAdLoadTime = null;

    await AppOpenAd.load(
      adUnitId: AdUnitIds.appOpen,
      request: _adRequest(isAgeRestricted: isAgeRestricted),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          debugPrint('[AdsManager] AppOpenAd loaded');
          _appOpenAd = ad;
          _appOpenAdLoadTime = DateTime.now();
          onLoaded(ad);
        },
        onAdFailedToLoad: (error) {
          debugPrint('[AdsManager] AppOpenAd failed: ${error.message}');
          onFailed();
        },
      ),
    );
  }

  Future<void> showAppOpenAd({required void Function() onDismissed, required void Function() onFailed}) async {
    final ad = _appOpenAd;
    if (ad == null) {
      onFailed();
      return;
    }

    // Discard stale ads (expired after 1 hour)
    final loadTime = _appOpenAdLoadTime;
    if (loadTime != null && DateTime.now().difference(loadTime) > _kAppOpenAdMaxAge) {
      debugPrint('[AdsManager] AppOpenAd expired — discarding');
      ad.dispose();
      _appOpenAd = null;
      _appOpenAdLoadTime = null;
      onFailed();
      return;
    }

    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (_) {
        debugPrint('[AdsManager] AppOpenAd dismissed');
        _appOpenAd?.dispose();
        _appOpenAd = null;
        _appOpenAdLoadTime = null;
        onDismissed();
      },
      onAdFailedToShowFullScreenContent: (_, error) {
        debugPrint('[AdsManager] AppOpenAd failed to show: ${error.message}');
        _appOpenAd?.dispose();
        _appOpenAd = null;
        _appOpenAdLoadTime = null;
        onFailed();
      },
    );

    await ad.show();
  }

  // ── Dispose ──────────────────────────────────────────────────────────────────

  void dispose() {
    _cachedNativeAd?.dispose();
    _cachedNativeAd = null;
    _appOpenAd?.dispose();
    _appOpenAd = null;
    _appOpenAdLoadTime = null;
    debugPrint('[AdsManager] disposed');
  }
}
