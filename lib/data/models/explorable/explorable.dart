import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:path/path.dart' as p;

part 'explorable.freezed.dart';

@freezed
sealed class Explorable with _$Explorable {
  const Explorable._();

  const factory Explorable.file({required String path, required String mimeType, required DateTime createdAt, required int size}) = ExplorableFile;

  const factory Explorable.folder({
    required String path,
    @Default([]) List<Explorable> children,
  }) = ExplorableFolder;

  static Future<ExplorableFile> createFile(String path, {required String mimeType}) async {
    final stat = await FileStat.stat(path);
    return ExplorableFile(path: path, mimeType: mimeType, createdAt: stat.changed, size: stat.size);
  }

  static ExplorableFolder createFolder(String path, {List<Explorable> children = const []}) =>
      ExplorableFolder(path: path, children: children);
}

extension ExplorableFileExtension on ExplorableFile {
  String get name => p.basename(path);
}

extension ExplorableFolderExtension on ExplorableFolder {
  String get name => p.basename(path);

  int get totalSize => children.fold(0, (sum, child) => switch (child) {
        ExplorableFile f => sum + f.size,
        ExplorableFolder f => sum + f.totalSize,
      });
}
