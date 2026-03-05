// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mod_human_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ModHumanV2 _$ModHumanV2FromJson(Map<String, dynamic> json) => _ModHumanV2(
  canBlink: json['canBlink'] as bool,
  eyeLid: MelonColor.fromJson(json['eyeLid'] as Map<String, dynamic>),
  bloodColor: MelonColor.fromJson(json['bloodColor'] as Map<String, dynamic>),
  eyePos: (json['eyePos'] as List<dynamic>)
      .map((e) => MelonVector2.fromJson(e as Map<String, dynamic>))
      .toList(),
  secondTextures: (json['secondTextures'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  thirdTextures: (json['thirdTextures'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$ModHumanV2ToJson(_ModHumanV2 instance) =>
    <String, dynamic>{
      'canBlink': instance.canBlink,
      'eyeLid': instance.eyeLid,
      'bloodColor': instance.bloodColor,
      'eyePos': instance.eyePos,
      'secondTextures': instance.secondTextures,
      'thirdTextures': instance.thirdTextures,
    };
