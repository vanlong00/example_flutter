import 'package:freezed_annotation/freezed_annotation.dart';

import 'asset_reference.dart';

part 'melon_metadata.freezed.dart';
part 'melon_metadata.g.dart';

@freezed
abstract class MelonMetadata with _$MelonMetadata {
  const factory MelonMetadata({
    required bool? isActivated,
    required String? uniqueId,
    required int? modType,
    required dynamic overrideId,
    required dynamic overrideFileId,
    required String? category,
    required String? customCategory,
    required String? type,
    required int? version,
    required String? appVersion,
    @JsonKey(name: 'ChangedTimestamp') required int? changedTimestamp,
    @JsonKey(name: 'Icon') required AssetReference? icon,
    @JsonKey(name: 'isCustomIcon') required bool? isCustomIcon,
    @JsonKey(name: 'templateId') required dynamic templateId,
    @JsonKey(name: 'WorkshopMetadata') required dynamic workshopMetadata,
  }) = _MelonMetadata;

  factory MelonMetadata.fromJson(Map<String, Object?> json) => _$MelonMetadataFromJson(json);
}
