import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/asset_reference.dart';
import 'mod_human_v3.dart';

part 'melon_data_v3.freezed.dart';
part 'melon_data_v3.g.dart';

@freezed
abstract class MelonDataV3 with _$MelonDataV3 {
  const factory MelonDataV3({
    List<PartV3>? parts,
    List<ModHumanV3>? modHuman,
    List<dynamic>? modFirearms,
    List<dynamic>? colorData,
    @JsonKey(name: 'ScriptsData') List<dynamic>? scriptsData,
  }) = _MelonDataV3;

  factory MelonDataV3.fromJson(Map<String, Object?> json) => _$MelonDataV3FromJson(json);
}

@freezed
abstract class PartV3 with _$PartV3 {
  const factory PartV3({
    AssetReferenceV3? mainTexture,
    double? pixelsPerUnit,
    List<String>? collidersJson,
    dynamic glowMap,
    Map<String, dynamic>? grabPosition,
    bool? canBeTaken,
    bool? canGlow,
    bool? canBurn,
    bool? canFloat,
    @JsonKey(name: 'RotateViaPointer') bool? rotateViaPointer,
  }) = _PartV3;

  factory PartV3.fromJson(Map<String, Object?> json) => _$PartV3FromJson(json);
}
