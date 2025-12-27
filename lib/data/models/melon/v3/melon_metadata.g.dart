// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonMetadata _$MelonMetadataFromJson(Map<String, dynamic> json) =>
    _MelonMetadata(
      isActivated: json['isActivated'] as bool?,
      uniqueId: json['uniqueId'] as String?,
      modType: (json['modType'] as num?)?.toInt(),
      overrideId: json['overrideId'],
      overrideFileId: json['overrideFileId'],
      category: json['category'] as String?,
      customCategory: json['customCategory'] as String?,
      type: json['type'] as String?,
      version: (json['version'] as num?)?.toInt(),
      appVersion: json['appVersion'] as String?,
      changedTimestamp: (json['ChangedTimestamp'] as num?)?.toInt(),
      icon: json['Icon'] == null
          ? null
          : AssetReference.fromJson(json['Icon'] as Map<String, dynamic>),
      isCustomIcon: json['isCustomIcon'] as bool?,
      templateId: json['templateId'],
      workshopMetadata: json['WorkshopMetadata'],
    );

Map<String, dynamic> _$MelonMetadataToJson(_MelonMetadata instance) =>
    <String, dynamic>{
      'isActivated': instance.isActivated,
      'uniqueId': instance.uniqueId,
      'modType': instance.modType,
      'overrideId': instance.overrideId,
      'overrideFileId': instance.overrideFileId,
      'category': instance.category,
      'customCategory': instance.customCategory,
      'type': instance.type,
      'version': instance.version,
      'appVersion': instance.appVersion,
      'ChangedTimestamp': instance.changedTimestamp,
      'Icon': instance.icon,
      'isCustomIcon': instance.isCustomIcon,
      'templateId': instance.templateId,
      'WorkshopMetadata': instance.workshopMetadata,
    };
