// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_data_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonDataV3 _$MelonDataV3FromJson(Map<String, dynamic> json) => _MelonDataV3(
  parts: (json['parts'] as List<dynamic>?)
      ?.map((e) => PartV3.fromJson(e as Map<String, dynamic>))
      .toList(),
  modHuman: (json['modHuman'] as List<dynamic>?)
      ?.map((e) => ModHumanV3.fromJson(e as Map<String, dynamic>))
      .toList(),
  modFirearms: json['modFirearms'] as List<dynamic>?,
  colorData: json['colorData'] as List<dynamic>?,
  scriptsData: json['ScriptsData'] as List<dynamic>?,
);

Map<String, dynamic> _$MelonDataV3ToJson(_MelonDataV3 instance) =>
    <String, dynamic>{
      'parts': instance.parts,
      'modHuman': instance.modHuman,
      'modFirearms': instance.modFirearms,
      'colorData': instance.colorData,
      'ScriptsData': instance.scriptsData,
    };

_PartV3 _$PartV3FromJson(Map<String, dynamic> json) => _PartV3(
  mainTexture: json['mainTexture'] == null
      ? null
      : AssetReferenceV3.fromJson(json['mainTexture'] as Map<String, dynamic>),
  pixelsPerUnit: (json['pixelsPerUnit'] as num?)?.toDouble(),
  collidersJson: (json['collidersJson'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  glowMap: json['glowMap'],
  grabPosition: json['grabPosition'] as Map<String, dynamic>?,
  canBeTaken: json['canBeTaken'] as bool?,
  canGlow: json['canGlow'] as bool?,
  canBurn: json['canBurn'] as bool?,
  canFloat: json['canFloat'] as bool?,
  rotateViaPointer: json['RotateViaPointer'] as bool?,
);

Map<String, dynamic> _$PartV3ToJson(_PartV3 instance) => <String, dynamic>{
  'mainTexture': instance.mainTexture,
  'pixelsPerUnit': instance.pixelsPerUnit,
  'collidersJson': instance.collidersJson,
  'glowMap': instance.glowMap,
  'grabPosition': instance.grabPosition,
  'canBeTaken': instance.canBeTaken,
  'canGlow': instance.canGlow,
  'canBurn': instance.canBurn,
  'canFloat': instance.canFloat,
  'RotateViaPointer': instance.rotateViaPointer,
};
