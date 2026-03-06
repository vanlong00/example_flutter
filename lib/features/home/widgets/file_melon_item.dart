import 'package:design_system/design_system.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';

class FileMelonItem extends StatelessWidget {
  const FileMelonItem({super.key, required this.file, required this.index});

  final UserFileData file;
  final int index;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ManageFileBloc, ManageFileState, UserFileData>(
      selector: (state) => state.displayedFiles.firstWhere((f) => f.id == file.id, orElse: () => file),
      builder: (_, fileState) {
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onTap(context, fileState),
          child: Row(
            spacing: AppSpacing.md,
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(color: _iconColor(fileState).withValues(alpha: 0.2), borderRadius: AppStyle.borderCard),
                alignment: Alignment.center,
                child: SizedBox.square(dimension: 20, child: _icon(fileState)),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(fileState.fileName ?? 'Unnamed File', style: context.textTheme.titleSmall?.semiBold),
                    Text(
                      FileHelper.formatFileSize(fileState.bytes?.length ?? 0),
                      style: context.textTheme.bodySmall?.withColor(context.semanticColors.neutral500),
                    ),
                  ],
                ),
              ),
              Assets.icons.regular.angleRight.image(width: 16, height: 16),
            ],
          ),
        );
      },
    );
  }

  void _onTap(BuildContext context, UserFileData fileState) {
    if (fileState.path == null) return;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Open With'),
        content: Text('Open "${fileState.fileName}" with another app?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
              final result = await FileHelper.openWith(fileState.path!);
              if (context.mounted && result.type != ResultType.done) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result.message)));
              }
            },
            child: const Text('Open'),
          ),
        ],
      ),
    );
  }

  Widget _icon(UserFileData fileState) {
    switch (fileState.type) {
      case MelType.melmod:
        return Assets.icons.solid.cog.image(fit: BoxFit.contain, color: _iconColor(fileState));
      case MelType.melsave:
        return Assets.icons.solid.save.image(fit: BoxFit.contain, color: _iconColor(fileState));
      case MelType.melworld:
        return Assets.icons.solid.globeAmericas.image(fit: BoxFit.contain, color: _iconColor(fileState));
      case MelType.melmap:
        return Assets.icons.solid.globeAmericas.image(fit: BoxFit.contain, color: _iconColor(fileState));
      default:
        return Assets.icons.solid.image.image(fit: BoxFit.contain, color: _iconColor(fileState));
    }
  }

  Color _iconColor(UserFileData fileState) {
    switch (fileState.type) {
      case MelType.melworld:
        return Colors.cyan;

      default:
        return Colors.purple;
    }
  }
}
