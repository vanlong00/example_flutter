import 'dart:io';

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

  static Future<List<UserFileData>> selectFileFormat() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['bin', 'zip'],
        withData: true, // Important: reads file into memory on Android
        allowMultiple: false,
      );

      if (result == null || result.files.length != 1) {
        // User canceled or invalid selection
        throw Exception('No file selected or multiple files selected');
      }

      final file = result.files.first;
      final extension = p.extension(file.name).toLowerCase().replaceFirst('.', '');
      if (!_isValidExtension(file.name, ['melmod', 'melsave', 'melmap', 'zip', 'melworld'])) {
        // Invalid file extension
        throw Exception('Invalid file extension');
      }

      switch (extension) {
        case 'zip':
          // Todo: Handle zip file if needed
          return [];
        default:
          // Handle other file types if needed
          return [await handleFile(file)];
      }
    } catch (e) {
      debugPrint('Error selecting file: $e');
      return [];
    }
  }

  static Future<UserFileData> handleFile(PlatformFile file) async {
    if (file.bytes == null) {
      throw Exception('File bytes are null');
    }
    final File savedFile = await StorageHelper.saveFileToCache(fileName: p.normalize(file.name), bytes: file.bytes!);

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
}
