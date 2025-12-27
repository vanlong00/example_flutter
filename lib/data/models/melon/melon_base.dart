import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_base.freezed.dart';
// part 'melon_base.g.dart';

@freezed
abstract class MelonBase with _$MelonBase {
  const MelonBase._();

  // const factory MelonBase.v2({MelonV2? item}) = _MelonBaseV2;

  // const factory MelonBase.v3({MelonV3? item}) = _MelonBaseV3;

  // factory MelonBase.fromJson(Map<String, dynamic> json) => _$MelonBaseFromJson(json);
}
