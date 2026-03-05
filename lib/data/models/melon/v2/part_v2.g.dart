// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'part_v2.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PartV2 _$PartV2FromJson(Map<String, dynamic> json) => _PartV2(
  mainTexture: json['mainTexture'] as String,
  pixelsPerUnit: (json['pixelsPerUnit'] as num).toDouble(),
  mainTextureWidth: (json['mainTextureWidth'] as num).toInt(),
  mainTextureHeight: (json['mainTextureHeight'] as num).toInt(),
  collidersJson: (json['collidersJson'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  glowMap: (json['glowMap'] as List<dynamic>).map((e) => e as Object).toList(),
  grabPosition: MelonVector3.fromJson(
    json['grabPosition'] as Map<String, dynamic>,
  ),
  canBeTaken: json['canBeTaken'] as bool,
  canGlow: json['canGlow'] as bool,
  canBurn: json['canBurn'] as bool,
  canFloat: json['canFloat'] as bool,
);

Map<String, dynamic> _$PartV2ToJson(_PartV2 instance) => <String, dynamic>{
  'mainTexture': instance.mainTexture,
  'pixelsPerUnit': instance.pixelsPerUnit,
  'mainTextureWidth': instance.mainTextureWidth,
  'mainTextureHeight': instance.mainTextureHeight,
  'collidersJson': instance.collidersJson,
  'glowMap': instance.glowMap,
  'grabPosition': instance.grabPosition,
  'canBeTaken': instance.canBeTaken,
  'canGlow': instance.canGlow,
  'canBurn': instance.canBurn,
  'canFloat': instance.canFloat,
};
