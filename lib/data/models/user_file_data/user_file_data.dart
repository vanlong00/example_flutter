import 'dart:typed_data';

import 'package:example/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

part 'user_file_data.freezed.dart';

@freezed
abstract class UserFileData with _$UserFileData {
  const UserFileData._();

  const factory UserFileData({required String id, String? fileName, Uint8List? bytes, String? path, MelonBase? melon, MelType? type}) = _UserFileData;

  factory UserFileData.create({String? fileName, Uint8List? bytes, required String path, MelonBase? melon, MelType? type}) {
    final melType = MelType.fromExtension(p.extension(path));
    return UserFileData(id: const Uuid().v4(), fileName: fileName, bytes: bytes, path: path, melon: melon, type: melType);
  }
  factory UserFileData.fromPath(String path) {
    final melType = MelType.fromExtension(p.extension(path));
    return UserFileData(id: const Uuid().v4(), path: path, fileName: p.basename(path), type: melType);
  }
}
