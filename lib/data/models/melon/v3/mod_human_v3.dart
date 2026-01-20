import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/melon_color.dart';
import '../commons/melon_vector.dart';
import '../commons/asset_reference.dart';

part 'mod_human_v3.freezed.dart';
part 'mod_human_v3.g.dart';

@freezed
abstract class ModHumanV3 with _$ModHumanV3 {
  const factory ModHumanV3({
    bool? canBlink,
    MelonColor? eyeLid,
    MelonColor? bloodColor,
    List<MelonVector2>? eyePos,
    List<AssetReferenceV3>? secondTextures,
    List<AssetReferenceV3>? thirdTextures,
  }) = _ModHumanV3;

  factory ModHumanV3.fromJson(Map<String, Object?> json) => _$ModHumanV3FromJson(json);
}
