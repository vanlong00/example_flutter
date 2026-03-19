import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/features/home/cubit/browser_cubit.dart';
import 'package:example/features/home/widgets/empty_list_view.dart';
import 'package:example/features/home/widgets/loaded_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FileListBody extends StatelessWidget {
  const FileListBody({super.key, required this.scrollController});

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExplorableBloc, ExplorableState>(
      listener: (context, state) {
        final browser = context.read<BrowserCubit>();
        if (state.status == ManageFileStatus.initial) {
          browser.resetToRoot();
        } else if (state.status == ManageFileStatus.loaded) {
          browser.validatePath(state.items);
        }
      },
      builder: (context, state) => switch (state.status) {
        ManageFileStatus.loading => const Center(child: CircularProgressIndicator()),
        ManageFileStatus.initial => const EmptyListView(),
        ManageFileStatus.loaded => LoadedView(items: state.items, scrollController: scrollController),
      },
    );
  }
}
