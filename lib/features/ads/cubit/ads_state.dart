part of 'ads_cubit.dart';

@freezed
abstract class AdsState with _$AdsState {
  const factory AdsState({
    @Default(AdsConsentStatus.unknown) AdsConsentStatus consentStatus,
    @Default(AdLoadStatus.idle) AdLoadStatus nativeAdStatus,
    @Default(AdLoadStatus.idle) AdLoadStatus appOpenAdStatus,
    @Default(false) bool isInitialized,
    NativeAd? nativeAd,
    @Default([]) List<MoreApp> moreApps,
  }) = _AdsState;
}
