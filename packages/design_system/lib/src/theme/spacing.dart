import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

/// Design token spacing values based on Figma Spacing/Base.
///
/// Base values are plain logical pixels (Flutter already handles density).
/// Adaptive getters scale tokens up for tablet/desktop screen sizes.
class AppSpacing {
  AppSpacing._();

  // --- Base tokens (logical pixels, density-independent) ---

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double x2l = 48;
  static const double x3l = 64;

  // --- Adaptive tokens (larger on tablet/desktop) ---

  static double get _scale => Device.screenType == ScreenType.tablet ? 1.25 : 1.0;

  static double get adaptiveXs => xs * _scale;
  static double get adaptiveSm => sm * _scale;
  static double get adaptiveMd => md * _scale;
  static double get adaptiveLg => lg * _scale;
  static double get adaptiveXl => xl * _scale;
  static double get adaptiveX2l => x2l * _scale;
  static double get adaptiveX3l => x3l * _scale;

  // --- EdgeInsets helpers ---

  static EdgeInsets all(double value) => EdgeInsets.all(value);
  static const EdgeInsets allXs = EdgeInsets.all(xs);
  static const EdgeInsets allSm = EdgeInsets.all(sm);
  static const EdgeInsets allMd = EdgeInsets.all(md);
  static const EdgeInsets allLg = EdgeInsets.all(lg);
  static const EdgeInsets allXl = EdgeInsets.all(xl);

  static EdgeInsets symmetric({double horizontal = 0, double vertical = 0}) => EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);

  static const EdgeInsets horizontalSm = EdgeInsets.symmetric(horizontal: sm);
  static const EdgeInsets horizontalMd = EdgeInsets.symmetric(horizontal: md);
  static const EdgeInsets horizontalLg = EdgeInsets.symmetric(horizontal: lg);
  static const EdgeInsets horizontalXl = EdgeInsets.symmetric(horizontal: xl);

  static const EdgeInsets verticalXs = EdgeInsets.symmetric(vertical: xs);
  static const EdgeInsets verticalSm = EdgeInsets.symmetric(vertical: sm);
  static const EdgeInsets verticalMd = EdgeInsets.symmetric(vertical: md);
  static const EdgeInsets verticalLg = EdgeInsets.symmetric(vertical: lg);

  /// Page / screen padding — adaptive on tablet
  static EdgeInsets get pagePadding => EdgeInsets.symmetric(horizontal: adaptiveMd, vertical: adaptiveLg);

  // --- SizedBox gap helpers ---

  static const SizedBox gapXs = SizedBox(width: xs, height: xs);
  static const SizedBox gapSm = SizedBox(width: sm, height: sm);
  static const SizedBox gapMd = SizedBox(width: md, height: md);
  static const SizedBox gapLg = SizedBox(width: lg, height: lg);
  static const SizedBox gapXl = SizedBox(width: xl, height: xl);

  static SizedBox hGap(double value) => SizedBox(width: value);
  static SizedBox vGap(double value) => SizedBox(height: value);
}
