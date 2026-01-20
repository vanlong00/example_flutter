import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_reference.freezed.dart';
part 'asset_reference.g.dart';

@freezed
abstract class AssetReferenceV4 with _$AssetReferenceV4 {
  const factory AssetReferenceV4({@JsonKey(name: 'AssetId') String? assetId, @JsonKey(name: 'CanBeNull') bool? canBeNull}) = _AssetReferenceV4;

  factory AssetReferenceV4.fromJson(Map<String, Object?> json) => _$AssetReferenceV4FromJson(json);
}

@freezed
abstract class AssetReferenceV3 with _$AssetReferenceV3 {
  const factory AssetReferenceV3({@JsonKey(name: 'AssetId') String? assetId}) = _AssetReferenceV3;

  factory AssetReferenceV3.fromJson(Map<String, Object?> json) => _$AssetReferenceV3FromJson(json);
}
