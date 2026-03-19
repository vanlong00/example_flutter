import 'package:example/core/configs/di/injection.dart';
import 'package:flutter/material.dart';

class NavigationHelper {
  static NavigatorState get navigator => Navigator.of(context);

  static BuildContext get context => getIt<GlobalKey<NavigatorState>>().currentState!.context;

  static GlobalKey<NavigatorState> get navigatorKey => getIt<GlobalKey<NavigatorState>>();
}
