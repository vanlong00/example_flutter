import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_v2.freezed.dart';
part 'melon_v2.g.dart';

@freezed
abstract class MelonV2 with _$MelonV2 {
  const factory MelonV2() = _MelonV2;

  factory MelonV2.fromJson(Map<String, Object?> json) => _$MelonV2FromJson(json);
}
