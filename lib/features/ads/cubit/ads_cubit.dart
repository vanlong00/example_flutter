import 'package:example/core/core.dart';
import 'package:example/data/models/more_app/more_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:injectable/injectable.dart';

import '../constants/ads_enums.dart';
import '../constants/native_ad_style.dart';
import '../manager/ads_manager.dart';
import '../widgets/birth_year_picker_dialog.dart';

part 'ads_state.dart';
part 'ads_cubit.freezed.dart';

@lazySingleton
class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this._manager) : super(const AdsState());

  final AdsManager _manager;

  // ── Initialization ───────────────────────────────────────────────────────────

  /// Called once from SplashPage. Orchestrates birth-year → consent → SDK init.
  Future<void> initialize() async {
    // 1. Read saved birth year; if missing, ask the user via dialog
    int? birthYear = await _manager.loadBirthYear();

    if (birthYear == null) {
      // Use NavigationHelper.context so the dialog always opens on the current
      // top-most route, even if navigation happened during loadBirthYear().
      // ignore: use_build_context_synchronously — context is NavigationHelper.context (always current)
      birthYear = await BirthYearPickerDialog.show(context);
      if (birthYear == null) return; // dismissed — stay on splash
      await _manager.setBirthYear(birthYear);
    }

    // 2. Run UMP consent flow (may show a dialog)
    final consent = await _manager.requestConsent();
    _safeEmit(state.copyWith(consentStatus: consent));

    // 3. Initialise SDK after consent (regardless of outcome — UMP sets the flags)
    await _manager.initializeSdk();

    // 4. Load ads in parallel
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
