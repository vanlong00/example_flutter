import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmptyListView extends StatelessWidget {
  const EmptyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: AppSpacing.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withValues(alpha: 0.06)),
                ),
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withValues(alpha: 0.09)),
                ),
                Assets.icons.regular.folderOpen.image(width: 56, height: 56, color: context.colorScheme.primary),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('No Files Yet', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Tap the + button to upload your first file',
              style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral60),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton.icon(
              onPressed: () => context.read<ExplorableBloc>().add(const ExplorableEvent.pickFile()),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Add File'),
            ),
          ],
        ),
      ),
    );
  }
}
