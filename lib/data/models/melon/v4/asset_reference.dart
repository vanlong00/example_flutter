import 'package:freezed_annotation/freezed_annotation.dart';

part 'asset_reference.freezed.dart';
part 'asset_reference.g.dart';

@freezed
abstract class AssetReference with _$AssetReference {
  const factory AssetReference({@JsonKey(name: 'AssetId') String? assetId, @JsonKey(name: 'CanBeNull') bool? canBeNull}) = _AssetReference;

  factory AssetReference.fromJson(Map<String, Object?> json) => _$AssetReferenceFromJson(json);
}
