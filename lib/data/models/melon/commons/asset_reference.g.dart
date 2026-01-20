// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetReferenceV4 _$AssetReferenceV4FromJson(Map<String, dynamic> json) =>
    _AssetReferenceV4(
      assetId: json['AssetId'] as String?,
      canBeNull: json['CanBeNull'] as bool?,
    );

Map<String, dynamic> _$AssetReferenceV4ToJson(_AssetReferenceV4 instance) =>
    <String, dynamic>{
      'AssetId': instance.assetId,
      'CanBeNull': instance.canBeNull,
    };

_AssetReferenceV3 _$AssetReferenceV3FromJson(Map<String, dynamic> json) =>
    _AssetReferenceV3(assetId: json['AssetId'] as String?);

Map<String, dynamic> _$AssetReferenceV3ToJson(_AssetReferenceV3 instance) =>
    <String, dynamic>{'AssetId': instance.assetId};
