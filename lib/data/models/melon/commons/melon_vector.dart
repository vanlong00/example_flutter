import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_vector.freezed.dart';
part 'melon_vector.g.dart';

@freezed
abstract class MelonVector2 with _$MelonVector2 {
  const factory MelonVector2({required double x, required double y}) = _MelonVector2;

  factory MelonVector2.fromJson(Map<String, Object?> json) => _$MelonVector2FromJson(json);
}

@freezed
abstract class MelonVector3 with _$MelonVector3 {
  const factory MelonVector3({required double x, required double y, required double z}) = _MelonVector3;

  factory MelonVector3.fromJson(Map<String, Object?> json) => _$MelonVector3FromJson(json);
}
