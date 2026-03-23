import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/ads_enums.dart';
import '../manager/ads_manager.dart';

part 'ads_state.dart';
part 'ads_cubit.freezed.dart';

class AdsCubit extends Cubit<AdsState> {
  AdsCubit(this._manager) : super(const AdsState());

  final AdsManager _manager;

  // ── Initialization ───────────────────────────────────────────────────────────

  /// Called once from SplashPage. Orchestrates consent → SDK init → ad loading.
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
      _loadNativeAd(),
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

  Future<void> _loadNativeAd() async {
    _safeEmit(state.copyWith(nativeAdStatus: AdLoadStatus.loading));

    await _manager.loadNativeAd(
      isAgeRestricted: state.isAgeRestricted,
      onLoaded: (ad) => _safeEmit(
        state.copyWith(nativeAd: ad, nativeAdStatus: AdLoadStatus.ready),
      ),
      onFailed: () => _safeEmit(state.copyWith(nativeAdStatus: AdLoadStatus.failed)),
    );
  }

  // ── Helpers ──────────────────────────────────────────────────────────────────

  /// Emits only when the cubit is still open — guards against callbacks firing
  /// after [close()] has been called (e.g. rapid screen dispose during loading).
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
