// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'asset_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AssetReference _$AssetReferenceFromJson(Map<String, dynamic> json) =>
    _AssetReference(
      assetId: json['AssetId'] as String?,
      canBeNull: json['CanBeNull'] as bool?,
    );

Map<String, dynamic> _$AssetReferenceToJson(_AssetReference instance) =>
    <String, dynamic>{
      'AssetId': instance.assetId,
      'CanBeNull': instance.canBeNull,
    };
