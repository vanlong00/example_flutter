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
    required this.neutral0,
    required this.neutral10,
    required this.neutral20,
    required this.neutral30,
    required this.neutral40,
    required this.neutral50,
    required this.neutral60,
    required this.neutral70,
    required this.neutral80,
    required this.neutral90,
    required this.neutral100,
    required this.backgroundCard,
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

  // Neutral scale: 0 = darkest end, 100 = lightest end (light theme)
  // Inverted for dark theme: 0 = white, 100 = near-black
  final Color neutral0;
  final Color neutral10;
  final Color neutral20;
  final Color neutral30;
  final Color neutral40;
  final Color neutral50;
  final Color neutral60;
  final Color neutral70;
  final Color neutral80;
  final Color neutral90;
  final Color neutral100;

  final Color backgroundCard;

  // ─── Light ────────────────────────────────────────────────────────────────
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

    destructive: Color(0xFFFF0000),
    onDestructive: Color(0xFFffffff),
    destructiveContainer: Color(0xFFfee2e2),
    onDestructiveContainer: Color(0xFF991b1b),

    // Light: 0 = black → 100 = white
    neutral100: Color(0xFFFFFFFF),
    neutral90: Color(0xFFFCFCFC),
    neutral80: Color(0xFFEDEDED),
    neutral70: Color(0xFFB3B4B4),
    neutral60: Color(0xFF999B9B),
    neutral50: Color(0xFF808282),
    neutral40: Color(0xFF666968),
    neutral30: Color(0xFF4D504F),
    neutral20: Color(0xFF333736),
    neutral10: Color(0xFF1A1E1D),
    neutral0: Color(0xFF020202),

    backgroundCard: Color(0xff3b383e),
  );

  // ─── Dark ─────────────────────────────────────────────────────────────────
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

    destructive: Color(0xFFFF0000),
    onDestructive: Color(0xFF000000),
    destructiveContainer: Color(0xFF7f1d1d),
    onDestructiveContainer: Color(0xFFfca5a5),

    // Dark: 0 = white → 100 = near-black (inverted)
    neutral0: Color(0xFFFFFFFF),
    neutral10: Color(0xFFFCFCFC),
    neutral20: Color(0xFFEDEDED),
    neutral30: Color(0xFFB3B4B4),
    neutral40: Color(0xFF999B9B),
    neutral50: Color(0xFF808282),
    neutral60: Color(0xFF666968),
    neutral70: Color(0xFF4D504F),
    neutral80: Color(0xFF333736),
    neutral90: Color(0xFF1A1E1D),
    neutral100: Color(0xFF020202),

    backgroundCard: Color(0xFF35383f),
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
    Color? neutral0,
    Color? neutral10,
    Color? neutral20,
    Color? neutral30,
    Color? neutral40,
    Color? neutral50,
    Color? neutral60,
    Color? neutral70,
    Color? neutral80,
    Color? neutral90,
    Color? neutral100,
    Color? backgroundCard,
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
      neutral0: neutral0 ?? this.neutral0,
      neutral10: neutral10 ?? this.neutral10,
      neutral20: neutral20 ?? this.neutral20,
      neutral30: neutral30 ?? this.neutral30,
      neutral40: neutral40 ?? this.neutral40,
      neutral50: neutral50 ?? this.neutral50,
      neutral60: neutral60 ?? this.neutral60,
      neutral70: neutral70 ?? this.neutral70,
      neutral80: neutral80 ?? this.neutral80,
      neutral90: neutral90 ?? this.neutral90,
      neutral100: neutral100 ?? this.neutral100,
      backgroundCard: backgroundCard ?? this.backgroundCard,
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
      neutral0: Color.lerp(neutral0, other.neutral0, t)!,
      neutral10: Color.lerp(neutral10, other.neutral10, t)!,
      neutral20: Color.lerp(neutral20, other.neutral20, t)!,
      neutral30: Color.lerp(neutral30, other.neutral30, t)!,
      neutral40: Color.lerp(neutral40, other.neutral40, t)!,
      neutral50: Color.lerp(neutral50, other.neutral50, t)!,
      neutral60: Color.lerp(neutral60, other.neutral60, t)!,
      neutral70: Color.lerp(neutral70, other.neutral70, t)!,
      neutral80: Color.lerp(neutral80, other.neutral80, t)!,
      neutral90: Color.lerp(neutral90, other.neutral90, t)!,
      neutral100: Color.lerp(neutral100, other.neutral100, t)!,
      backgroundCard: Color.lerp(backgroundCard, other.backgroundCard, t)!,
    );
  }
}
