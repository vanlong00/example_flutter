import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExplorableFolderWidget extends StatelessWidget {
  const ExplorableFolderWidget({super.key, required this.folder, this.onTap});

  final ExplorableFolder folder;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final itemCount = folder.children.length;
    return InkWell(
      borderRadius: AppStyle.borderCard,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xs),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            Container(
              height: 44,
              width: 44,
              decoration: BoxDecoration(color: Colors.pinkAccent.withValues(alpha: 0.15), borderRadius: AppStyle.borderCard),
              alignment: Alignment.center,
              child: SizedBox.square(
                dimension: 24,
                child: Assets.icons.solid.folder.image(color: Colors.pinkAccent, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpacing.xs,
                children: [
                  _FolderName(name: folder.name, style: context.textTheme.titleSmall?.medium),
                  Text(
                    '$itemCount ${itemCount == 1 ? 'item' : 'items'} • ${FileHelper.formatFileSize(folder.totalSize)}',
                    style: context.textTheme.labelSmall?.copyWith(color: context.semanticColors.neutral50),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              surfaceTintColor: Colors.transparent,
              splashRadius: AppStyle.radiusExtraLarge * 2,
              onSelected: (value) async {
                switch (value) {
                  case 'delete':
                    final confirmed = await AppHelper.showConfirmDeleteDialog(
                      context,
                      title: 'Delete Folder?',
                      message: 'This folder will be permanently deleted.\nAre you sure you want to delete it?',
                      confirmText: 'Delete',
                      icon: Icons.delete_outline_rounded,
                      isDestructive: true,
                    );
                    if (confirmed && context.mounted) {
                      context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(item: folder));
                    }
                }
              },
              itemBuilder: (_) {
                final iconSize = context.textTheme.labelSmall!.fontSize! * context.textTheme.labelSmall!.height!;
                return [
                  PopupMenuItem(
                    value: 'delete',
                    height: iconSize + 12,
                    padding: EdgeInsets.zero,
                    child: Row(
                      spacing: AppSpacing.sm,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.feat.trash.image(width: iconSize, height: iconSize, color: AppSemanticColors.light.destructive),
                        Text('Delete', style: context.textTheme.labelSmall?.withColor(AppSemanticColors.light.destructive)),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _FolderName extends StatelessWidget {
  const _FolderName({required this.name, required this.style});

  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final dotIndex = name.lastIndexOf('.');
    final baseName = dotIndex > 0 ? name.substring(0, dotIndex) : name;
    final ext = dotIndex > 0 ? name.substring(dotIndex) : name.substring(baseName.length - 4).trim();
    return Row(
      children: [
        Flexible(
          child: Text(baseName.trim(), style: style, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        if (ext.isNotEmpty) Text(ext, style: style, maxLines: 1),
      ],
    );
  }
}
