import 'package:design_system/design_system.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileFilterChips extends StatelessWidget {
  const FileFilterChips({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ManageFileBloc, ManageFileState, FileFilter>(
      selector: (state) => state.activeFilter,
      builder: (context, activeFilter) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
        child: Row(
          children: FileFilter.values.map((filter) {
            return Padding(
              padding: EdgeInsets.only(right: AppSpacing.xs),
              child: ChoiceChip(
                label: Text(filter.label),
                selected: filter == activeFilter,
                onSelected: (_) => context.read<ManageFileBloc>().add(ManageFileEvent.filterChanged(filter)),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
