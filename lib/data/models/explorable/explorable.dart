import 'package:animated_tree_view/tree_view/tree_node.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'explorable.freezed.dart';

@freezed
sealed class Explorable with _$Explorable {
  const Explorable._();

  const factory Explorable.file({required String path, required String mimeType}) = ExplorableFile;

  const factory Explorable.folder({required String path}) = ExplorableFolder;

  static ExplorableFile createFile(String path, {required String mimeType}) => ExplorableFile(path: path, mimeType: mimeType);

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
