import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/cubit/browser_cubit.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';

class BreadcrumbBar extends StatelessWidget {
  const BreadcrumbBar({super.key, required this.stack, required this.onNavigateTo});

  final List<BreadcrumbEntry> stack;
  final void Function(int stackIndex) onNavigateTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colorScheme.surfaceContainerLow,
        border: Border(bottom: BorderSide(color: context.semanticColors.neutral90, width: 1)),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
              onTap: stack.isEmpty ? null : () => onNavigateTo(-1),
              borderRadius: AppStyle.borderButton,
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.xs),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSpacing.sm,
                  children: [
                    Assets.icons.solid.home.image(
                      width: 20,
                      height: 20,
                      color: stack.isNotEmpty ? context.colorScheme.onSurface : context.colorScheme.primary,
                    ),
                    Text(
                      'Home',
                      style: context.textTheme.labelLarge?.copyWith(
                        color: stack.isNotEmpty ? context.colorScheme.onSurface : context.colorScheme.primary,
                        fontWeight: stack.isEmpty ? FontWeight.w600 : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            ...List.generate(stack.length, (i) {
              final entry = stack[i];
              final isLast = i == stack.length - 1;
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.chevron_right_rounded, size: 16, color: context.semanticColors.neutral70),
                  InkWell(
                    onTap: isLast ? null : () => onNavigateTo(i),
                    borderRadius: AppStyle.borderButton,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs, vertical: 4),
                      child: Text(
                        entry.name.length > 12 ? '${entry.name.substring(0, 12)}…' : entry.name,
                        style: context.textTheme.labelLarge?.copyWith(
                          color: !isLast ? context.colorScheme.onSurface : context.colorScheme.primary,
                          fontWeight: isLast ? FontWeight.w600 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}
