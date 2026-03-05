import 'package:flutter/material.dart';

/// Design token border radius values based on Figma Border Radius/General
class AppStyle {
  AppStyle._();

  // --- Border Radius tokens ---

  static const double radiusNone = 0;
  static const double radiusSmall = 4;
  static const double radiusMedium = 8;
  static const double radiusLarge = 12;
  static const double radiusExtraLarge = 16;
  static const double radiusRound = 100;

  // --- Semantic component radius ---

  static const double radiusButton = 8;
  static const double radiusCard = 12;
  static const double radiusInputField = 8;
  static const double radiusDialog = 16;

  // --- BorderRadius shortcuts ---

  static const BorderRadius borderNone = BorderRadius.zero;
  static const BorderRadius borderSmall = BorderRadius.all(Radius.circular(radiusSmall));
  static const BorderRadius borderMedium = BorderRadius.all(Radius.circular(radiusMedium));
  static const BorderRadius borderLarge = BorderRadius.all(Radius.circular(radiusLarge));
  static const BorderRadius borderExtraLarge = BorderRadius.all(Radius.circular(radiusExtraLarge));
  static const BorderRadius borderRound = BorderRadius.all(Radius.circular(radiusRound));

  static const BorderRadius borderButton = BorderRadius.all(Radius.circular(radiusButton));
  static const BorderRadius borderCard = BorderRadius.all(Radius.circular(radiusCard));
  static const BorderRadius borderInputField = BorderRadius.all(Radius.circular(radiusInputField));
  static const BorderRadius borderDialog = BorderRadius.all(Radius.circular(radiusDialog));

  // --- RoundedRectangleBorder shortcuts (for Material widgets) ---

  static const RoundedRectangleBorder shapeNone = RoundedRectangleBorder(borderRadius: borderNone);
  static const RoundedRectangleBorder shapeSmall = RoundedRectangleBorder(borderRadius: borderSmall);
  static const RoundedRectangleBorder shapeMedium = RoundedRectangleBorder(borderRadius: borderMedium);
  static const RoundedRectangleBorder shapeLarge = RoundedRectangleBorder(borderRadius: borderLarge);
  static const RoundedRectangleBorder shapeExtraLarge = RoundedRectangleBorder(borderRadius: borderExtraLarge);
  static const RoundedRectangleBorder shapeRound = RoundedRectangleBorder(borderRadius: borderRound);

  static const RoundedRectangleBorder shapeButton = RoundedRectangleBorder(borderRadius: borderButton);
  static const RoundedRectangleBorder shapeCard = RoundedRectangleBorder(borderRadius: borderCard);
  static const RoundedRectangleBorder shapeInputField = RoundedRectangleBorder(borderRadius: borderInputField);
  static const RoundedRectangleBorder shapeDialog = RoundedRectangleBorder(borderRadius: borderDialog);
}
