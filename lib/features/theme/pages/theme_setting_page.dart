import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ─── Hardcoded palette snapshots for preview (from AppColorSchemes) ───────────
const _kLightSurface = Color(0xFFFFFFFF);
const _kLightOnSurface = Color(0xFF1C1B1F);
const _kLightPrimary = Color(0xFF7dd421);
const _kLightCard = Color(0xFFF2F6FC);

const _kDarkSurface = Color(0xFF0F0F0F);
const _kDarkOnSurface = Color(0xFFE6E1E5);
const _kDarkPrimary = Color(0xFF7dd421);
const _kDarkCard = Color(0xFF1A1C24);

class ThemeSettingPage extends StatelessWidget {
  const ThemeSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppAppBar(title: 'Appearance'),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ListView(
            padding: AppSpacing.pagePadding,
            children: [
              // ── Live preview ──────────────────────────────────────────────
              _LivePreviewCard(themeMode: state.themeMode),
              const SizedBox(height: AppSpacing.xl),
              Text('Choose theme', style: context.textTheme.titleMedium?.semiBold),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Select how the app looks on your device.',
                style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral60),
              ),
              const SizedBox(height: AppSpacing.lg),
              // ── Selection cards ───────────────────────────────────────────
              Row(
                spacing: AppSpacing.sm,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: _ThemeCard(
                      label: 'System',
                      icon: Icons.brightness_auto_rounded,
                      themeMode: ThemeMode.system,
                      currentMode: state.themeMode,
                    ),
                  ),
                  Expanded(
                    child: _ThemeCard(label: 'Light', icon: Icons.light_mode_rounded, themeMode: ThemeMode.light, currentMode: state.themeMode),
                  ),
                  Expanded(
                    child: _ThemeCard(label: 'Dark', icon: Icons.dark_mode_rounded, themeMode: ThemeMode.dark, currentMode: state.themeMode),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

// ─── Live animated preview ────────────────────────────────────────────────────

class _LivePreviewCard extends StatelessWidget {
  const _LivePreviewCard({required this.themeMode});

  final ThemeMode themeMode;

  bool _isDark(BuildContext context) {
    if (themeMode == ThemeMode.dark) return true;
    if (themeMode == ThemeMode.light) return false;
    return context.isDarkMode;
  }

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);
    final surface = dark ? _kDarkSurface : _kLightSurface;
    final onSurface = dark ? _kDarkOnSurface : _kLightOnSurface;
    final primary = dark ? _kDarkPrimary : _kLightPrimary;
    final card = dark ? _kDarkCard : _kLightCard;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 350),
      transitionBuilder: (child, anim) => FadeTransition(
        opacity: anim,
        child: ScaleTransition(scale: Tween<double>(begin: 0.97, end: 1).animate(anim), child: child),
      ),
      child: KeyedSubtree(
        key: ValueKey(themeMode),
        child: Container(
          height: 200,
          decoration: BoxDecoration(
            borderRadius: AppStyle.borderExtraLarge,
            border: Border.all(color: context.colorScheme.outlineVariant),
            color: surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: dark ? 0.3 : 0.07),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              // fake app bar
              Container(
                height: 40,
                color: surface,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(shape: BoxShape.circle, color: onSurface.withValues(alpha: 0.2)),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      width: 80,
                      height: 8,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: onSurface.withValues(alpha: 0.15)),
                    ),
                    const Spacer(),
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: primary.withValues(alpha: 0.18)),
                      child: Icon(Icons.add, size: 14, color: primary),
                    ),
                  ],
                ),
              ),
              Divider(height: 1, color: onSurface.withValues(alpha: 0.08)),
              // fake body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      _FakeCard(surface: card, onSurface: onSurface, primary: primary, wide: true),
                      const SizedBox(height: 8),
                      Row(
                        spacing: 8,
                        children: [
                          Expanded(
                            child: _FakeCard(surface: card, onSurface: onSurface, primary: primary, wide: false),
                          ),
                          Expanded(
                            child: _FakeCard(surface: card, onSurface: onSurface, primary: primary, wide: false),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FakeCard extends StatelessWidget {
  const _FakeCard({required this.surface, required this.onSurface, required this.primary, required this.wide});

  final Color surface;
  final Color onSurface;
  final Color primary;
  final bool wide;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: surface),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: primary.withValues(alpha: 0.2)),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 6,
                      width: wide ? 90 : 50,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: onSurface.withValues(alpha: 0.5)),
                    ),
                    const SizedBox(height: 3),
                    Container(
                      height: 5,
                      width: wide ? 60 : 35,
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: onSurface.withValues(alpha: 0.2)),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (wide) ...[
            const SizedBox(height: 8),
            Container(
              height: 20,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: primary),
            ),
          ],
        ],
      ),
    );
  }
}

// ─── Theme selection card ─────────────────────────────────────────────────────

class _ThemeCard extends StatelessWidget {
  const _ThemeCard({required this.label, required this.icon, required this.themeMode, required this.currentMode});

  final String label;
  final IconData icon;
  final ThemeMode themeMode;
  final ThemeMode currentMode;

  @override
  Widget build(BuildContext context) {
    final isSelected = themeMode == currentMode;

    final (topSurface, topPrimary, bottomSurface, bottomPrimary) = switch (themeMode) {
      ThemeMode.light => (_kLightSurface, _kLightPrimary, _kLightSurface, _kLightPrimary),
      ThemeMode.dark => (_kDarkSurface, _kDarkPrimary, _kDarkSurface, _kDarkPrimary),
      _ => (_kLightSurface, _kLightPrimary, _kDarkSurface, _kDarkPrimary),
    };

    return GestureDetector(
      onTap: () => context.read<ThemeCubit>().setTheme(themeMode),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          borderRadius: AppStyle.borderCard,
          border: Border.all(color: isSelected ? context.colorScheme.primary : context.colorScheme.outlineVariant, width: isSelected ? 2 : 1),
        ),
        child: Column(
          children: [
            // mini preview
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(AppStyle.radiusCard - 1)),
              child: themeMode == ThemeMode.system
                  ? Row(
                      children: [
                        Expanded(
                          child: _MiniPreview(surface: topSurface, primary: topPrimary),
                        ),
                        Expanded(
                          child: _MiniPreview(surface: bottomSurface, primary: bottomPrimary),
                        ),
                      ],
                    )
                  : _MiniPreview(surface: topSurface, primary: topPrimary),
            ),
            // label row
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
              color: isSelected ? context.colorScheme.primary.withValues(alpha: 0.08) : Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 4,
                children: [
                  Icon(icon, size: 14, color: isSelected ? context.colorScheme.primary : context.semanticColors.neutral60),
                  Flexible(
                    child: Text(
                      label,
                      style: context.textTheme.labelSmall?.copyWith(
                        color: isSelected ? context.colorScheme.primary : context.semanticColors.neutral60,
                        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MiniPreview extends StatelessWidget {
  const _MiniPreview({required this.surface, required this.primary});

  final Color surface;
  final Color primary;

  @override
  Widget build(BuildContext context) {
    final onSurface = surface == _kDarkSurface ? _kDarkOnSurface : _kLightOnSurface;
    final cardBg = surface == _kDarkSurface ? _kDarkCard : _kLightCard;
    return Container(
      height: 80,
      color: surface,
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 5,
            width: 40,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: onSurface.withValues(alpha: 0.4)),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: cardBg),
            child: Row(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: primary.withValues(alpha: 0.3)),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    height: 4,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: onSurface.withValues(alpha: 0.3)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 14,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(4), color: primary),
          ),
        ],
      ),
    );
  }
}
