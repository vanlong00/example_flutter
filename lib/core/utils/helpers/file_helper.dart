import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:example/data/models/models.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;

import 'storage_helper.dart';

/// Helper class for file operations
class FileHelper {
  FileHelper._();

  static Future<void> clearTemporaryFiles() async {
    await FilePicker.platform.clearTemporaryFiles();
    await StorageHelper.clearTemporaryFiles();
  }

  static const _allowedExtensions = ['melmod', 'melsave', 'melmap', 'melworld', 'mcworld', 'mcpack', 'mcaddon', 'mctemplate', 'mcstructure'];

  static Future<FilePickerResult?> pickSingleFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['bin', 'zip'],
      withData: true, // Important: reads file into memory on Android
      allowMultiple: false,
    );
    return result;
  }

  static Future<FileNode> handleFileV2(PlatformFile file) async {
    if (file.bytes == null) throw Exception('File bytes are null');

    final basename = p.basenameWithoutExtension(file.name).trimLeft().trimRight();
    final extension = p.extension(file.name);
    if (basename.isEmpty) {
      throw Exception('File name is empty after trimming');
    }
    final savedFile = await StorageHelper.saveFileToCache(path: '$basename$extension', bytes: file.bytes!);

    return FileNode(data: await Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream"));
  }

  static Future<FolderNode> handleZipFileV2(PlatformFile file) async {
    if (file.bytes == null) throw Exception('File bytes are null');

    String zipName = p.basenameWithoutExtension(file.name);
    final Directory tempDir = await StorageHelper.saveDirToCache(name: zipName);
    zipName = p.basename(tempDir.path);

    final archive = ZipDecoder().decodeBytes(file.bytes!);
    final nodes = await _buildNodesFromArchive(archive, zipName, filterByExtension: true);
    final folderNode = FolderNode(data: Explorable.createFolder(zipName));
    folderNode.addAll(nodes);
    return folderNode;
  }

  static bool _isValidExtension(String fileName) {
    final extension = p.extension(fileName).toLowerCase().replaceFirst('.', '');
    return _allowedExtensions.map((e) => e.toLowerCase()).contains(extension);
  }

  /// Opens a file with the system's app chooser using open_file package
  /// Supports: Android, iOS, macOS, Linux, Windows, Web
  static Future<OpenResult> openWith(String filePath) async {
    return OpenFile.open(filePath, type: 'application/octet-stream');
  }

  /// Opens multiple files sequentially with the system's app chooser
  static Future<List<OpenResult>> openWithMultiple(List<String> filePaths) async {
    final results = <OpenResult>[];
    for (final path in filePaths) {
      results.add(await openWith(path));
    }
    return results;
  }

  /// Formats a byte count into a human-readable string (B, KB, MB, GB, TB).
  static String formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    if (bytes < 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
    if (bytes < 1024 * 1024 * 1024 * 1024) return '${(bytes / (1024 * 1024 * 1024)).toStringAsFixed(2)} GB';
    return '${(bytes / (1024 * 1024 * 1024 * 1024)).toStringAsFixed(2)} TB';
  }

  /// Handles a shared file path (from receive_sharing_intent) by copying it to
  /// the app cache and returning a [FileNode].
  static Future<FileNode> handleSharedFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) throw Exception('Shared file not found: $filePath');
    final bytes = await file.readAsBytes();
    final basename = p.basenameWithoutExtension(p.basename(filePath)).trimLeft().trimRight();
    final extension = p.extension(filePath);
    if (basename.isEmpty) throw Exception('Shared file name is empty');
    final savedFile = await StorageHelper.saveFileToCache(path: '$basename$extension', bytes: bytes);
    return FileNode(data: await Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream"));
  }

  /// Handles a shared ZIP file path by extracting its contents into the app
  /// cache and returning a [FolderNode].
  static Future<FolderNode> handleSharedZip(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) throw Exception('Shared ZIP not found: $filePath');
    final bytes = await file.readAsBytes();
    String zipName = p.basenameWithoutExtension(p.basename(filePath));
    final Directory tempDir = await StorageHelper.saveDirToCache(name: zipName);
    zipName = p.basename(tempDir.path);
    final archive = ZipDecoder().decodeBytes(bytes);
    final nodes = await _buildNodesFromArchive(archive, zipName);
    final folderNode = FolderNode(data: Explorable.createFolder(zipName));
    folderNode.addAll(nodes);
    return folderNode;
  }

  static Future<List<ExplorableNode>> _buildNodesFromArchive(Archive archive, String cachePrefix, {bool filterByExtension = false}) async {
    final List<ExplorableNode> rootFiles = [];
    final Map<String, List<FileNode>> dirMap = {};

    // Detect a single root folder wrapping all ZIP entries (e.g. "WP-V3/")
    // so it can be stripped and cachePrefix used as the true root.
    String? zipRoot;
    for (final e in archive.where((e) => e.isFile && !e.name.startsWith('__MACOSX/'))) {
      final firstSep = e.name.indexOf('/');
      final candidate = firstSep > 0 ? e.name.substring(0, firstSep) : '';
      if (zipRoot == null) {
        zipRoot = candidate;
      } else if (zipRoot != candidate) {
        zipRoot = ''; // mixed roots — no common wrapper
        break;
      }
    }

    for (final entry in archive.where((e) => e.isFile && !e.name.startsWith('__MACOSX/') && !p.basename(e.name).startsWith('.'))) {
      if (filterByExtension && !_isValidExtension(entry.name)) continue;

      // Strip the common root wrapper (e.g. "WP-V3/file.melmod" → "file.melmod")
      final entryRelPath = (zipRoot != null && zipRoot.isNotEmpty) ? entry.name.substring(zipRoot.length + 1) : entry.name;
      if (entryRelPath.isEmpty) continue;

      final entryBasename = p.basenameWithoutExtension(entryRelPath).trimLeft().trimRight();
      final entryExtension = p.extension(entryRelPath);
      if (entryBasename.isEmpty) continue;

      final dirName = p.dirname(entryRelPath);
      final isTopLevel = dirName == '.' || dirName.isEmpty || dirName == '/';

      final cachePath = isTopLevel ? '$cachePrefix/$entryBasename$entryExtension' : '$cachePrefix/$dirName/$entryBasename$entryExtension';

      final entryBytes = Uint8List.fromList(entry.content as List<int>);
      final savedFile = await StorageHelper.saveFileToCache(path: cachePath, bytes: entryBytes);
      final fileNode = FileNode(data: await Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream"));

      if (isTopLevel) {
        rootFiles.add(fileNode);
      } else {
        final topDir = p.split(dirName).first;
        dirMap.putIfAbsent(topDir, () => []).add(fileNode);
      }
    }

    final nodes = <ExplorableNode>[...rootFiles];
    for (final dirEntry in dirMap.entries) {
      final folderCachePath = '$cachePrefix/${dirEntry.key}';
      final subFolder = FolderNode(data: Explorable.createFolder(folderCachePath));
      subFolder.addAll(dirEntry.value);
      nodes.add(subFolder);
    }
    return nodes;
  }
}
