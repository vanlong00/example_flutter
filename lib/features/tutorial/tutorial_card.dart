import 'package:design_system/design_system.dart';
import 'package:example/core/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';

/// A custom tooltip card rendered inside [Showcase.withWidget].
///
/// Features:
/// - Animated pill-shaped step progress dots
/// - Colored icon badge + bold title
/// - Subtle accent bar at the top matching [iconColor]
/// - Skip / Next (or "Got it" on the last step) action buttons
class TutorialCard extends StatelessWidget {
  const TutorialCard({
    super.key,
    required this.onNext,
    required this.onSkip,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.description,
    required this.stepIndex,
    required this.totalSteps,
  });

  /// Called when the user taps "Next" or "Got it".
  final VoidCallback onNext;

  /// Called when the user taps "Skip".
  final VoidCallback onSkip;
  final IconData icon;
  final Color iconColor;
  final String title;
  final String description;

  /// 0-based index of this step.
  final int stepIndex;
  final int totalSteps;

  bool get _isLastStep => stepIndex == totalSteps - 1;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        width: 284,
        decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: context.colorScheme.outlineVariant.withValues(alpha: 0.6)),
          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.18), blurRadius: 28, spreadRadius: -4, offset: const Offset(0, 10))],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Accent bar ──────────────────────────────────────────
              Container(height: 3, color: iconColor),

              Padding(
                padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.md),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Step progress dots ──────────────────────────
                    Row(
                      children: List.generate(totalSteps, (i) {
                        final isActive = i == stepIndex;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                          margin: const EdgeInsets.only(right: AppSpacing.xs),
                          width: isActive ? 22.0 : 6.0,
                          height: 6,
                          decoration: BoxDecoration(
                            color: isActive ? iconColor : context.colorScheme.outlineVariant,
                            borderRadius: BorderRadius.circular(3),
                          ),
                        );
                      }),
                    ),

                    const SizedBox(height: AppSpacing.md),

                    // ── Icon badge + title ──────────────────────────
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(AppSpacing.sm),
                          decoration: BoxDecoration(color: iconColor.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(10)),
                          child: Icon(icon, size: 18, color: iconColor),
                        ),
                        const SizedBox(width: AppSpacing.sm),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Text(title, style: context.textTheme.titleSmall?.semiBold),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: AppSpacing.sm),

                    // ── Description ─────────────────────────────────
                    Text(description, style: context.textTheme.bodySmall?.copyWith(color: context.semanticColors.neutral60, height: 1.55)),

                    const SizedBox(height: AppSpacing.md),

                    // ── Actions ─────────────────────────────────────
                    Row(
                      children: [
                        GestureDetector(
                          onTap: onSkip,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xs),
                            child: Text('Skip', style: context.textTheme.labelMedium?.copyWith(color: context.semanticColors.neutral60)),
                          ),
                        ),
                        const Spacer(),
                        FilledButton(
                          onPressed: onNext,
                          style: FilledButton.styleFrom(
                            backgroundColor: iconColor,
                            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                            minimumSize: Size.zero,
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            shape: RoundedRectangleBorder(borderRadius: AppStyle.borderButton),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            spacing: AppSpacing.xs,
                            children: [
                              Text(_isLastStep ? 'Got it' : 'Next', style: context.textTheme.labelMedium?.copyWith(color: Colors.white)),
                              Icon(_isLastStep ? Icons.check_rounded : Icons.arrow_forward_rounded, size: 14, color: Colors.white),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
