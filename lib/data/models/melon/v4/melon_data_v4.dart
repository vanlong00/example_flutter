import 'package:freezed_annotation/freezed_annotation.dart';

import 'mod_human_v4.dart';
import 'part_v4.dart';

part 'melon_data_v4.freezed.dart';
part 'melon_data_v4.g.dart';

@freezed
abstract class MelonDataV4 with _$MelonDataV4 {
  const factory MelonDataV4({
    required List<PartV4> parts,
    required List<ModHumanV4> modHuman,
    required List<Object> modFirearms,
    required List<Object> modClothes,
    required List<Object> colorData,
    @JsonKey(name: 'ScriptsData') required List<Object> scriptsData,
  }) = _MelonDataV4;

  factory MelonDataV4.fromJson(Map<String, Object?> json) => _$MelonDataV4FromJson(json);
}
