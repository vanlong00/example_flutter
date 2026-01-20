import 'package:freezed_annotation/freezed_annotation.dart';

import '../commons/asset_reference.dart';

part 'melon_metadata_v3.freezed.dart';
part 'melon_metadata_v3.g.dart';

@freezed
abstract class MelonMetadataV3 with _$MelonMetadataV3 {
  const factory MelonMetadataV3({
    bool? isActivated,
    String? uniqueId,
    int? modType,
    String? category,
    String? customCategory,
    String? type,
    int? version,
    String? appVersion,
    @JsonKey(name: 'ChangedTimestamp') int? changedTimestamp,
    @JsonKey(name: 'Icon') AssetReferenceV3? icon,
    @JsonKey(name: 'WorkshopMetadata') dynamic workshopMetadata,
  }) = _MelonMetadataV3;

  factory MelonMetadataV3.fromJson(Map<String, Object?> json) => _$MelonMetadataV3FromJson(json);
}
