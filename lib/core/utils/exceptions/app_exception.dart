/// Base class for all user-facing exceptions in PArchiver.
abstract class AppException implements Exception {
  const AppException(this.message);
  final String message;

  @override
  String toString() => message;
}

/// File bytes could not be loaded (file_picker returned null bytes).
/// Likely cause: file was too large, picker error, or OS denied read access.
class FileReadException extends AppException {
  const FileReadException([String? name])
      : super(name != null ? 'Could not read file "$name". Try again or pick a different file.' : 'Could not read the file. Try again.');
}

/// File name is empty or contains only dots/spaces — cannot be saved.
class InvalidFileNameException extends AppException {
  const InvalidFileNameException([String? name])
      : super(name != null ? 'The file "$name" has an invalid name.' : 'The file has an invalid name and cannot be imported.');
}

/// The file does not exist at the expected path (e.g. shared file was deleted).
class FileNotFoundException extends AppException {
  const FileNotFoundException([String? path])
      : super(path != null ? 'File not found: "$path". It may have been moved or deleted.' : 'The file could not be found.');
}

/// The ZIP archive is corrupted or not a valid ZIP file.
class CorruptedArchiveException extends AppException {
  const CorruptedArchiveException([String? name])
      : super(name != null ? '"$name" is not a valid or supported archive.' : 'The archive file is corrupted or invalid.');
}

/// The ZIP archive contains no files with supported extensions.
class UnsupportedArchiveContentException extends AppException {
  const UnsupportedArchiveContentException([String? name])
      : super(
          name != null
              ? '"$name" does not contain any supported files (melmod, melsave, mcworld, etc.).'
              : 'The archive does not contain any supported files.',
        );
}

/// The file extension is not supported by the app.
class UnsupportedFileFormatException extends AppException {
  const UnsupportedFileFormatException([String? ext])
      : super(ext != null ? 'File format ".$ext" is not supported.' : 'This file format is not supported.');
}

/// A disk I/O or storage error occurred (e.g. disk full, permission denied).
class StorageException extends AppException {
  const StorageException([String? detail]) : super(detail ?? 'A storage error occurred. Check available space and try again.');
}
