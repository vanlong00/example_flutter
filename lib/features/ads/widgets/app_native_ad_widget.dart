import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/ads_enums.dart';
import '../cubit/ads_cubit.dart';

/// Renders a native ad using [AdWidget].
/// Reacts to [AdsCubit] state — never uses setState.
///
/// The widget shows:
///   - A shimmer skeleton while the ad is loading
///   - The native ad once ready
///   - [SizedBox.shrink] on failure/idle (no layout jump)
class AppNativeAdWidget extends StatelessWidget {
  const AppNativeAdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdsCubit, AdsState>(
      buildWhen: (prev, curr) => prev.nativeAdStatus != curr.nativeAdStatus || prev.nativeAd != curr.nativeAd,
      builder: (context, state) => switch (state.nativeAdStatus) {
        AdLoadStatus.loading => SizedBox.shrink(),
        AdLoadStatus.ready when state.nativeAd != null => _NativeAdView(ad: state.nativeAd!),
        _ => const SizedBox.shrink(),
      },
    );
  }
}

// ── Native Ad View ────────────────────────────────────────────────────────────

class _NativeAdView extends StatelessWidget {
  const _NativeAdView({required this.ad});

  final NativeAd ad;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      color: Colors.red,
      child: ClipRRect(
        borderRadius: AppStyle.borderCard,
        child: AdWidget(ad: ad),
      ),
    );
  }
}

// ── Skeleton Placeholder ──────────────────────────────────────────────────────

class _NativeAdSkeleton extends StatelessWidget {
  const _NativeAdSkeleton();

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context).colorScheme.surfaceContainerHighest;
    final highlight = Theme.of(context).colorScheme.surfaceContainer;

    return Shimmer.fromColors(
      baseColor: base,
      highlightColor: highlight,
      child: Padding(
        padding: AppSpacing.allMd,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thumbnail placeholder
            ClipRRect(
              borderRadius: AppStyle.borderCard,
              child: Container(height: 180, color: Colors.white),
            ),
            const SizedBox(height: AppSpacing.md),
            // Title line
            Container(
              height: 16,
              width: 200,
              decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
            ),
            const SizedBox(height: AppSpacing.sm),
            // Body line 1
            Container(
              height: 12,
              decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
            ),
            const SizedBox(height: AppSpacing.xs),
            // Body line 2
            Container(
              height: 12,
              width: 260,
              decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
            ),
            const SizedBox(height: AppSpacing.md),
            // CTA button placeholder
            Container(
              height: 40,
              width: 140,
              decoration: BoxDecoration(color: Colors.white, borderRadius: AppStyle.borderButton),
            ),
          ],
        ),
      ),
    );
  }
}
