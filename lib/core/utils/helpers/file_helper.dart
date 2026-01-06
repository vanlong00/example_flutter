import 'package:example/data/models/models.dart';
import 'package:file_picker/file_picker.dart';

/// Helper class for file operations
class FileHelper {
  FileHelper._();

  static Future<PickedFileData?> pickFileAsBytes({List<String>? allowedExtensions, FileType type = FileType.any}) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        withData: true, // Important: reads file into memory on Android
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        return null;
      }

      final file = result.files.first;

      // For Android: withData: true ensures bytes are available directly
      // This is memory efficient as it avoids creating temporary file copies
      if (file.bytes != null) {
        return PickedFileData.create(fileName: file.name, bytes: file.bytes!);
      }

      // TODO: iOS - May need to read from path for large files
      // Consider using file.path and reading in chunks for better memory management

      // TODO: Web - bytes should be available directly via file.bytes
      // Web platform always provides bytes without file path

      return null;
    } catch (e) {
      // Handle permission errors, IO errors, etc.
      return null;
    }
  }

  /// Picks a file with size limit to prevent memory issues
  ///
  /// [maxSizeInBytes] Maximum file size allowed (default: 10MB)
  /// Returns null if file exceeds size limit
  static Future<PickedFileData?> pickFileAsBytesWithSizeLimit({
    List<String>? allowedExtensions,
    FileType type = FileType.any,
    int maxSizeInBytes = 10 * 1024 * 1024, // 10MB default
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        withData: false, // Don't load data yet, check size first
        allowMultiple: false,
      );

      if (result == null || result.files.isEmpty) {
        return null;
      }

      final file = result.files.first;

      // Check size before loading into memory
      if (file.size > maxSizeInBytes) {
        return null; // File too large
      }

      // Now load the file data
      final resultWithData = await FilePicker.platform.pickFiles(
        type: type,
        allowedExtensions: allowedExtensions,
        withData: true,
        allowMultiple: false,
      );

      if (resultWithData?.files.first.bytes != null) {
        return PickedFileData.create(fileName: resultWithData!.files.first.name, bytes: resultWithData.files.first.bytes!);
      }

      return null;
    } catch (e) {
      return null;
    }
  }
}
