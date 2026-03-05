// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonV2 _$MelonV2FromJson(Map<String, dynamic> json) => _MelonV2(
  convertVersion: (json['convertVersion'] as num).toInt(),
  modType: (json['modType'] as num).toInt(),
  uniqueId: json['uniqueId'] as String,
  type: json['type'] as String,
  category: json['category'] as String,
  customCategory: json['customCategory'] as String,
  isActivated: json['isActivated'] as bool,
  icon: (json['icon'] as List<dynamic>).map((e) => (e as num).toInt()).toList(),
  iconWidth: (json['iconWidth'] as num).toInt(),
  iconHeight: (json['iconHeight'] as num).toInt(),
  parts: (json['parts'] as List<dynamic>)
      .map((e) => PartV2.fromJson(e as Map<String, dynamic>))
      .toList(),
  modHuman: (json['modHuman'] as List<dynamic>)
      .map((e) => ModHumanV2.fromJson(e as Map<String, dynamic>))
      .toList(),
  modFirearms: (json['modFirearms'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  metadata: MelonMetadataV2.fromJson(json['metadata'] as Map<String, dynamic>),
  colorData: (json['colorData'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  scriptsData: (json['ScriptsData'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
);

Map<String, dynamic> _$MelonV2ToJson(_MelonV2 instance) => <String, dynamic>{
  'convertVersion': instance.convertVersion,
  'modType': instance.modType,
  'uniqueId': instance.uniqueId,
  'type': instance.type,
  'category': instance.category,
  'customCategory': instance.customCategory,
  'isActivated': instance.isActivated,
  'icon': instance.icon,
  'iconWidth': instance.iconWidth,
  'iconHeight': instance.iconHeight,
  'parts': instance.parts,
  'modHuman': instance.modHuman,
  'modFirearms': instance.modFirearms,
  'metadata': instance.metadata,
  'colorData': instance.colorData,
  'ScriptsData': instance.scriptsData,
};
