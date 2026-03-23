import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../constants/ads_enums.dart';
import '../cubit/ads_cubit.dart';

/// Renders a native ad using [AdWidget].
/// Reacts to [AdsCubit] state — never uses setState.
///
/// The widget shows:
///   - A shimmer skeleton while the ad is loading
///   - The native ad once ready
///   - [SizedBox.shrink] on failure/idle (no layout jump)
class AppNativeAdWidget extends StatefulWidget {
  const AppNativeAdWidget({super.key});

  @override
  State<AppNativeAdWidget> createState() => _AppNativeAdWidgetState();
}

class _AppNativeAdWidgetState extends State<AppNativeAdWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<ThemeCubit, ThemeState>(
      listener: (context, state) {
        // SDK finished initializing after this widget was already mounted.
        Future.delayed(const Duration(milliseconds: 500), () {
          if (!mounted) return;
          context.read<AdsCubit>().loadNativeAd();
        });
      },
      child: BlocBuilder<AdsCubit, AdsState>(
        buildWhen: (prev, curr) => prev.nativeAdStatus != curr.nativeAdStatus || prev.nativeAd != curr.nativeAd,
        builder: (context, state) {
          if (state.nativeAdStatus != AdLoadStatus.loading && state.nativeAdStatus != AdLoadStatus.ready) {
            return const SizedBox.shrink();
          }

          final child = switch (state.nativeAdStatus) {
            AdLoadStatus.loading => const _NativeAdSkeleton(),
            AdLoadStatus.ready when state.nativeAd != null => _NativeAdView(ad: state.nativeAd!),
            _ => const SizedBox.shrink(),
          };
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: ClipRRect(
              borderRadius: AppStyle.borderExtraLarge,
              clipBehavior: Clip.hardEdge,
              child: Container(constraints: const BoxConstraints(minWidth: 270, minHeight: 270, maxHeight: 270), child: child),
            ),
          );
        },
      ),
    );
  }
}

// ── Native Ad View ────────────────────────────────────────────────────────────

class _NativeAdView extends StatelessWidget {
  const _NativeAdView({required this.ad});

  final NativeAd ad;

  @override
  Widget build(BuildContext context) {
    return AdWidget(ad: ad);
  }
}

// ── Skeleton Placeholder ──────────────────────────────────────────────────────

class _NativeAdSkeleton extends StatelessWidget {
  const _NativeAdSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: context.semanticColors.neutral80,
      child: Column(
        spacing: AppSpacing.sm,
        children: [
          // MediaView
          Expanded(child: Container(color: context.semanticColors.neutral70)),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.smMd, right: AppSpacing.smMd, bottom: AppSpacing.md),
            child: Column(
              spacing: AppSpacing.sm,
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: AppSpacing.md + AppSpacing.xs,
                    children: [
                      // IconView
                      AspectRatio(aspectRatio: 1, child: SizedBox.shrink()),
                      Expanded(
                        child: Column(
                          spacing: AppSpacing.xs / 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AdvertiserView
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                              decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: BorderRadius.circular(4)),
                              child: Text('Ad', style: TextStyle(color: context.colorScheme.onPrimary, fontSize: 8).semiBold),
                            ),
                            // HeadlineView
                            Text('MiraClean - Trình Quản Lý Tệp', style: context.textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                            // BodyView
                            Text(
                              'MiraClean – Công cụ Giúp Quản lý Tệp và Bộ nhớ của Bạn',
                              style: TextStyle(fontSize: 8).regular.copyWith(color: context.semanticColors.neutral30),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // CallToActionView
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: context.colorScheme.primary,
                      foregroundColor: context.colorScheme.onPrimary,
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.smMd),
                      elevation: .0,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    ),
                    child: Text('INSTALL', style: context.textTheme.titleMedium?.bold.withColor(Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
