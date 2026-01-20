import 'package:freezed_annotation/freezed_annotation.dart';

import 'melon_data_v3.dart';
import 'melon_metadata_v3.dart';

part 'melon_v3.freezed.dart';
part 'melon_v3.g.dart';

@freezed
abstract class MelonV3 with _$MelonV3 {
  const factory MelonV3({
    required MelonDataV3? data,
    required MelonMetadataV3? metadata,

    /// Map of AssetId -> binary data for asset files
    Map<String, List<int>>? assets,
  }) = _MelonV3;

  factory MelonV3.fromJson(Map<String, Object?> json) => _$MelonV3FromJson(json);
}
