import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/melon_vector.dart';
import 'asset_reference.dart';

part 'part_v4.freezed.dart';
part 'part_v4.g.dart';

@freezed
abstract class PartV4 with _$PartV4 {
  const factory PartV4({
    AssetReference? mainTexture,
    bool? pixelsPerUnit,
    List<String>? colliderJson,
    Object? glowMap,
    MelonVector3? grabPosition,
    bool? canBeTaken,
    bool? canGlow,
    bool? canBurn,
    bool? canFloat,
    @JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer,
  }) = _PartV4;

  factory PartV4.fromJson(Map<String, Object?> json) => _$PartV4FromJson(json);
}
