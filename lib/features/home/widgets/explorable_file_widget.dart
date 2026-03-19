import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

class ExplorableFileWidget extends StatelessWidget {
  const ExplorableFileWidget({super.key, required this.file});

  final ExplorableFile file;

  @override
  Widget build(BuildContext context) {
    final typeStyle = FileHelper.fileTypeStyle(file.path);
    final ext = file.name.contains('.') ? file.name.split('.').last.toUpperCase() : null;
    return InkWell(
      onTap: () => OpenFile.open(file.path),
      borderRadius: AppStyle.borderCard,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xs),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            SizedBox(
              width: 44,
              height: 48,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(color: typeStyle.color.withValues(alpha: 0.12), borderRadius: AppStyle.borderCard),
                    alignment: Alignment.center,
                    child: Icon(typeStyle.icon, size: 24, color: typeStyle.color),
                  ),
                  if (ext != null)
                    Positioned(
                      bottom: 0,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: typeStyle.color,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 4, offset: const Offset(0, 1))],
                        ),
                        child: Text(
                          ext.length > 4 ? ext.substring(0, 4) : ext,
                          style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w800, letterSpacing: 0.3),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: AppSpacing.xs,
                children: [
                  _FileName(name: file.name, style: context.textTheme.titleSmall?.medium),
                  Text(
                    '${FileHelper.formatFileSize(file.size)} • ${FileHelper.formatDate(file.createdAt.toLocal())}',
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
                  case 'open_with':
                    OpenFile.open(file.path);
                  case 'delete':
                    final confirmed = await AppHelper.showConfirmDeleteDialog(
                      context,
                      title: 'Delete File?',
                      message: 'This file will be permanently deleted.\nAre you sure you want to delete it?',
                      confirmText: 'Delete',
                      icon: Icons.delete_outline_rounded,
                      isDestructive: true,
                    );
                    if (confirmed && context.mounted) {
                      context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(item: file));
                    }
                }
              },
              itemBuilder: (_) {
                final iconSize = context.textTheme.labelSmall!.fontSize! * context.textTheme.labelSmall!.height!;
                return [
                  PopupMenuItem(
                    value: 'open_with',
                    height: iconSize + 12,
                    padding: EdgeInsets.zero,
                    child: Row(
                      spacing: AppSpacing.sm,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Assets.icons.feat.export.image(width: iconSize, height: iconSize, color: AppSemanticColors.light.neutral50),
                        Text('Open with', style: context.textTheme.labelSmall?.withColor(AppSemanticColors.light.neutral50)),
                      ],
                    ),
                  ),
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

class _FileName extends StatelessWidget {
  const _FileName({required this.name, required this.style});

  final String name;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final dotIndex = name.lastIndexOf('.');
    final baseName = dotIndex > 0 ? name.substring(0, dotIndex) : name;
    final ext = dotIndex > 0 ? name.substring(dotIndex) : '';
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(baseName, style: style, maxLines: 1, overflow: TextOverflow.ellipsis),
        ),
        if (ext.isNotEmpty) Text(ext, style: style, maxLines: 1),
      ],
    );
  }
}
