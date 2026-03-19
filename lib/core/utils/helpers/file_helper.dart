import 'dart:io';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:example/core/utils/exceptions/app_exception.dart';
import 'package:example/data/models/models.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
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
      withData: true,
      allowMultiple: false,
    );
    return result;
  }

  static Future<ExplorableFile> handleFileV2(PlatformFile file) async {
    if (file.bytes == null) throw FileReadException(file.name);

    final basename = p.basenameWithoutExtension(file.name).trimLeft().trimRight();
    final extension = p.extension(file.name);
    if (basename.isEmpty) throw InvalidFileNameException(file.name);
    final savedFile = await StorageHelper.saveFileToCache(path: '$basename$extension', bytes: file.bytes!);
    return Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream");
  }

  static Future<ExplorableFolder> handleZipFileV2(PlatformFile file) async {
    if (file.bytes == null) throw FileReadException(file.name);

    final Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(file.bytes!);
    } catch (_) {
      throw CorruptedArchiveException(file.name);
    }

    final hasValidFiles = archive.any(
      (e) =>
          e.isFile &&
          !e.name.startsWith('__MACOSX/') &&
          !p.basename(e.name).startsWith('.') &&
          _isValidExtension(e.name),
    );
    if (!hasValidFiles) throw UnsupportedArchiveContentException(file.name);

    String zipName = p.basenameWithoutExtension(file.name);
    final Directory tempDir = await StorageHelper.saveDirToCache(name: zipName);
    zipName = p.basename(tempDir.path);

    final children = await _buildItemsFromArchive(archive, zipName, filterByExtension: true);
    return Explorable.createFolder(zipName, children: children);
  }

  static bool _isValidExtension(String fileName) {
    final extension = p.extension(fileName).toLowerCase().replaceFirst('.', '');
    return _allowedExtensions.map((e) => e.toLowerCase()).contains(extension);
  }

  /// Opens a file with the system's app chooser using open_file package
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

  /// Returns color and icon for a given file path based on its extension.
  static ({Color color, IconData icon}) fileTypeStyle(String path) {
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

  /// Formats a [DateTime] to ISO 8601 style: `yyyy-MM-dd HH:mm`.
  static String formatDate(DateTime dt) {
    final y = dt.year.toString().padLeft(4, '0');
    final mo = dt.month.toString().padLeft(2, '0');
    final d = dt.day.toString().padLeft(2, '0');
    final h = dt.hour.toString().padLeft(2, '0');
    final mi = dt.minute.toString().padLeft(2, '0');
    return '$y-$mo-$d $h:$mi';
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
  /// the app cache and returning an [ExplorableFile].
  static Future<ExplorableFile> handleSharedFile(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) throw FileNotFoundException(p.basename(filePath));
    final bytes = await file.readAsBytes();
    final basename = p.basenameWithoutExtension(p.basename(filePath)).trimLeft().trimRight();
    final extension = p.extension(filePath);
    if (basename.isEmpty) throw InvalidFileNameException(p.basename(filePath));
    final savedFile = await StorageHelper.saveFileToCache(path: '$basename$extension', bytes: bytes);
    return Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream");
  }

  /// Handles a shared ZIP file path by extracting its contents into the app
  /// cache and returning an [ExplorableFolder].
  static Future<ExplorableFolder> handleSharedZip(String filePath) async {
    final file = File(filePath);
    if (!await file.exists()) throw FileNotFoundException(p.basename(filePath));
    final bytes = await file.readAsBytes();
    String zipName = p.basenameWithoutExtension(p.basename(filePath));
    final Directory tempDir = await StorageHelper.saveDirToCache(name: zipName);
    zipName = p.basename(tempDir.path);
    final Archive archive;
    try {
      archive = ZipDecoder().decodeBytes(bytes);
    } catch (_) {
      throw CorruptedArchiveException(p.basename(filePath));
    }
    final children = await _buildItemsFromArchive(archive, zipName);
    return Explorable.createFolder(zipName, children: children);
  }

  static Future<List<Explorable>> _buildItemsFromArchive(Archive archive, String cachePrefix, {bool filterByExtension = false}) async {
    final List<ExplorableFile> rootFiles = [];
    final Map<String, List<ExplorableFile>> dirMap = {};

    // Detect a single root folder wrapping all ZIP entries (e.g. "WP-V3/")
    // so it can be stripped and cachePrefix used as the true root.
    String? zipRoot;
    for (final e in archive.where((e) => e.isFile && !e.name.startsWith('__MACOSX/'))) {
      final firstSep = e.name.indexOf('/');
      final candidate = firstSep > 0 ? e.name.substring(0, firstSep) : '';
      if (zipRoot == null) {
        zipRoot = candidate;
      } else if (zipRoot != candidate) {
        zipRoot = '';
        break;
      }
    }

    for (final entry in archive.where((e) => e.isFile && !e.name.startsWith('__MACOSX/') && !p.basename(e.name).startsWith('.'))) {
      if (filterByExtension && !_isValidExtension(entry.name)) continue;

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
      final explorableFile = await Explorable.createFile(savedFile.path, mimeType: "binary/octet-stream");

      if (isTopLevel) {
        rootFiles.add(explorableFile);
      } else {
        final topDir = p.split(dirName).first;
        dirMap.putIfAbsent(topDir, () => []).add(explorableFile);
      }
    }

    final items = <Explorable>[...rootFiles];
    for (final dirEntry in dirMap.entries) {
      final folderCachePath = '$cachePrefix/${dirEntry.key}';
      items.add(Explorable.createFolder(folderCachePath, children: dirEntry.value));
    }
    return items;
  }
}
