import 'package:flutter/material.dart';

/// Text theme configuration for the design system
class AppTextTheme {
  AppTextTheme._();

  /// Material Design 3 text theme
  static const TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 57, fontWeight: FontWeight.w400, height: 1.12),
    displayMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 45, fontWeight: FontWeight.w400, height: 1.16),
    displaySmall: TextStyle(fontFamily: 'Montserrat', fontSize: 36, fontWeight: FontWeight.w400, height: 1.22),
    headlineLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 32, fontWeight: FontWeight.w400, height: 1.25),
    headlineMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 28, fontWeight: FontWeight.w400, height: 1.29),
    headlineSmall: TextStyle(fontFamily: 'Montserrat', fontSize: 24, fontWeight: FontWeight.w400, height: 1.33),
    titleLarge: TextStyle(fontFamily: 'Montserrat', fontSize: 22, fontWeight: FontWeight.w400, height: 1.27),
    titleMedium: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w500, height: 1.50),
    titleSmall: TextStyle(fontFamily: 'Montserrat', fontSize: 14, fontWeight: FontWeight.w500, height: 1.43),
    bodyLarge: TextStyle(fontFamily: 'Roboto', fontSize: 16, fontWeight: FontWeight.w400, height: 1.50),
    bodyMedium: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w400, height: 1.43),
    bodySmall: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w400, height: 1.33),
    labelLarge: TextStyle(fontFamily: 'Roboto', fontSize: 14, fontWeight: FontWeight.w500, height: 1.43),
    labelMedium: TextStyle(fontFamily: 'Roboto', fontSize: 12, fontWeight: FontWeight.w500, height: 1.33),
    labelSmall: TextStyle(fontFamily: 'Roboto', fontSize: 11, fontWeight: FontWeight.w500, height: 1.45),
  );
}
