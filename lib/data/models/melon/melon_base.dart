import 'dart:typed_data';

import 'package:example/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_base.freezed.dart';

@freezed
abstract class MelonBase with _$MelonBase {
  const MelonBase._();

  const factory MelonBase.v4(MelonV4 item) = _MelonBaseV4;
  const factory MelonBase.v2(MelonV2 item) = _MelonBaseV2;

  Uint8List get iconBytes {
    return when(
      v4: (item) => Uint8List.fromList(item.assets?["Icon"] ?? []),
      v2: (item) => Uint8List(0),
    );
  }

  // const factory MelonBase.v2({MelonV2? item}) = _MelonBaseV2;

  // const factory MelonBase.v3({MelonV3? item}) = _MelonBaseV3;

  // factory MelonBase.fromJson(Map<String, dynamic> json) => _$MelonBaseFromJson(json);

  // factory MelonBase.fromBytes(Uint8List bytes) {

  // }
}
