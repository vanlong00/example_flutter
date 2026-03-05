import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_metadata_v2.freezed.dart';
part 'melon_metadata_v2.g.dart';

@freezed
abstract class MelonMetadataV2 with _$MelonMetadataV2 {
  const factory MelonMetadataV2({@JsonKey(name: 'ManifestId') required String manifestId, @JsonKey(name: 'Name') required String name}) =
      _MelonMetadataV2;

  factory MelonMetadataV2.fromJson(Map<String, Object?> json) => _$MelonMetadataV2FromJson(json);
}
