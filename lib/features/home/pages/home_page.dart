import 'package:example/data/models/picked_file_data/picked_file_data.dart';
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

  Widget _buildLoadedState(BuildContext context, List<PickedFileData> files) {
    if (files.isEmpty) {
      return const Center(child: Text("No files selected"));
    }

    return ListView.builder(
      itemCount: files.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) => _buildFileCard(context, files[index], index),
    );
  }

  Widget _buildFileCard(BuildContext context, PickedFileData file, int index) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.insert_drive_file),
        title: Text(file.fileName),
        subtitle: Text('${file.bytes.length} bytes'),
        trailing: IconButton(onPressed: () => context.read<ManageFileBloc>().add(ManageFileEvent.removeFile(index)), icon: const Icon(Icons.delete)),
      ),
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
