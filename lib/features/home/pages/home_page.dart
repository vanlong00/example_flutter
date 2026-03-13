import 'dart:async';

import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/explorable_bloc/explorable_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_file/open_file.dart';
import 'package:receive_sharing_intent/receive_sharing_intent.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return _HomePageView();
  }
}

class _HomePageView extends StatefulWidget {
  @override
  State<_HomePageView> createState() => _HomePageViewState();
}

class _HomePageViewState extends State<_HomePageView> {
  StreamSubscription? _intentSub;
  TreeViewController<Explorable, TreeNode<Explorable>>? _treeController;
  final AutoScrollController _scrollController = AutoScrollController();
  final ValueNotifier<bool> _showScrollToTop = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    _initSharingIntent();
    _scrollController.addListener(() {
      final show = _scrollController.offset > 200;
      if (show != _showScrollToTop.value) _showScrollToTop.value = show;
    });
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
    _scrollController.dispose();
    _showScrollToTop.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ValueListenableBuilder<bool>(
        valueListenable: _showScrollToTop,
        builder: (_, show, child) => show
            ? FloatingActionButton.small(
                onPressed: () => _scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut),
                tooltip: 'Scroll to top',
                child: child,
              )
            : const SizedBox.shrink(),
        child: const Icon(Icons.keyboard_arrow_up_rounded),
      ),
      appBar: AppBar(
        title: const Text('Management File'),
        centerTitle: false,
        surfaceTintColor: Colors.transparent,
        actions: [
          Showcase.withWidget(
            key: TutorialKeys.addFile,
            height: 210,
            width: 284,
            overlayOpacity: 0.7,
            targetBorderRadius: BorderRadius.circular(24),
            container: TutorialCard(
              icon: Icons.file_upload_outlined,
              iconColor: context.colorScheme.primary,
              title: 'Import Files',
              description: 'Tap + to import your game mod files.\nSupports .melmod, .melsave, .mcworld, .mcpack, .mcaddon, .zip and more.',
              stepIndex: 0,
              totalSteps: 2,
              onNext: () => ShowCaseWidget.of(context).completed(TutorialKeys.addFile),
              onSkip: () => ShowCaseWidget.of(context).dismiss(),
            ),
            child: IconButton(
              onPressed: () => context.read<ExplorableBloc>().add(const ExplorableEvent.pickFile()),
              icon: Assets.icons.solid.plus.image(width: 20, height: 20, color: context.colorScheme.onSurface),
              tooltip: 'Add File',
            ),
          ),
          Showcase.withWidget(
            key: TutorialKeys.collapseAll,
            height: 210,
            width: 284,
            overlayOpacity: 0.7,
            targetBorderRadius: BorderRadius.circular(24),
            container: TutorialCard(
              icon: Icons.unfold_less_rounded,
              iconColor: const Color(0xFFE67E22),
              title: 'Collapse All',
              description: 'Collapse all expanded folders at once for a clean overview of your files.',
              stepIndex: 1,
              totalSteps: 2,
              onNext: () => ShowCaseWidget.of(context).dismiss(),
              onSkip: () => ShowCaseWidget.of(context).dismiss(),
            ),
            child: IconButton(
              onPressed: () => _collapseAllChildren(_treeController!.tree),
              icon: Icon(Icons.unfold_less_rounded, color: context.colorScheme.onSurface),
              tooltip: 'Collapse all',
            ),
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
              scrollController: _scrollController,
              indentation: Indentation(style: IndentStyle.roundJoint, width: AppSpacing.xl, color: context.semanticColors.neutral300),
              padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.x2l, top: AppSpacing.sm),
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
      child: Padding(
        padding: AppSpacing.pagePadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 140,
                  height: 140,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withValues(alpha: 0.06)),
                ),
                Container(
                  width: 104,
                  height: 104,
                  decoration: BoxDecoration(shape: BoxShape.circle, color: context.colorScheme.primary.withValues(alpha: 0.09)),
                ),
                Assets.icons.regular.folderOpen.image(width: 56, height: 56, color: context.colorScheme.primary),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Text('No Files Yet', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
            const SizedBox(height: AppSpacing.xs),
            Text(
              'Tap the + button to upload your first file',
              style: context.textTheme.bodyMedium?.copyWith(color: context.semanticColors.neutral500),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton.icon(
              onPressed: () => context.read<ExplorableBloc>().add(const ExplorableEvent.pickFile()),
              icon: const Icon(Icons.add_rounded, size: 18),
              label: const Text('Add File'),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExplorableFileWidget extends StatelessWidget {
  const _ExplorableFileWidget({required this.node});

  final FileNode node;

  void _onLongPress(BuildContext context, ExplorableFile item) async {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset offset = box.localToGlobal(Offset.zero);
    final selected = await showMenu<String>(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx + 48 / 2, offset.dy + box.size.height, offset.dx + box.size.width, 0),
      items: [
        PopupMenuItem(
          value: 'open_with',
          child: Row(spacing: AppSpacing.sm, children: [const Icon(Icons.open_in_new, size: 18), const Text('Open with')]),
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
      case 'delete':
        context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(node: node));
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = node.data as ExplorableFile;
    final typeStyle = _fileTypeStyle(item.path);
    final ext = item.name.contains('.') ? item.name.split('.').last.toUpperCase() : null;
    return InkWell(
      onTap: () => OpenFile.open(item.path),
      onLongPress: () => _onLongPress(context, item),
      borderRadius: AppStyle.borderCard,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xs),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            // icon + extension badge
            SizedBox(
              width: 48,
              height: 52,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(color: typeStyle.color.withValues(alpha: 0.12), borderRadius: AppStyle.borderCard),
                    alignment: Alignment.center,
                    child: Icon(typeStyle.icon, size: 22, color: typeStyle.color),
                  ),
                  if (ext != null)
                    Positioned(
                      bottom: 0,
                      right: -4,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: typeStyle.color,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.25), blurRadius: 4, offset: const Offset(0, 1))],
                        ),
                        child: Text(
                          ext.length > 4 ? ext.substring(0, 4) : ext,
                          style: const TextStyle(color: Colors.white, fontSize: 7, fontWeight: FontWeight.w800, letterSpacing: 0.3),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.name, style: context.textTheme.titleSmall?.semiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    '${FileHelper.formatFileSize(item.size)} • ${_formatDate(item.createdAt.toLocal())}',
                    style: context.textTheme.bodySmall?.copyWith(color: context.semanticColors.neutral500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            PopupMenuButton<String>(
              padding: EdgeInsets.zero,
              iconSize: 20,
              icon: Icon(Icons.more_vert_rounded, size: 20, color: context.semanticColors.neutral500),
              onSelected: (value) {
                switch (value) {
                  case 'open_with':
                    OpenFile.open(item.path);
                  case 'delete':
                    context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(node: node));
                }
              },
              itemBuilder: (_) => [
                PopupMenuItem(
                  value: 'open_with',
                  child: Row(spacing: AppSpacing.sm, children: [const Icon(Icons.open_in_new, size: 18), const Text('Open with')]),
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
            ),
          ],
        ),
      ),
    );
  }
}

class _ExplorableFolderWidget extends StatelessWidget {
  const _ExplorableFolderWidget({required this.node, this.onTap});

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
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = node.data as ExplorableFolder;
    final itemCount = node.childrenAsList.length;
    return InkWell(
      borderRadius: AppStyle.borderCard,
      onTap: onTap,
      onLongPress: () => _onLongPress(context, item),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xs),
        child: Row(
          spacing: AppSpacing.md,
          children: [
            Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(color: Colors.pinkAccent.withValues(alpha: 0.15), borderRadius: AppStyle.borderCard),
              alignment: Alignment.center,
              child: SizedBox.square(
                dimension: 22,
                child: Assets.icons.solid.folder.image(color: Colors.pinkAccent, fit: BoxFit.contain),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(item.name, style: context.textTheme.titleSmall?.semiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 2),
                  Text(
                    '$itemCount ${itemCount == 1 ? 'item' : 'items'} • ${FileHelper.formatFileSize(node.totalSize)}',
                    style: context.textTheme.bodySmall?.copyWith(color: context.semanticColors.neutral500),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              spacing: AppSpacing.xs,
              children: [
                PopupMenuButton<String>(
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  icon: Icon(Icons.more_vert_rounded, size: 20, color: context.semanticColors.neutral500),
                  onSelected: (value) {
                    if (value == 'delete') {
                      context.read<ExplorableBloc>().add(ExplorableEvent.removeFile(node: node));
                    }
                  },
                  itemBuilder: (_) => [
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
                ),
                ValueListenableBuilder(
                  valueListenable: node.expansionNotifier,
                  builder: (_, value, child) {
                    return AnimatedRotation(
                      turns: value ? 0.25 : 0,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOut,
                      child: Icon(Icons.chevron_right_rounded, size: 22, color: context.semanticColors.neutral500),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

({Color color, IconData icon}) _fileTypeStyle(String path) {
  final ext = path.contains('.') ? path.split('.').last.toLowerCase() : '';
  return switch (ext) {
    'pdf' => (color: Colors.red, icon: Icons.picture_as_pdf_rounded),
    'jpg' || 'jpeg' || 'png' || 'gif' || 'webp' || 'bmp' => (color: const Color(0xFF8B5CF6), icon: Icons.image_rounded),
    'mp4' || 'mov' || 'avi' || 'mkv' || 'webm' => (color: Colors.orange, icon: Icons.videocam_rounded),
    'mp3' || 'wav' || 'flac' || 'aac' || 'm4a' => (color: const Color(0xFF10B981), icon: Icons.music_note_rounded),
    'zip' || 'rar' || '7z' || 'tar' || 'gz' => (color: Colors.amber, icon: Icons.folder_zip_rounded),
    'doc' || 'docx' => (color: Colors.blue, icon: Icons.description_rounded),
    'xls' || 'xlsx' || 'csv' => (color: const Color(0xFF059669), icon: Icons.table_chart_rounded),
    'ppt' || 'pptx' => (color: Colors.deepOrange, icon: Icons.slideshow_rounded),
    'txt' || 'md' || 'log' => (color: Colors.blueGrey, icon: Icons.article_rounded),
    'apk' => (color: const Color(0xFF4CAF50), icon: Icons.android_rounded),
    _ => (color: Colors.indigo, icon: Icons.insert_drive_file_rounded),
  };
}

String _formatDate(DateTime dt) {
  final y = dt.year.toString().padLeft(4, '0');
  final mo = dt.month.toString().padLeft(2, '0');
  final d = dt.day.toString().padLeft(2, '0');
  final h = dt.hour.toString().padLeft(2, '0');
  final mi = dt.minute.toString().padLeft(2, '0');
  return '$d/$mo/$y $h:$mi';
}
