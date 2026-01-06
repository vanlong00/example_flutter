
import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/melon_color.dart';
import '../commons/melon_vector.dart';
import 'asset_reference.dart';

part 'mod_human_v4.freezed.dart';
part 'mod_human_v4.g.dart';

@freezed
abstract class ModHumanV4 with _$ModHumanV4 {
  const factory ModHumanV4({
    bool? canBlink,
    MelonColor? eyeLid,
    MelonColor? bloodColor,
    MelonVector2? eyePos,
    List<AssetReference>? secondTextures,
    List<AssetReference>? thirdTextures,
  }) = _ModHumanV4;

  factory ModHumanV4.fromJson(Map<String, Object?> json) => _$ModHumanV4FromJson(json);
}