import 'dart:typed_data';

import 'package:archive/archive.dart';
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

  static const _melExtensions = ['melmod', 'melsave', 'melmap', 'melworld'];

  static Future<List<UserFileData>> selectFileFormat() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['bin', 'zip'],
        withData: true, // Important: reads file into memory on Android
        allowMultiple: false,
      );

      if (result == null || result.files.length != 1) {
        // User canceled
        throw Exception('User canceled file selection');
      }

      final file = result.files.first;
      final extension = p.extension(file.name).toLowerCase().replaceFirst('.', '');

      switch (extension) {
        case 'zip':
          return await _extractZipFile(file);
        case 'melmod':
        case 'melsave':
        case 'melmap':
        case 'melworld':
          return [await handleFile(file)];
        default:
          throw UnsupportedError('Unsupported file format: .$extension');
      }
    } catch (e) {
      debugPrint('Error selecting file: $e');
      return [];
    }
  }

  static Future<List<UserFileData>> _extractZipFile(PlatformFile file) async {
    if (file.bytes == null) throw Exception('File bytes are null');

    final zipName = p.basenameWithoutExtension(file.name);
    final archive = ZipDecoder().decodeBytes(file.bytes!);
    final results = <UserFileData>[];

    for (final entry in archive) {
      if (!entry.isFile) continue;
      if (!_isValidExtension(entry.name, _melExtensions)) continue;

      final bytes = Uint8List.fromList(entry.content as List<int>);
      final basename = p.basenameWithoutExtension(entry.name).trimLeft().trimRight();
      final extension = p.extension(entry.name);
      if (basename.isEmpty) continue;

      final savedFile = await StorageHelper.saveFileToCache(fileName: '$basename$extension', bytes: bytes);

      results.add(UserFileData.create(fileName: p.normalize(p.basename(savedFile.path)), bytes: bytes, path: savedFile.path, sourceZip: zipName));
    }

    return results;
  }

  static Future<UserFileData> handleFile(PlatformFile file) async {
    if (file.bytes == null) {
      throw Exception('File bytes are null');
    }
    final bytes = Uint8List.fromList(file.bytes!);
    final basename = p.basenameWithoutExtension(file.name).trimLeft().trimRight();
    final extension = p.extension(file.name);
    if (basename.isEmpty) {
      throw Exception('File name is empty after trimming');
    }
    final savedFile = await StorageHelper.saveFileToCache(fileName: '$basename$extension', bytes: bytes);

    return UserFileData.create(fileName: p.normalize(p.basename(savedFile.path)), bytes: file.bytes!, path: savedFile.path);
  }

  static bool _isValidExtension(String fileName, List<String> allowedExtensions) {
    final extension = p.extension(fileName).toLowerCase().replaceFirst('.', '');
    return allowedExtensions.map((e) => e.toLowerCase()).contains(extension);
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
}
