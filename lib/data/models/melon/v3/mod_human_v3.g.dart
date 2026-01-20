// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_human_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModHumanV3 _$ModHumanV3FromJson(Map<String, dynamic> json) => _ModHumanV3(
  canBlink: json['canBlink'] as bool?,
  eyeLid: json['eyeLid'] == null
      ? null
      : MelonColor.fromJson(json['eyeLid'] as Map<String, dynamic>),
  bloodColor: json['bloodColor'] == null
      ? null
      : MelonColor.fromJson(json['bloodColor'] as Map<String, dynamic>),
  eyePos: (json['eyePos'] as List<dynamic>?)
      ?.map((e) => MelonVector2.fromJson(e as Map<String, dynamic>))
      .toList(),
  secondTextures: (json['secondTextures'] as List<dynamic>?)
      ?.map((e) => AssetReferenceV3.fromJson(e as Map<String, dynamic>))
      .toList(),
  thirdTextures: (json['thirdTextures'] as List<dynamic>?)
      ?.map((e) => AssetReferenceV3.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ModHumanV3ToJson(_ModHumanV3 instance) =>
    <String, dynamic>{
      'canBlink': instance.canBlink,
      'eyeLid': instance.eyeLid,
      'bloodColor': instance.bloodColor,
      'eyePos': instance.eyePos,
      'secondTextures': instance.secondTextures,
      'thirdTextures': instance.thirdTextures,
    };
