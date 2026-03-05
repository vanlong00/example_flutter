import 'package:flutter/material.dart';

/// Material Design 3 color schemes for the design system
class AppColorSchemes {
  AppColorSchemes._();

  /// Light color scheme
  static const ColorScheme light = ColorScheme.light(
    primary: Color(0xFF7dd421),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFFe3ff87),
    onPrimaryContainer: Color(0xFF000000),

    secondary: Color(0xFFb8e986),
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFFffffec),
    onSecondaryContainer: Color(0xFF000000),

    tertiary: Color(0xFFf2f5f0),
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFFffffff),
    onTertiaryContainer: Color(0xFF000000),

    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1C1B1F),

    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),

    outline: Color(0xFF79747E),
    outlineVariant: Color(0xFFcac4d0),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );

  /// Dark color scheme
  static const ColorScheme dark = ColorScheme.dark(
    primary: Color(0xFF7dd421),
    onPrimary: Color(0xFF000000),
    primaryContainer: Color(0xFF318800),
    onPrimaryContainer: Color(0xFFffffff),

    secondary: Color(0xFFb8e986),
    onSecondary: Color(0xFF000000),
    secondaryContainer: Color(0xFF6c9d3a),
    onSecondaryContainer: Color(0xFF000000),

    tertiary: Color(0xFFf2f5f0),
    onTertiary: Color(0xFF000000),
    tertiaryContainer: Color(0xFFa5a9a3),
    onTertiaryContainer: Color(0xFF000000),

    surface: Color(0xFF0F0F0F),
    onSurface: Color(0xFFE6E1E5),

    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),

    outline: Color(0xFF938F99),
    outlineVariant: Color(0xFF49454F),
    shadow: Color(0xFF000000),
    scrim: Color(0xFF000000),
  );
}

class AppSemanticColors extends ThemeExtension<AppSemanticColors> {
  const AppSemanticColors({
    required this.success,
    required this.onSuccess,
    required this.successContainer,
    required this.onSuccessContainer,
    required this.warning,
    required this.onWarning,
    required this.warningContainer,
    required this.onWarningContainer,
    required this.info,
    required this.onInfo,
    required this.infoContainer,
    required this.onInfoContainer,
    required this.destructive,
    required this.onDestructive,
    required this.destructiveContainer,
    required this.onDestructiveContainer,
  });

  final Color success;
  final Color onSuccess;
  final Color successContainer;
  final Color onSuccessContainer;

  final Color warning;
  final Color onWarning;
  final Color warningContainer;
  final Color onWarningContainer;

  final Color info;
  final Color onInfo;
  final Color infoContainer;
  final Color onInfoContainer;

  final Color destructive;
  final Color onDestructive;
  final Color destructiveContainer;
  final Color onDestructiveContainer;

  static const AppSemanticColors light = AppSemanticColors(
    success: Color(0xFF10b981),
    onSuccess: Color(0xFFffffff),
    successContainer: Color(0xFFd1fae5),
    onSuccessContainer: Color(0xFF065f46),
    warning: Color(0xFFf59e0b),
    onWarning: Color(0xFF000000),
    warningContainer: Color(0xFFfef3c7),
    onWarningContainer: Color(0xFF92400e),
    info: Color(0xFF3b82f6),
    onInfo: Color(0xFFffffff),
    infoContainer: Color(0xFFdbeafe),
    onInfoContainer: Color(0xFF1d4ed8),
    destructive: Color(0xFFdc2626),
    onDestructive: Color(0xFFffffff),
    destructiveContainer: Color(0xFFfee2e2),
    onDestructiveContainer: Color(0xFF991b1b),
  );

  static const AppSemanticColors dark = AppSemanticColors(
    success: Color(0xFF4ade80),
    onSuccess: Color(0xFF000000),
    successContainer: Color(0xFF064e3b),
    onSuccessContainer: Color(0xFF6ee7b7),
    warning: Color(0xFFfbbf24),
    onWarning: Color(0xFF000000),
    warningContainer: Color(0xFF92400e),
    onWarningContainer: Color(0xFFfcd34d),
    info: Color(0xFF60a5fa),
    onInfo: Color(0xFF000000),
    infoContainer: Color(0xFF1e3a8a),
    onInfoContainer: Color(0xFF93c5fd),
    destructive: Color(0xFFf87171),
    onDestructive: Color(0xFF000000),
    destructiveContainer: Color(0xFF7f1d1d),
    onDestructiveContainer: Color(0xFFfca5a5),
  );

  @override
  AppSemanticColors copyWith({
    Color? success,
    Color? onSuccess,
    Color? successContainer,
    Color? onSuccessContainer,
    Color? warning,
    Color? onWarning,
    Color? warningContainer,
    Color? onWarningContainer,
    Color? info,
    Color? onInfo,
    Color? infoContainer,
    Color? onInfoContainer,
    Color? destructive,
    Color? onDestructive,
    Color? destructiveContainer,
    Color? onDestructiveContainer,
  }) {
    return AppSemanticColors(
      success: success ?? this.success,
      onSuccess: onSuccess ?? this.onSuccess,
      successContainer: successContainer ?? this.successContainer,
      onSuccessContainer: onSuccessContainer ?? this.onSuccessContainer,
      warning: warning ?? this.warning,
      onWarning: onWarning ?? this.onWarning,
      warningContainer: warningContainer ?? this.warningContainer,
      onWarningContainer: onWarningContainer ?? this.onWarningContainer,
      info: info ?? this.info,
      onInfo: onInfo ?? this.onInfo,
      infoContainer: infoContainer ?? this.infoContainer,
      onInfoContainer: onInfoContainer ?? this.onInfoContainer,
      destructive: destructive ?? this.destructive,
      onDestructive: onDestructive ?? this.onDestructive,
      destructiveContainer: destructiveContainer ?? this.destructiveContainer,
      onDestructiveContainer: onDestructiveContainer ?? this.onDestructiveContainer,
    );
  }

  @override
  AppSemanticColors lerp(AppSemanticColors? other, double t) {
    if (other == null) return this;
    return AppSemanticColors(
      success: Color.lerp(success, other.success, t)!,
      onSuccess: Color.lerp(onSuccess, other.onSuccess, t)!,
      successContainer: Color.lerp(successContainer, other.successContainer, t)!,
      onSuccessContainer: Color.lerp(onSuccessContainer, other.onSuccessContainer, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      onWarning: Color.lerp(onWarning, other.onWarning, t)!,
      warningContainer: Color.lerp(warningContainer, other.warningContainer, t)!,
      onWarningContainer: Color.lerp(onWarningContainer, other.onWarningContainer, t)!,
      info: Color.lerp(info, other.info, t)!,
      onInfo: Color.lerp(onInfo, other.onInfo, t)!,
      infoContainer: Color.lerp(infoContainer, other.infoContainer, t)!,
      onInfoContainer: Color.lerp(onInfoContainer, other.onInfoContainer, t)!,
      destructive: Color.lerp(destructive, other.destructive, t)!,
      onDestructive: Color.lerp(onDestructive, other.onDestructive, t)!,
      destructiveContainer: Color.lerp(destructiveContainer, other.destructiveContainer, t)!,
      onDestructiveContainer: Color.lerp(onDestructiveContainer, other.onDestructiveContainer, t)!,
    );
  }
}
