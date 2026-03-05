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

  static MelonBase parseMelon(Uint8List bytes) {
    final isZipFile = validateZipFile(bytes);

    if (isZipFile) {
      // Handle V3/V4 format (ZIP archives)
      final archive = ZipDecoder().decodeBytes(bytes);

      MelonMetadataV3? metadataV3;
      MelonMetadataV4? metadataV4;
      MelonDataV3? dataV3;
      MelonDataV4? dataV4;
      Map<String, Uint8List>? assets;
      int? version;

      // Process each file in the archive
      for (final file in archive) {
        if (file.isFile) {
          final fileName = file.name;
          final fileBytes = file.content;

          if (fileName == 'MetaData') {
            final metadataString = utf8.decode(fileBytes);
            final metadataJson = jsonDecode(metadataString) as Map<String, dynamic>;
            version = metadataJson['version'] as int?;

            if (version == 4) {
              metadataV4 = MelonMetadataV4.fromJson(metadataJson);
            } else if (version == 3) {
              metadataV3 = MelonMetadataV3.fromJson(metadataJson);
            } else {
              throw Exception('Unsupported melon version: $version');
            }
          } else if (fileName == 'Data') {
            final dataString = utf8.decode(fileBytes);
            final dataJson = jsonDecode(dataString) as Map<String, dynamic>;

            if (version == 4) {
              dataV4 = MelonDataV4.fromJson(dataJson);
            } else if (version == 3) {
              dataV3 = MelonDataV3.fromJson(dataJson);
            }
          } else {
            assets ??= {};
            assets[fileName] = fileBytes;
          }
        }
      }

      if (version == 4) {
        return MelonBase.v4(MelonV4(data: dataV4, metadata: metadataV4, assets: assets));
      } else if (version == 3) {
        return MelonBase.v3(MelonV3(data: dataV3, metadata: metadataV3, assets: assets));
      } else {
        throw Exception('MetaData file not found in archive');
      }
    } else {
      // Handle V2 format (JSON file)
      try {
        final jsonString = utf8.decode(bytes);
        final jsonData = jsonDecode(jsonString) as Map<String, dynamic>;
        final melonV2 = MelonV2.fromJson(jsonData);
        return MelonBase.v2(melonV2);
      } catch (e) {
        throw Exception('Failed to parse V2 melon format: $e');
      }
    }
  }
}
