import 'package:animated_tree_view/animated_tree_view.dart';
import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:example/data/models/models.dart';
import 'package:example/features/home/bloc/manage_file_bloc/manage_file_bloc.dart';
import 'package:example/gen/assets.gen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'file_melon_item.dart';
import 'file_shimmer_item.dart';

class _FileNodeData {
  final UserFileData file;
  final int index;
  const _FileNodeData(this.file, this.index);
}

class _FolderNodeData {
  final String name;
  final int count;
  const _FolderNodeData(this.name, this.count);
}

class FileListArea extends StatelessWidget {
  const FileListArea({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ManageFileBloc, ManageFileState>(
      buildWhen: (prev, curr) =>
          prev.status != curr.status || !listEquals(prev.displayedFiles, curr.displayedFiles) || !listEquals(prev.existingFiles, curr.existingFiles),
      builder: (context, state) => switch (state.status) {
        ManageFileStatus.initial => _buildEmptyList(context),
        ManageFileStatus.loading => _buildLoadingList(state.existingFiles),
        ManageFileStatus.loaded => state.displayedFiles.isEmpty ? _buildEmptyList(context) : _FileTreeView(files: state.displayedFiles),
        ManageFileStatus.error => _buildError(context, state),
      },
    );
  }

  Widget _buildLoadingList(List<UserFileData> existingFiles) {
    final int shimmerCount = existingFiles.isEmpty ? 6 : 2;
    return ListView.separated(
      itemCount: existingFiles.length + shimmerCount,
      padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.md),
      separatorBuilder: (_, __) => SizedBox(height: AppSpacing.sm),
      itemBuilder: (_, index) {
        if (index < existingFiles.length) {
          return FileMelonItem(key: ValueKey(existingFiles[index]), file: existingFiles[index], index: index);
        }
        return const FileShimmerItem();
      },
    );
  }

  Center _buildEmptyList(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.regular.folderOpen.image(width: 96, height: 96, color: _colorSub(context)),
          SizedBox(height: AppSpacing.md),
          Text('No Files Found', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Upload your first file to get started',
            style: context.textTheme.bodyMedium?.copyWith(color: _colorSub(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Center _buildError(BuildContext context, ManageFileState state) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.regular.timesCircle.image(width: 96, height: 96, color: _colorSub(context)),
          SizedBox(height: AppSpacing.md),
          Text('Oops! Something went wrong on our end', style: context.textTheme.titleLarge?.semiBold, textAlign: TextAlign.center),
          SizedBox(height: AppSpacing.xs),
          Text(
            'Please try again later',
            style: context.textTheme.bodyMedium?.copyWith(color: _colorSub(context)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Color _colorSub(BuildContext context) => context.semanticColors.neutral400;
}

// ─── Tree view (stateful to manage controller + re-expand on updates) ─────────

class _FileTreeView extends StatefulWidget {
  const _FileTreeView({required this.files});

  final List<UserFileData> files;

  @override
  State<_FileTreeView> createState() => _FileTreeViewState();
}

class _FileTreeViewState extends State<_FileTreeView> {
  late TreeNode<Object?> _tree;
  TreeViewController? _controller;

  @override
  void initState() {
    super.initState();
    _tree = _buildTree(widget.files);
  }

  @override
  void didUpdateWidget(_FileTreeView oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!listEquals(oldWidget.files, widget.files)) {
      setState(() => _tree = _buildTree(widget.files));
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _controller?.expandAllChildren(_tree);
      });
    }
  }

  TreeNode<Object?> _buildTree(List<UserFileData> files) {
    final root = TreeNode<Object?>.root();
    final zipGroups = <String, List<_FileNodeData>>{};

    for (int i = 0; i < files.length; i++) {
      final f = files[i];
      if (f.sourceZip != null) {
        zipGroups.putIfAbsent(f.sourceZip!, () => []).add(_FileNodeData(f, i));
      } else {
        root.add(TreeNode<Object?>(key: f.id, data: _FileNodeData(f, i)));
      }
    }

    for (final entry in zipGroups.entries) {
      final folder = TreeNode<Object?>(key: entry.key, data: _FolderNodeData(entry.key, entry.value.length));
      for (final fd in entry.value) {
        folder.add(TreeNode<Object?>(key: fd.file.id, data: fd));
      }
      root.add(folder);
    }

    return root;
  }

  @override
  Widget build(BuildContext context) {
    return TreeView.simpleTyped<Object?, TreeNode<Object?>>(
      tree: _tree,
      showRootNode: false,
      expansionIndicatorBuilder: (context, node) {
        if (node.data is _FileNodeData) return noExpansionIndicatorBuilder(context, node);
        return ChevronIndicator.rightDown(tree: node, color: context.colorScheme.onSurface.withValues(alpha: 0.5), padding: const EdgeInsets.all(8));
      },
      indentation: Indentation(style: IndentStyle.roundJoint, width: AppSpacing.xl, color: context.semanticColors.neutral300),
      onTreeReady: (controller) {
        _controller = controller;
        controller.expandAllChildren(_tree);
      },
      padding: EdgeInsets.only(left: AppSpacing.md, right: AppSpacing.md, bottom: AppSpacing.md),
      builder: (context, node) {
        final data = node.data;
        if (data is _FileNodeData) {
          return FileMelonItem(key: ValueKey(data.file.id), file: data.file, index: data.index);
        }
        return _FolderRow(folder: data as _FolderNodeData);
      },
    );
  }
}

// ─── Folder row widget ─────────────────────────────────────────────────────────

class _FolderRow extends StatelessWidget {
  const _FolderRow({required this.folder});

  final _FolderNodeData folder;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppSpacing.xs),
      child: Row(
        spacing: AppSpacing.sm,
        children: [
          Icon(Icons.folder_zip_rounded, color: Colors.amber.shade600, size: 20),
          Expanded(
            child: Text(folder.name, style: context.textTheme.labelLarge?.semiBold, maxLines: 1, overflow: TextOverflow.ellipsis),
          ),
          Text('(${folder.count})', style: context.textTheme.labelMedium?.withColor(context.semanticColors.neutral400)),
        ],
      ),
    );
  }
}
