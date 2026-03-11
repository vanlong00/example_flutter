import 'dart:async';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/features/theme/cubit/theme_cubit.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => ExplorableBloc(), child: _HomePageView());
  }
}

class _HomePageView extends StatefulWidget {
  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  StreamSubscription? _intentSub;
  TreeViewController<Explorable, TreeNode<Explorable>>? _treeController;

  @override
  void initState() {
    super.initState();
    _initSharingIntent();
  }

  void _initSharingIntent() {
    // Cold start: app was launched via a share action
    ReceiveSharingIntent.instance.getInitialMedia().then((files) {
      for (final f in files) {
        if (f.path.isNotEmpty) {
          context.read<ExplorableBloc>().add(ExplorableEvent.shareFile(filePath: f.path));
        }
      }
      ReceiveSharingIntent.instance.reset();
    });
    // Foreground: app already running when file is shared
    _intentSub = ReceiveSharingIntent.instance.getMediaStream().listen((files) {
      for (final f in files) {
        if (f.path.isNotEmpty) {
          context.read<ExplorableBloc>().add(ExplorableEvent.shareFile(filePath: f.path));
        }
      }
      ReceiveSharingIntent.instance.reset();
    });
  }

  void _collapseAllChildren(TreeNode<Explorable> node) {
    if (_treeController == null) return;

    for (final child in node.childrenAsList) {
      final childNode = child as TreeNode<Explorable>;
      if (childNode.childrenAsList.isNotEmpty) {
        _collapseAllChildren(childNode);
      }
      _treeController!.collapseNode(childNode);
    }
  }

  @override
  void dispose() {
    _intentSub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Management File'),
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () => _collapseAllChildren(_treeController!.tree),
            icon: Icon(Icons.unfold_less_rounded, color: context.colorScheme.onSurface),
            tooltip: 'Collapse all',
          ),
          BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              final isDark = themeState.themeMode == ThemeMode.dark;
              return IconButton(
                onPressed: () => context.read<ThemeCubit>().toggleTheme(),
                icon: Icon(isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined, color: context.colorScheme.onSurface),
                tooltip: isDark ? 'Light theme' : 'Dark theme',
              );
            },
          ),
          IconButton(
            onPressed: () => context.read<ExplorableBloc>().add(const ExplorableEvent.pickFile()),
            icon: Assets.icons.solid.plus.image(width: 20, height: 20, color: context.colorScheme.onSurface),
            tooltip: 'Add File',
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ExplorableBloc, ExplorableState>(
      builder: (context, state) {
        switch (state.status) {
          case ManageFileStatus.initial:
            return _buildEmptyList();
          case ManageFileStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case ManageFileStatus.loaded:
            return TreeView.simpleTyped<Explorable, ExplorableNode>(
              tree: state.tree,
              onTreeReady: (controller) {
                _treeController = controller;
              },
              showRootNode: false,
              expansionIndicatorBuilder: (context, node) {
                return noExpansionIndicatorBuilder(context, node);
              },
              expansionBehavior: ExpansionBehavior.none,
              indentation: Indentation(style: IndentStyle.roundJoint, width: AppSpacing.xl, color: context.semanticColors.neutral300),
              padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.md, top: AppSpacing.sm),
              builder: (context, node) {
                if (node is FileNode) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _ExplorableFileWidget(node: node),
                  );
                } else if (node is FolderNode) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                    child: _ExplorableFolderWidget(node: node, onTap: () => _treeController?.toggleExpansion(node)),
                  );
                } else {
                  return Container();
                }
              },
            );
        }
      },
    );
  }

  Center _buildEmptyList() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.regular.folderOpen.image(width: 96, height: 96, color: context.semanticColors.neutral500),
          SizedBox(height: AppSpacing.md),
          Text('No Files Found', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Upload your first file to get started',
            style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _ExplorableFileWidget extends StatelessWidget {
  const _ExplorableFileWidget({super.key, required this.node});

  final FileNode node;

  void _onTap(BuildContext context, ExplorableFile item) {
    OpenFile.open(item.path);
  }

  void _onLongPress(BuildContext context, ExplorableFile item) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx + 48 / 2, offset.dy + box.size.height, offset.dx + box.size.width, 0),
      items: [
        PopupMenuItem(
          value: 'open_with',
          child: Row(spacing: AppSpacing.sm, children: [const Icon(Icons.open_in_new, size: 18), Text('Open with')]),
        ),
        PopupMenuItem(
          value: 'delete',
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              Icon(Icons.delete_outline, size: 18, color: context.semanticColors.destructive),
              Text('Delete', style: TextStyle(color: context.semanticColors.destructive)),
            ],
          ),
        ),
      ],
    );
    if (!context.mounted) return;
    switch (selected) {
      case 'open_with':
        OpenFile.open(item.path);
        break;
      case 'delete':
        context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(node: node));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = node.data as ExplorableFile;
    return InkWell(
      onTap: () => _onTap(context, item),
      onLongPress: () => _onLongPress(context, item),
      borderRadius: AppStyle.borderExtraLarge,
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(color: Colors.indigo.withValues(alpha: 0.2), borderRadius: AppStyle.borderCard),
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: 20,
              child: Assets.icons.solid.cog.image(color: Colors.indigo, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.name, style: context.textTheme.titleSmall?.semiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  '${FileHelper.formatFileSize(item.size)} • ${_formatDate(item.createdAt.toLocal())}',
                  style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ExplorableFolderWidget extends StatelessWidget {
  const _ExplorableFolderWidget({super.key, required this.node, this.onTap});

  final FolderNode node;
  final Function()? onTap;

  void _onLongPress(BuildContext context, ExplorableFolder item) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx + 48 / 2, offset.dy + box.size.height, offset.dx + box.size.width, 0),
      items: [
        PopupMenuItem(
          value: 'delete',
          child: Row(
            spacing: AppSpacing.sm,
            children: [
              Icon(Icons.delete_outline, size: 18, color: context.semanticColors.destructive),
              Text('Delete', style: TextStyle(color: context.semanticColors.destructive)),
            ],
          ),
        ),
      ],
    );
    if (!context.mounted) return;
    switch (selected) {
      case 'delete':
        context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(node: node));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = node.data as ExplorableFolder;
    return InkWell(
      borderRadius: AppStyle.borderExtraLarge,
      onTap: onTap,
      onLongPress: () => _onLongPress(context, item),
      child: Row(
        spacing: AppSpacing.md,
        children: [
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(color: Colors.pinkAccent.withValues(alpha: 0.2), borderRadius: AppStyle.borderCard),
            alignment: Alignment.center,
            child: SizedBox.square(
              dimension: 20,
              child: Assets.icons.solid.folder.image(color: Colors.pinkAccent, fit: BoxFit.contain),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(item.name, style: context.textTheme.titleSmall?.semiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  FileHelper.formatFileSize(node.totalSize),
                  style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral500),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Row(
            spacing: AppSpacing.xs,
            children: [
              ValueListenableBuilder(
                valueListenable: node.expansionNotifier,
                builder: (_, value, child) {
                  return AnimatedRotation(
                    turns: value ? 0.25 : 0,
                    duration: const Duration(milliseconds: 200),
                    curve: Curves.easeInOut,
                    child: const Icon(Icons.chevron_right, size: 24),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

String _formatDate(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final mo = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final h = dt.hour.toString().padLeft(2, '0');
  final mi = dt.minute.toString().padLeft(2, '0');
  return '$d/$mo/$y $h:$mi';
}
