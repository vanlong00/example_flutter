import 'package:design_system/design_system.dart';
import 'package:example/core/utils/utils.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc.dart';
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
      selector: (state) => state.maybeWhen(
        loaded: (files) => files.firstWhere((f) => f.id == file.id, orElse: () => file),
        orElse: () => file,
      ),
      builder: (_, fileState) {
        return Row(
          spacing: AppSpacing.md,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(color: Color(0xFFA855F7).withValues(alpha: 0.2), borderRadius: AppStyle.borderCard),
              alignment: Alignment.center,
              child: SizedBox.square(dimension: 20, child: _icon(fileState)),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(fileState.fileName ?? 'Unnamed File', style: context.textTheme.titleSmall?.semiBold),
                  Text(FileHelper.formatFileSize(fileState.bytes?.length ?? 0), style: context.textTheme.bodySmall),
                ],
              ),
            ),
            Assets.icons.regular.angleRight.image(width: 16, height: 16),
          ],
        );
      },
    );
  }

  void _onLongPress(BuildContext context, UserFileData fileState) {
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
        return Assets.icons.solid.cog.image(fit: BoxFit.contain, color: Color(0xFFA855F7));
      case MelType.melsave:
        return Assets.icons.solid.save.image(fit: BoxFit.contain, color: Color(0xFFA855F7));
      case MelType.melworld:
        return Assets.icons.solid.globeAmericas.image(fit: BoxFit.contain, color: Color(0xFFA855F7));
      case MelType.melmap:
        return Assets.icons.solid.globeAmericas.image(fit: BoxFit.contain, color: Color(0xFFA855F7));
      default:
        return Assets.icons.solid.image.image(fit: BoxFit.contain, color: Color(0xFFA855F7));
    }
    // final bytes = fileState.melon?.iconBytes;
    // if (bytes == null || bytes.isEmpty) {
    //   return FittedBox(fit: BoxFit.contain, child: Icon(Icons.image_not_supported));
    // }
    // return Image.memory(
    //   icon,
    //   filterQuality: FilterQuality.none,
    //   fit: BoxFit.contain,
    //   errorBuilder: (context, error, stackTrace) {
    //     return FittedBox(fit: BoxFit.contain, child: Icon(Icons.image_not_supported));
    //   },
    // );
  }
}
