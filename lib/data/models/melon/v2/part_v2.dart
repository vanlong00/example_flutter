import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/melon_vector.dart';

part 'part_v2.freezed.dart';
part 'part_v2.g.dart';

@freezed
abstract class PartV2 with _$PartV2 {
  const factory PartV2({
    required String mainTexture,
    required double pixelsPerUnit,
    required int mainTextureWidth,
    required int mainTextureHeight,
    @JsonKey(name: 'collidersJson') required List<String> collidersJson,
    required List<Object> glowMap,
    required MelonVector3 grabPosition,
    required bool canBeTaken,
    required bool canGlow,
    required bool canBurn,
    required bool canFloat,
  }) = _PartV2;

  factory PartV2.fromJson(Map<String, Object?> json) => _$PartV2FromJson(json);
}
