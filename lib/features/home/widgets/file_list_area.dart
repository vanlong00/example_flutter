import 'package:design_system/design_system.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
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
        ManageFileStatus.initial => const Center(child: Text('Tap + to pick files')),
        ManageFileStatus.loading => _buildLoadingGrid(state.existingFiles),
        ManageFileStatus.loaded => _buildFileGrid(state.displayedFiles),
        ManageFileStatus.error => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, size: 64, color: Colors.red),
              const SizedBox(height: 16),
              Text(state.errorMessage),
            ],
          ),
        ),
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
      padding: EdgeInsets.all(AppSpacing.md),
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

  Widget _buildFileGrid(List<UserFileData> displayedFiles) {
    if (displayedFiles.isEmpty) {
      return const Center(child: Text('No files found'));
    }

    final bool isTablet = Device.screenType == ScreenType.tablet;
    final int crossAxisCount = isTablet ? 2 : 1;
    final double spacing = AppSpacing.md;
    final double childAspectRatio = (100.w - (crossAxisCount - 1) * spacing - 2 * spacing) / crossAxisCount / 48;

    return GridView.builder(
      itemCount: displayedFiles.length,
      physics: const ScrollPhysics(),
      padding: EdgeInsets.all(AppSpacing.md),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (_, index) => FileMelonItem(key: ValueKey(displayedFiles[index]), file: displayedFiles[index], index: index),
    );
  }
}
