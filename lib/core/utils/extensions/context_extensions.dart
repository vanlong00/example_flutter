import 'package:design_system/design_system.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  // ─── Media Query ──────────────────────────────────────────
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenWidth => mediaQuery.size.width;
  double get screenHeight => mediaQuery.size.height;
  EdgeInsets get viewPadding => mediaQuery.viewPadding;
  EdgeInsets get viewInsets => mediaQuery.viewInsets;
  double get statusBarHeight => mediaQuery.padding.top;
  double get bottomBarHeight => mediaQuery.padding.bottom;
  double get devicePixelRatio => mediaQuery.devicePixelRatio;
  bool get isKeyboardOpen => mediaQuery.viewInsets.bottom > 0;

  // ─── Breakpoints ──────────────────────────────────────────
  bool get isMobile => screenWidth < 600;
  bool get isTablet => screenWidth >= 600 && screenWidth < 1200;
  bool get isDesktop => screenWidth >= 1200;

  // ─── Theme ────────────────────────────────────────────────
  ThemeData get theme => Theme.of(this);
  ColorScheme get colorScheme => theme.colorScheme;
  TextTheme get textTheme => theme.textTheme;
  bool get isDarkMode => theme.brightness == Brightness.dark;
  AppSemanticColors get semanticColors => theme.extension<AppSemanticColors>()!;

  // ─── Navigation ───────────────────────────────────────────
  NavigatorState get navigator => Navigator.of(this);
  void pop<T>([T? result]) => navigator.pop(result);
  bool get canPop => navigator.canPop();

  Future<T?> push<T>(Widget page) {
    return navigator.push<T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushReplacement<T>(Widget page) {
    return navigator.pushReplacement<T, T>(MaterialPageRoute(builder: (_) => page));
  }

  Future<T?> pushAndRemoveAll<T>(Widget page) {
    return navigator.pushAndRemoveUntil<T>(MaterialPageRoute(builder: (_) => page), (_) => false);
  }

  // ─── Focus ────────────────────────────────────────────────
  FocusScopeNode get focusScope => FocusScope.of(this);
  void unfocus() => focusScope.unfocus();

  // ─── Locale & Directionality ──────────────────────────────
  Locale get locale => Localizations.localeOf(this);
  TextDirection get textDirection => Directionality.of(this);
  bool get isRtl => textDirection == TextDirection.rtl;

  // ─── Scaffold ─────────────────────────────────────────────
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  void showSnackBar(String message, {bool isError = false, Duration duration = const Duration(seconds: 3), SnackBarAction? action}) {
    scaffoldMessenger
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(message), backgroundColor: isError ? colorScheme.error : colorScheme.primary, duration: duration, action: action),
      );
  }

  Future<T?> showAppDialog<T>({required Widget child, bool barrierDismissible = true}) {
    return showDialog<T>(context: this, barrierDismissible: barrierDismissible, builder: (_) => child);
  }

  Future<T?> showAppBottomSheet<T>({
    required Widget child,
    bool isScrollControlled = true,
    bool isDismissible = true,
    Color? backgroundColor,
    ShapeBorder? shape,
  }) {
    return showModalBottomSheet<T>(
      context: this,
      isScrollControlled: isScrollControlled,
      isDismissible: isDismissible,
      backgroundColor: backgroundColor ?? colorScheme.surface,
      shape: shape ?? const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16))),
      builder: (_) => child,
    );
  }
}
