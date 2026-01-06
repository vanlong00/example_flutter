import 'package:freezed_annotation/freezed_annotation.dart';

import 'melon_data_v4.dart';

part 'melon_v4.freezed.dart';
part 'melon_v4.g.dart';

@freezed
abstract class MelonV4 with _$MelonV4 {
  const factory MelonV4({required MelonDataV4? data, required MelonV4? metadata}) = _MelonV4;

  factory MelonV4.fromJson(Map<String, Object?> json) => _$MelonV4FromJson(json);
}
