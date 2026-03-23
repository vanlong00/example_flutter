import 'dart:math';

import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/datasources/remote_config_service.dart';
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
              borderRadius: BorderRadius.vertical(top: Radius.circular(AppStyle.radiusExtraLarge)),
              clipBehavior: Clip.hardEdge,
              child: Container(
                constraints: const BoxConstraints(minWidth: 270, minHeight: 270, maxHeight: 270),
                child: AspectRatio(aspectRatio: 1.36, child: child),
              ),
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
    final moreApps = getIt<RemoteConfigService>().getMoreApps();
    final moreApp = moreApps.elementAt(Random().nextInt(moreApps.length));

    return Container(
      color: context.semanticColors.neutral80,
      child: Column(
        spacing: AppSpacing.sm,
        children: [
          // MediaView
          Expanded(
            child: Image.network(moreApp.banner, fit: BoxFit.cover, width: double.infinity),
          ),
          Padding(
            padding: const EdgeInsets.only(left: AppSpacing.smMd, right: AppSpacing.smMd, bottom: AppSpacing.md),
            child: Column(
              spacing: AppSpacing.sm,
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: AppSpacing.md + AppSpacing.xs,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // IconView
                      SizedBox(
                        width:
                            context.textTheme.titleSmall!.fontSize! * context.textTheme.titleSmall!.height! +
                            2 * TextStyle(fontSize: 8).fontSize! * 1.32 +
                            2 * AppSpacing.xs / 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.network(moreApp.icon, fit: BoxFit.cover),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          spacing: AppSpacing.xs / 2,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AdvertiserView
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                              decoration: BoxDecoration(color: context.colorScheme.primary, borderRadius: BorderRadius.circular(4)),
                              child: Text('Ad', style: TextStyle(color: context.colorScheme.onPrimary, fontSize: 8, height: 1.32).semiBold),
                            ),
                            // HeadlineView
                            Text(moreApp.name, style: context.textTheme.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                            // BodyView
                            Text(
                              moreApp.description,
                              style: TextStyle(fontSize: 8, height: 1.32).regular.copyWith(color: context.semanticColors.neutral30),
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
