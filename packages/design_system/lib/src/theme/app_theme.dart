import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

/// Main theme configuration for the design system
class AppTheme {
  AppTheme._();

  /// Light theme configuration
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: AppColorSchemes.light,
      // textTheme: AppTextTheme.textTheme,
      extensions: const [AppSemanticColors.light],
      popupMenuTheme: PopupMenuThemeData(
        color: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: AppStyle.borderMedium),
        menuPadding: EdgeInsets.all(AppSpacing.md),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  /// Dark theme configuration
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: AppColorSchemes.dark,
      // textTheme: AppTextTheme.textTheme,
      extensions: const [AppSemanticColors.dark],
      popupMenuTheme: PopupMenuThemeData(
        color: Color(0xFFFFFFFF),
        shape: RoundedRectangleBorder(borderRadius: AppStyle.borderMedium),
        menuPadding: EdgeInsets.all(AppSpacing.md),
        surfaceTintColor: Colors.transparent,
      ),
    );
  }
}
