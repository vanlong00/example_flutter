// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_metadata_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonMetadataV3 _$MelonMetadataV3FromJson(Map<String, dynamic> json) =>
    _MelonMetadataV3(
      isActivated: json['isActivated'] as bool?,
      uniqueId: json['uniqueId'] as String?,
      modType: (json['modType'] as num?)?.toInt(),
      category: json['category'] as String?,
      customCategory: json['customCategory'] as String?,
      type: json['type'] as String?,
      version: (json['version'] as num?)?.toInt(),
      appVersion: json['appVersion'] as String?,
      changedTimestamp: (json['ChangedTimestamp'] as num?)?.toInt(),
      icon: json['Icon'] == null
          ? null
          : AssetReferenceV3.fromJson(json['Icon'] as Map<String, dynamic>),
      workshopMetadata: json['WorkshopMetadata'],
    );

Map<String, dynamic> _$MelonMetadataV3ToJson(_MelonMetadataV3 instance) =>
    <String, dynamic>{
      'isActivated': instance.isActivated,
      'uniqueId': instance.uniqueId,
      'modType': instance.modType,
      'category': instance.category,
      'customCategory': instance.customCategory,
      'type': instance.type,
      'version': instance.version,
      'appVersion': instance.appVersion,
      'ChangedTimestamp': instance.changedTimestamp,
      'Icon': instance.icon,
      'WorkshopMetadata': instance.workshopMetadata,
    };
