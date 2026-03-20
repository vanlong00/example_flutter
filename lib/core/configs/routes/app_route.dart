import 'package:example/core/configs/routes/key_route.dart';
import 'package:example/features/main/pages/main_page.dart';
import 'package:example/features/settings/pages/cache_setting_page.dart';
import 'package:example/features/settings/pages/settings_page.dart';
import 'package:example/features/splash/pages/splash_page.dart';
import 'package:example/features/theme/pages/theme_setting_page.dart';
import 'package:flutter/material.dart';

abstract final class AppRoute {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case KeyRoute.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case KeyRoute.settings:
        return MaterialPageRoute(builder: (_) => const SettingsPage());
      case KeyRoute.themeSetting:
        return MaterialPageRoute(builder: (_) => const ThemeSettingPage());
      case KeyRoute.cacheSetting:
        return MaterialPageRoute(builder: (_) => const CacheSettingPage());
      case KeyRoute.main:
      default:
        return MaterialPageRoute(builder: (_) => const MainPage());
    }
  }
}
