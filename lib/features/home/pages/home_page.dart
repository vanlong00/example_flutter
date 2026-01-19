import 'dart:typed_data';

import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      title: const Text("Home"),
      actions: [
        BlocBuilder<ManageFileBloc, ManageFileState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (files) => files.isNotEmpty ? _buildClearButton(context) : const SizedBox.shrink(),
              orElse: () => const SizedBox.shrink(),
            );
          },
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
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => FileMelonItem(key: ValueKey(files[index]), file: files[index], index: index),
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
      builder: (context, fileState) {
        return Card(
          child: ListTile(
            leading: Container(child: _icon(fileState)),
            title: Text(fileState.fileName ?? 'Unnamed File'),
            subtitle: Text('${fileState.bytes?.length ?? 0} bytes'),
          ),
        );
      },
    );
  }

  Widget _icon(UserFileData fileState) {
    final icon = fileState.melon?.iconBytes;
    if (icon == null || icon.isEmpty) {
      return FittedBox(fit: BoxFit.contain, child: Icon(Icons.insert_drive_file));
    }
    return Image.memory(
      icon,
      fit: BoxFit.contain,
      errorBuilder: (context, error, stackTrace) {
        return const Icon(Icons.image_not_supported);
      },
    );
  }
}
