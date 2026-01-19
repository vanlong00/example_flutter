import 'dart:typed_data';

import 'package:example/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as p;

part 'user_file_data.freezed.dart';

@freezed
abstract class UserFileData with _$UserFileData {
  const UserFileData._();

  const factory UserFileData({required String id, String? fileName, Uint8List? bytes, String? path, MelonBase? melon}) = _UserFileData;

  factory UserFileData.create({String? fileName, Uint8List? bytes, String? path, MelonBase? melon}) {
    return UserFileData(id: const Uuid().v4(), fileName: fileName, bytes: bytes, path: path, melon: melon);
  }
  factory UserFileData.fromPath(String path) {
    return UserFileData(id: const Uuid().v4(), path: path, fileName: p.basename(path));
  }
}
