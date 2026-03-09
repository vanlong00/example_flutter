import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/file_list_area.dart';

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
    return Scaffold(
      appBar: AppBar(title: const Text('File Explorer'), centerTitle: false, surfaceTintColor: Colors.transparent),
      body: _buildBody(context),
      floatingActionButton: _buildFAB(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.sm),
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              Text('FILES', style: context.textTheme.labelLarge?.withColor(context.semanticColors.neutral600)),
              BlocBuilder<ManageFileBloc, ManageFileState>(
                buildWhen: (previous, current) => previous.displayedFiles.length != current.displayedFiles.length,
                builder: (context, state) {
                  return Text('(${state.displayedFiles.length})', style: context.textTheme.labelLarge?.withColor(context.semanticColors.neutral600));
                },
              ),
            ],
          ),
        ),
        const Expanded(child: FileListArea()),
      ],
    );
  }

  Widget _buildFAB(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => context.read<ManageFileBloc>().add(const ManageFileEvent.pickFile()),
      backgroundColor: context.colorScheme.primary,
      child: Assets.icons.solid.plus.image(width: 24, height: 24, color: context.colorScheme.onPrimary),
    );
  }
}
