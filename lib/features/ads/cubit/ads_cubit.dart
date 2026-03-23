import 'package:example/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/ads_enums.dart';
import '../constants/native_ad_style.dart';
import '../manager/ads_manager.dart';

part 'ads_state.dart';
part 'ads_cubit.freezed.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this._manager) : super(const AdsState());

  final AdsManager _manager;

  // ── Initialization ───────────────────────────────────────────────────────────

  /// Called once from SplashPage. Orchestrates consent → SDK init.
  /// Native ad is loaded by [AppNativeAdWidget] after init so it can
  /// pass the correct theme-aware [NativeAdStyle].
  Future<void> initialize() async {
    // 1. Read age-restriction preference
    final isAgeRestricted = await _manager.loadAgeRestricted();
    _safeEmit(state.copyWith(isAgeRestricted: isAgeRestricted));

    // 2. Run UMP consent flow (may show a dialog)
    final consent = await _manager.requestConsent();
    _safeEmit(state.copyWith(consentStatus: consent));

    // 3. Initialise SDK after consent (regardless of outcome — UMP sets the flags)
    await _manager.initializeSdk(isAgeRestricted: isAgeRestricted);

    // 4. Load ads in parallel — App Open Ad and Native Ad
    await Future.wait([
      // _loadAppOpenAd(),
      loadNativeAd(),
    ]);

    // 5. Signal splash that init is complete
    _safeEmit(state.copyWith(isInitialized: true));
  }

  // ── App Open Ad ──────────────────────────────────────────────────────────────

  Future<void> _loadAppOpenAd() async {
    _safeEmit(state.copyWith(appOpenAdStatus: AdLoadStatus.loading));

    await _manager.loadAppOpenAd(
      isAgeRestricted: state.isAgeRestricted,
      onLoaded: (_) => _safeEmit(state.copyWith(appOpenAdStatus: AdLoadStatus.ready)),
      onFailed: () => _safeEmit(state.copyWith(appOpenAdStatus: AdLoadStatus.failed)),
    );
  }

  Future<void> showAppOpenAd() async {
    await _manager.showAppOpenAd(
      onDismissed: () => _safeEmit(state.copyWith(appOpenAdStatus: AdLoadStatus.idle)),
      onFailed: () => _safeEmit(state.copyWith(appOpenAdStatus: AdLoadStatus.failed)),
    );
  }

  // ── Native Ad ───────────────────────────────────────────────────────────────

  /// Loads (or reloads) the native ad with a theme-aware [style].
  /// Called by [AppNativeAdWidget] on first mount and on every theme change.
  Future<void> loadNativeAd() async {
    _safeEmit(state.copyWith(nativeAdStatus: AdLoadStatus.loading, nativeAd: null));

    await _manager.loadNativeAd(
      isAgeRestricted: state.isAgeRestricted,
      style: _buildStyle(context),
      onLoaded: (ad) => _safeEmit(state.copyWith(nativeAd: ad, nativeAdStatus: AdLoadStatus.ready)),
      onFailed: () => _safeEmit(state.copyWith(nativeAdStatus: AdLoadStatus.failed)),
    );
  }

  BuildContext get context => NavigationHelper.context;

  NativeAdStyle _buildStyle(BuildContext context) => NativeAdStyle(
    textStyleHeadline: NativeTemplateTextStyle(textColor: context.colorScheme.onSurface, style: NativeTemplateFontStyle.bold, size: 14.0),
    textStyleBody: NativeTemplateTextStyle(textColor: context.semanticColors.neutral30, style: NativeTemplateFontStyle.normal, size: 8.0),
    backgroundColor: context.semanticColors.neutral80,
    ctaBackgroundColor: context.colorScheme.primary,
    ctaTextStyle: NativeTemplateTextStyle(textColor: context.colorScheme.onPrimary, style: NativeTemplateFontStyle.bold, size: 16.0),
  );

  // ── Helpers ──────────────────────────────────────────────────────────────────

  void _safeEmit(AdsState newState) {
    if (!isClosed) emit(newState);
  }

  // ── Dispose ──────────────────────────────────────────────────────────────────

  @override
  Future<void> close() {
    _manager.dispose();
    return super.close();
  }
}
