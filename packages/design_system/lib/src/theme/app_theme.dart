import 'package:flutter/material.dart';
import 'color_schemes.dart';
import 'text_theme.dart';

/// Main theme configuration for the design system
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: AppColorSchemes.light,
      textTheme: AppTextTheme.textTheme,
      extensions: const [AppSemanticColors.light],
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: AppColorSchemes.dark,
      textTheme: AppTextTheme.textTheme,
      extensions: const [AppSemanticColors.dark],
    );
  }
}
