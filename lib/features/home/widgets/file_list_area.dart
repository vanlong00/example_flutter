import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_melon_item.dart';
import 'file_shimmer_item.dart';

class FileListArea extends StatelessWidget {
  const FileListArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageFileBloc, ManageFileState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || !listEquals(prev.displayedFiles, curr.displayedFiles) || !listEquals(prev.existingFiles, curr.existingFiles),
      builder: (context, state) => switch (state.status) {
        ManageFileStatus.initial => _buildEmptyList(context),
        ManageFileStatus.loading => _buildLoadingGrid(state.existingFiles),
        ManageFileStatus.loaded => _buildFileGrid(context, state.displayedFiles),
        ManageFileStatus.error => _buildError(context, state),
      },
    );
  }

  Widget _buildLoadingGrid(List<UserFileData> existingFiles) {
    final int shimmerCount = existingFiles.isEmpty ? 6 : 2;
    final bool isTablet = Device.screenType == ScreenType.tablet;
    final int crossAxisCount = isTablet ? 2 : 1;
    final double spacing = AppSpacing.md;
    final double childAspectRatio = (100.w - (crossAxisCount - 1) * spacing - 2 * spacing) / crossAxisCount / 48;

    return GridView.builder(
      itemCount: existingFiles.length + shimmerCount,
      padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.md),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) {
        if (index < existingFiles.length) {
          return FileMelonItem(key: ValueKey(existingFiles[index]), file: existingFiles[index], index: index);
        }
        return const FileShimmerItem();
      },
    );
  }

  Widget _buildFileGrid(BuildContext context, List<UserFileData> displayedFiles) {
    if (displayedFiles.isEmpty) {
      return _buildEmptyList(context);
    }
    final bool isTablet = Device.screenType == ScreenType.tablet;
    final int crossAxisCount = isTablet ? 2 : 1;
    final double spacing = AppSpacing.md;
    final double childAspectRatio = (100.w - (crossAxisCount - 1) * spacing - 2 * spacing) / crossAxisCount / 48;

    return GridView.builder(
      itemCount: displayedFiles.length,
      physics: const ScrollPhysics(),
      padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.md),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) => FileMelonItem(key: ValueKey(displayedFiles[index]), file: displayedFiles[index], index: index),
    );
  }

  Center _buildEmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.regular.folderOpen.image(width: 96, height: 96, color: colorSub(context)),
          SizedBox(height: AppSpacing.md),
          Text('No Files Found', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Upload your first file to get started',
            style: context.textTheme.bodyMedium?.copyWith(color: colorSub(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color colorSub(BuildContext context) => context.semanticColors.neutral400;

  Center _buildError(BuildContext context, ManageFileState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.regular.timesCircle.image(width: 96, height: 96, color: colorSub(context)),
          SizedBox(height: AppSpacing.md),
          Text('Oops! Something went wrong on our end', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Please try again later',
            style: context.textTheme.bodyMedium?.copyWith(color: colorSub(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
