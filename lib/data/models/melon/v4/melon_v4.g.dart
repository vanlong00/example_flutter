// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'melon_v4.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MelonV4 _$MelonV4FromJson(Map<String, dynamic> json) => _MelonV4(
  data: json['data'] == null
      ? null
      : MelonDataV4.fromJson(json['data'] as Map<String, dynamic>),
  metadata: json['metadata'] == null
      ? null
      : MelonV4.fromJson(json['metadata'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MelonV4ToJson(_MelonV4 instance) => <String, dynamic>{
  'data': instance.data,
  'metadata': instance.metadata,
};
