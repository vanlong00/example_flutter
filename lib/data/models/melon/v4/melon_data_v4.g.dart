// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_data_v4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonDataV4 _$MelonDataV4FromJson(Map<String, dynamic> json) => _MelonDataV4(
  parts: (json['parts'] as List<dynamic>)
      .map((e) => PartV4.fromJson(e as Map<String, dynamic>))
      .toList(),
  modHuman: (json['modHuman'] as List<dynamic>)
      .map((e) => ModHumanV4.fromJson(e as Map<String, dynamic>))
      .toList(),
  modFirearms: (json['modFirearms'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  modClothes: (json['modClothes'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  colorData: (json['colorData'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
  scriptsData: (json['ScriptsData'] as List<dynamic>)
      .map((e) => e as Object)
      .toList(),
);

Map<String, dynamic> _$MelonDataV4ToJson(_MelonDataV4 instance) =>
    <String, dynamic>{
      'parts': instance.parts,
      'modHuman': instance.modHuman,
      'modFirearms': instance.modFirearms,
      'modClothes': instance.modClothes,
      'colorData': instance.colorData,
      'ScriptsData': instance.scriptsData,
    };
