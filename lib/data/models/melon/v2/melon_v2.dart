import 'package:freezed_annotation/freezed_annotation.dart';

import 'melon_metadata_v2.dart';
import 'mod_human_v2.dart';
import 'part_v2.dart';

part 'melon_v2.freezed.dart';
part 'melon_v2.g.dart';

@freezed
abstract class MelonV2 with _$MelonV2 {
  const factory MelonV2({
    required int convertVersion,
    required int modType,
    required String uniqueId,
    required String type,
    required String category,
    required String customCategory,
    required bool isActivated,
    required List<int> icon,
    required int iconWidth,
    required int iconHeight,
    required List<PartV2> parts,
    required List<ModHumanV2> modHuman,
    required List<Object> modFirearms,
    required MelonMetadataV2 metadata,
    required List<Object> colorData,
    @JsonKey(name: 'ScriptsData') required List<Object> scriptsData,
  }) = _MelonV2;

  factory MelonV2.fromJson(Map<String, Object?> json) => _$MelonV2FromJson(json);
}
