// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_v4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartV4 _$PartV4FromJson(Map<String, dynamic> json) => _PartV4(
  mainTexture: json['mainTexture'] == null
      ? null
      : AssetReference.fromJson(json['mainTexture'] as Map<String, dynamic>),
  pixelsPerUnit: json['pixelsPerUnit'] as bool?,
  colliderJson: (json['colliderJson'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toList(),
  glowMap: json['glowMap'],
  grabPosition: json['grabPosition'] == null
      ? null
      : MelonVector3.fromJson(json['grabPosition'] as Map<String, dynamic>),
  canBeTaken: json['canBeTaken'] as bool?,
  canGlow: json['canGlow'] as bool?,
  canBurn: json['canBurn'] as bool?,
  canFloat: json['canFloat'] as bool?,
  rotateViaPointer: json['RotateViaPointer'] as bool?,
);

Map<String, dynamic> _$PartV4ToJson(_PartV4 instance) => <String, dynamic>{
  'mainTexture': instance.mainTexture,
  'pixelsPerUnit': instance.pixelsPerUnit,
  'colliderJson': instance.colliderJson,
  'glowMap': instance.glowMap,
  'grabPosition': instance.grabPosition,
  'canBeTaken': instance.canBeTaken,
  'canGlow': instance.canGlow,
  'canBurn': instance.canBurn,
  'canFloat': instance.canFloat,
  'RotateViaPointer': instance.rotateViaPointer,
};
