import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/melon_color.dart';
import '../commons/melon_vector.dart';

part 'mod_human_v2.freezed.dart';
part 'mod_human_v2.g.dart';

@freezed
abstract class ModHumanV2 with _$ModHumanV2 {
  const factory ModHumanV2({
    required bool canBlink,
    required MelonColor eyeLid,
    required MelonColor bloodColor,
    required List<MelonVector2> eyePos,
    required List<String> secondTextures,
    required List<String> thirdTextures,
  }) = _ModHumanV2;

  factory ModHumanV2.fromJson(Map<String, Object?> json) => _$ModHumanV2FromJson(json);
}
