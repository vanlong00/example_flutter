import 'dart:io';

import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'explorable.freezed.dart';

@freezed
sealed class Explorable with _$Explorable {
  const Explorable._();

  const factory Explorable.file({required String path, required String mimeType, required DateTime createdAt, required int size}) = ExplorableFile;

  const factory Explorable.folder({required String path}) = ExplorableFolder;

  static Future<ExplorableFile> createFile(String path, {required String mimeType}) async {
    final stat = await FileStat.stat(path);
    return ExplorableFile(path: path, mimeType: mimeType, createdAt: stat.changed, size: stat.size);
  }

  static ExplorableFolder createFolder(String path) => ExplorableFolder(path: path);
}

typedef ExplorableNode = TreeNode<Explorable>;

typedef FileNode = TreeNode<ExplorableFile>;

typedef FolderNode = TreeNode<ExplorableFolder>;

extension ExplorableNodeExtension on ExplorableNode {
  Icon get icon {
    if (isRoot) return const Icon(Icons.data_object);

    if (this is FolderNode) {
      if (isExpanded) return const Icon(Icons.folder_open);
      return const Icon(Icons.folder);
    }

    if (this is FileNode) {
      final file = data as ExplorableFile;
      if (file.mimeType.startsWith("image")) return const Icon(Icons.image);
      if (file.mimeType.startsWith("video")) return const Icon(Icons.video_file);
    }

    return const Icon(Icons.insert_drive_file);
  }

  String get name {
    if (isRoot) return "Root";

    return p.basename((data as ExplorableFile).path);
  }
}

extension ExplorableFileExtension on ExplorableFile {
  String get name => p.basename(path);
}

extension ExplorableFolderExtension on ExplorableFolder {
  String get name => p.basename(path);
}

extension FolderNodeExtension on FolderNode {
  int get totalSize {
    int sum = 0;
    for (final child in children.values) {
      if (child is FileNode) {
        sum += child.data?.size ?? 0;
      } else if (child is FolderNode) {
        sum += child.totalSize;
      }
    }
    return sum;
  }
}
