import 'dart:typed_data';

import 'package:example/data/models/models.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'melon_base.freezed.dart';

@freezed
abstract class MelonBase with _$MelonBase {
  const MelonBase._();

  const factory MelonBase.v4(MelonV4 item) = _MelonBaseV4;
  const factory MelonBase.v3(MelonV3 item) = _MelonBaseV3;
  const factory MelonBase.v2(MelonV2 item) = _MelonBaseV2;

  Uint8List get iconBytes {
    return when(
      v4: (item) => Uint8List.fromList(item.assets?["Icon"] ?? []),
      v3: (item) => Uint8List.fromList(item.assets?["Icon"] ?? []),
      v2: (item) => Uint8List(0),
    );
  }

  int? get version {
    return when(v4: (item) => item.metadata?.version, v3: (item) => item.metadata?.version, v2: (item) => 2);
  }

  String? get uniqueId {
    return when(v4: (item) => item.metadata?.uniqueId, v3: (item) => item.metadata?.uniqueId, v2: (item) => null);
  }
}
