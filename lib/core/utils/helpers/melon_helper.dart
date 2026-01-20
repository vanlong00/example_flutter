import 'dart:convert';
import 'dart:typed_data';

import 'package:archive/archive.dart';
import 'package:example/data/models/models.dart';

class MelonHelper {
  /// Check if file bytes represent a ZIP archive
  static bool validateZipFile(List<int> bytes) {
    // ZIP files start with PK signature (0x504B)
    if (bytes.length < 4) return false;
    return bytes[0] == 0x50 &&
        bytes[1] == 0x4B &&
        (bytes[2] == 0x03 || bytes[2] == 0x05 || bytes[2] == 0x07) &&
        (bytes[3] == 0x04 || bytes[3] == 0x06 || bytes[3] == 0x08);
  }

  /// Format MelonV3 - Extract and process V3 melmod files (ZIP archives)
  static MelonV3 formatMelonV3(Uint8List bytes) {
    // Decode the ZIP archive
    final archive = ZipDecoder().decodeBytes(bytes);

    MelonMetadataV3? metadata;
    MelonDataV3? data;
    Map<String, Uint8List>? assets;

    // Process each file in the archive
    for (final file in archive) {
      if (file.isFile) {
        final fileName = file.name;
        final fileBytes = file.content;

        // Handle specific V3 files
        if (fileName == 'MetaData') {
          final metadataString = utf8.decode(fileBytes);
          final metadataJson = jsonDecode(metadataString) as Map<String, dynamic>;
          metadata = MelonMetadataV3.fromJson(metadataJson);
        } else if (fileName == 'Data') {
          final dataString = utf8.decode(fileBytes);
          final dataJson = jsonDecode(dataString) as Map<String, dynamic>;
          data = MelonDataV3.fromJson(dataJson);
        } else {
          assets ??= {};
          assets[fileName] = fileBytes;
        }
      }
    }

    return MelonV3(data: data, metadata: metadata, assets: assets);
  }

  /// Format MelonV4 - Extract and process V4 melmod files (ZIP archives)
  static MelonV4 formatMelonV4(Uint8List bytes) {
    // Decode the ZIP archive
    final archive = ZipDecoder().decodeBytes(bytes);

    MelonMetadataV4? metadata;
    MelonDataV4? data;
    Map<String, Uint8List>? assets;

    // Process each file in the archive
    for (final file in archive) {
      if (file.isFile) {
        final fileName = file.name;
        final fileBytes = file.content;

        // Handle specific V4 files
        if (fileName == 'MetaData') {
          final metadataString = utf8.decode(fileBytes);
          final metadataJson = jsonDecode(metadataString) as Map<String, dynamic>;
          metadata = MelonMetadataV4.fromJson(metadataJson);
        } else if (fileName == 'Data') {
          final dataString = utf8.decode(fileBytes);
          final dataJson = jsonDecode(dataString) as Map<String, dynamic>;
          data = MelonDataV4.fromJson(dataJson);
        } else {
          assets ??= {};
          assets[fileName] = fileBytes;
        }
      }
    }

    return MelonV4(data: data, metadata: metadata, assets: assets);
  }
}
