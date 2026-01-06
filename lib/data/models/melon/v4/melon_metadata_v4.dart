import 'package:freezed_annotation/freezed_annotation.dart';

import 'asset_reference.dart';

part 'melon_metadata_v4.freezed.dart';
part 'melon_metadata_v4.g.dart';

@freezed
abstract class MelonMetadataV4 with _$MelonMetadataV4 {
  const factory MelonMetadataV4({
    bool? isActivated,
    String? uniqueId,
    int? modType,
    dynamic overrideId,
    dynamic overrideFileId,
    String? category,
    String? customCategory,
    String? type,
    int? version, 
    String? appVersion,
    @JsonKey(name: 'ChangedTimestamp') int? changedTimestamp,
    @JsonKey(name: 'Icon') AssetReference? icon,
    @JsonKey(name: 'isCustomIcon') bool? isCustomIcon,
    @JsonKey(name: 'templateId') dynamic templateId,
    @JsonKey(name: 'WorkshopMetadata') dynamic workshopMetadata,
  }) = _MelonMetadataV4;

  factory MelonMetadataV4.fromJson(Map<String, Object?> json) => _$MelonMetadataV4FromJson(json);
}
