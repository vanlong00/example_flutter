import 'package:freezed_annotation/freezed_annotation.dart';

enum MelType {
  @JsonValue('melmod')
  melmod,

  @JsonValue('melsave')
  melsave,

  @JsonValue('melworld')
  melworld,

  @JsonValue('melmap')
  melmap;

  /// Returns the file extension (without dot)
  String get extension => name;

  /// Matches a file extension string to a [MelType], or returns null
  static MelType? fromExtension(String ext) {
    final lower = ext.toLowerCase().replaceFirst('.', '');
    return MelType.values.where((e) => e.extension == lower).firstOrNull;
  }
}
