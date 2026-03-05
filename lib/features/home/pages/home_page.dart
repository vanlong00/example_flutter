import 'package:design_system/design_system.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/file_melon_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ManageFileBloc(), child: const _HomePageView());
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: _buildAppBar(context), body: _buildBody(context), floatingActionButton: _buildFAB(context));
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text("File Explorer"),
      actions: [
        BlocSelector<ManageFileBloc, ManageFileState, bool>(
          selector: (state) => state.maybeWhen(loaded: (files) => files.isNotEmpty, orElse: () => false),
          builder: (context, hasFiles) => hasFiles ? _buildClearButton(context) : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildClearButton(BuildContext context) {
    return IconButton(onPressed: () => context.read<ManageFileBloc>().add(const ManageFileEvent.clearFile()), icon: const Icon(Icons.clear_all));
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<ManageFileBloc, ManageFileState>(
      buildWhen: (previous, current) =>
          (previous.mapOrNull(loaded: (prev) => prev.files.length) ?? true) != (current.mapOrNull(loaded: (curr) => curr.files.length) ?? true),
      builder: (context, state) {
        return state.when(
          initial: _buildEmptyState,
          loading: _buildLoadingState,
          loaded: (files) => _buildLoadedState(context, files),
          error: _buildErrorState,
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return const Center(child: Text("Tap + to pick files"));
  }

  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildLoadedState(BuildContext context, List<UserFileData> files) {
    if (files.isEmpty) {
      return const Center(child: Text("No files selected"));
    }

    return ListView.builder(
      itemCount: files.length,
      physics: const ScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
      itemBuilder: (_, index) {
        final bool isLast = index == files.length - 1;
        return Padding(
          padding: EdgeInsets.only(bottom: !isLast ? AppSpacing.md : 0),
          child: FileMelonItem(key: ValueKey(files[index]), file: files[index], index: index),
        );
      },
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text(message),
        ],
      ),
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(onPressed: () => context.read<ManageFileBloc>().add(const ManageFileEvent.pickFile()), child: const Icon(Icons.add));
  }
}
