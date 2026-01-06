import 'dart:typed_data';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'picked_file_data.freezed.dart';

@freezed
abstract class PickedFileData with _$PickedFileData {
  const PickedFileData._();

  const factory PickedFileData({required String id, required String fileName, required Uint8List bytes}) = _PickedFileData;

  factory PickedFileData.create({required String fileName, required Uint8List bytes}) {
    return PickedFileData(id: const Uuid().v4(), fileName: fileName, bytes: bytes);
  }
}
