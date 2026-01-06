// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_human_v4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModHumanV4 _$ModHumanV4FromJson(Map<String, dynamic> json) => _ModHumanV4(
  canBlink: json['canBlink'] as bool?,
  eyeLid: json['eyeLid'] == null
      ? null
      : MelonColor.fromJson(json['eyeLid'] as Map<String, dynamic>),
  bloodColor: json['bloodColor'] == null
      ? null
      : MelonColor.fromJson(json['bloodColor'] as Map<String, dynamic>),
  eyePos: json['eyePos'] == null
      ? null
      : MelonVector2.fromJson(json['eyePos'] as Map<String, dynamic>),
  secondTextures: (json['secondTextures'] as List<dynamic>?)
      ?.map((e) => AssetReference.fromJson(e as Map<String, dynamic>))
      .toList(),
  thirdTextures: (json['thirdTextures'] as List<dynamic>?)
      ?.map((e) => AssetReference.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ModHumanV4ToJson(_ModHumanV4 instance) =>
    <String, dynamic>{
      'canBlink': instance.canBlink,
      'eyeLid': instance.eyeLid,
      'bloodColor': instance.bloodColor,
      'eyePos': instance.eyePos,
      'secondTextures': instance.secondTextures,
      'thirdTextures': instance.thirdTextures,
    };
