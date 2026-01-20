// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_v3.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonV3 _$MelonV3FromJson(Map<String, dynamic> json) => _MelonV3(
  data: json['data'] == null
      ? null
      : MelonDataV3.fromJson(json['data'] as Map<String, dynamic>),
  metadata: json['metadata'] == null
      ? null
      : MelonMetadataV3.fromJson(json['metadata'] as Map<String, dynamic>),
  assets: (json['assets'] as Map<String, dynamic>?)?.map(
    (k, e) => MapEntry(
      k,
      (e as List<dynamic>).map((e) => (e as num).toInt()).toList(),
    ),
  ),
);

Map<String, dynamic> _$MelonV3ToJson(_MelonV3 instance) => <String, dynamic>{
  'data': instance.data,
  'metadata': instance.metadata,
  'assets': instance.assets,
};
