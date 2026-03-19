import 'package:design_system/design_system.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/cubit/browser_cubit.dart';
import 'package:example/features/home/cubit/search_cubit.dart';
import 'package:example/features/home/widgets/breadcrumb_bar.dart';
import 'package:example/features/home/widgets/explorable_file_widget.dart';
import 'package:example/features/home/widgets/explorable_folder_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoadedView extends StatelessWidget {
  const LoadedView({super.key, required this.items, required this.scrollController});

  final List<Explorable> items;
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<BrowserCubit, List<BreadcrumbEntry>>(
      listener: (context, _) => context.read<SearchCubit>().clear(),
      child: BlocBuilder<BrowserCubit, List<BreadcrumbEntry>>(
        builder: (context, navStack) {
          final browser = context.read<BrowserCubit>();
          final children = browser.currentChildren(items);
          final navKey = navStack.map((e) => e.path).join('/');

          return Column(
            children: [
              BreadcrumbBar(
                stack: navStack,
                onNavigateTo: (index) {
                  scrollController.jumpTo(0);
                  browser.navigateTo(index);
                },
              ),
              Expanded(
                child: BlocBuilder<SearchCubit, String>(
                  builder: (context, query) {
                    final filtered = query.isEmpty
                        ? children
                        : children.where((e) {
                            final name = switch (e) {
                              ExplorableFile f => f.name,
                              ExplorableFolder f => f.name,
                            };
                            return name.toLowerCase().contains(query.toLowerCase());
                          }).toList();

                    return _AnimatedFileList(
                      key: ValueKey(navKey),
                      children: filtered,
                      scrollController: scrollController,
                      onFolderTap: (folder) {
                        scrollController.jumpTo(0);
                        browser.navigateInto(folder);
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AnimatedFileList extends StatefulWidget {
  const _AnimatedFileList({
    super.key,
    required this.children,
    required this.scrollController,
    required this.onFolderTap,
  });

  final List<Explorable> children;
  final ScrollController scrollController;
  final void Function(ExplorableFolder) onFolderTap;

  @override
  State<_AnimatedFileList> createState() => _AnimatedFileListState();
}

class _AnimatedFileListState extends State<_AnimatedFileList> {
  final _listKey = GlobalKey<AnimatedListState>();
  late List<Explorable> _items;

  @override
  void initState() {
    super.initState();
    _items = List.from(widget.children);
  }

  @override
  void didUpdateWidget(_AnimatedFileList oldWidget) {
    super.didUpdateWidget(oldWidget);
    _diffAndAnimate(oldWidget.children, widget.children);
  }

  void _diffAndAnimate(List<Explorable> oldList, List<Explorable> newList) {
    final oldPaths = oldList.map((e) => e.path).toSet();
    final newPaths = newList.map((e) => e.path).toSet();

    for (final path in oldPaths.difference(newPaths)) {
      final index = _items.indexWhere((e) => e.path == path);
      if (index < 0) continue;
      final removed = _items.removeAt(index);
      _listKey.currentState?.removeItem(
        index,
        (context, animation) => _buildTransition(removed, animation),
        duration: const Duration(milliseconds: 280),
      );
    }

    for (final item in newList.where((e) => !oldPaths.contains(e.path))) {
      final index = newList.indexWhere((e) => e.path == item.path).clamp(0, _items.length);
      _items.insert(index, item);
      _listKey.currentState?.insertItem(index, duration: const Duration(milliseconds: 320));
    }
  }

  Widget _buildTransition(Explorable item, Animation<double> animation) {
    final curved = CurvedAnimation(parent: animation, curve: Curves.easeInOut);
    return SizeTransition(
      sizeFactor: curved,
      child: SlideTransition(
        position: Tween<Offset>(begin: const Offset(0, -0.5), end: Offset.zero).animate(curved),
        child: FadeTransition(
          opacity: curved,
          child: Padding(
            padding: const EdgeInsets.only(bottom: AppSpacing.sm),
            child: _buildItem(item),
          ),
        ),
      ),
    );
  }

  Widget _buildItem(Explorable item) => switch (item) {
    ExplorableFile f => ExplorableFileWidget(file: f),
    ExplorableFolder f => ExplorableFolderWidget(folder: f, onTap: () => widget.onFolderTap(f)),
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _listKey,
      controller: widget.scrollController,
      padding: const EdgeInsets.only(
        left: AppSpacing.md,
        right: AppSpacing.md,
        bottom: AppSpacing.x2l,
        top: AppSpacing.sm,
      ),
      initialItemCount: _items.length,
      itemBuilder: (context, index, animation) => _buildTransition(_items[index], animation),
    );
  }
}
