import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/file_filter_chips.dart';
import '../widgets/file_list_area.dart';
import '../widgets/file_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ManageFileBloc(), child: const _HomePageView());
  }
}

class _HomePageView extends StatefulWidget {
  const _HomePageView();

  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  late final TextEditingController _searchController;
  late final ValueNotifier<bool> _hasSearchText;
  late final FocusNode _searchFocusNode;

  @override
  void initState() {
    super.initState();
    _searchFocusNode = FocusNode();
    _searchController = TextEditingController();
    _hasSearchText = ValueNotifier(false);
    _searchController.addListener(() {
      _hasSearchText.value = _searchController.text.isNotEmpty;
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _hasSearchText.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

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
        FileSearchBar(
          controller: _searchController,
          focusNode: _searchFocusNode,
          hasSearchText: _hasSearchText,
          onChanged: (query) => context.read<ManageFileBloc>().add(ManageFileEvent.searchChanged(query)),
          onClear: () {
            _searchController.clear();
            _searchFocusNode.unfocus();
            context.read<ManageFileBloc>().add(const ManageFileEvent.searchChanged(''));
          },
        ),
        const FileFilterChips(),
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
