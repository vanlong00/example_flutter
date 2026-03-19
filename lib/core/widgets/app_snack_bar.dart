import 'package:design_system/design_system.dart';
import 'package:example/core/core.dart';
import 'package:flutter/material.dart';

class AppShowSnackBar {
  final String message;
  final Duration? duration;

  AppShowSnackBar.success({required this.message, this.duration}) {
    final nature = _SuccessSnackBar.createWithMessage(message);
    SnackBarFactory.showSnackBar(nature, duration: duration);
  }

  AppShowSnackBar.error({required this.message, this.duration}) {
    final nature = _ErrorSnackBar.createWithMessage(message);
    SnackBarFactory.showSnackBar(nature, duration: duration);
  }

  AppShowSnackBar.warning({required this.message, this.duration}) {
    final nature = _WarningSnackBar.createWithMessage(message);
    SnackBarFactory.showSnackBar(nature, duration: duration);
  }

  AppShowSnackBar.info({required this.message, this.duration}) {
    final nature = _InfoSnackBar.createWithMessage(message);
    SnackBarFactory.showSnackBar(nature, duration: duration);
  }
}

class SnackBarFactory {
  static void showSnackBar(SnackBarNature snackBarNature, {Duration? duration}) {
    BuildContext context = NavigationHelper.navigator.context;
    ScaffoldMessenger.of(context).removeCurrentSnackBar();

    final snackBar = createCenterSnackBar(context, snackBarNature, duration: duration);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static SnackBar createCenterSnackBar(BuildContext context, SnackBarNature snackBarNature, {Duration? duration}) {
    return SnackBar(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.md),
      duration: duration ?? const Duration(seconds: 4),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: AppSpacing.sm,
        children: [
          Icon(snackBarNature.iconData, color: Colors.white, size: 18),
          Flexible(
            child: Text(snackBarNature.message, style: context.textTheme.bodySmall?.copyWith(color: Colors.white)),
          ),
        ],
      ),
      backgroundColor: snackBarNature.backgroundColor,
      behavior: SnackBarBehavior.floating,
    );
  }
}

abstract class SnackBarNature {
  final String message;
  final IconData iconData;
  final Color backgroundColor;

  SnackBarNature.createWithMessage(this.message, this.iconData, this.backgroundColor);
}

class _SuccessSnackBar extends SnackBarNature {
  _SuccessSnackBar.createWithMessage(String message) : super.createWithMessage(message, Icons.check_circle, Color(0xFF07BD74));
}

class _ErrorSnackBar extends SnackBarNature {
  _ErrorSnackBar.createWithMessage(String message) : super.createWithMessage(message, Icons.error_rounded, Color(0xFFF75555));
}

class _WarningSnackBar extends SnackBarNature {
  _WarningSnackBar.createWithMessage(String message) : super.createWithMessage(message, Icons.warning_rounded, Color(0xFFFF981F));
}

class _InfoSnackBar extends SnackBarNature {
  _InfoSnackBar.createWithMessage(String message) : super.createWithMessage(message, Icons.info_rounded, Color(0xFF4353FF));
}
