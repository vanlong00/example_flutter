import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_color.freezed.dart';
part 'melon_color.g.dart';

@freezed
abstract class MelonColor with _$MelonColor {
  const factory MelonColor({required int r, required int g, required int b, required int a}) = _MelonColor;

  factory MelonColor.fromJson(Map<String, Object?> json) => _$MelonColorFromJson(json);
}
