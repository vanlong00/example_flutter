import 'package:example/core/configs/di/injection.dart';
import 'package:example/features/home/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'core/configs/theme.dart';

void main() {
  configureDependencies(); // Initialize DI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Flutter Demo', theme: AppTheme.lightTheme, darkTheme: AppTheme.darkTheme, home: const HomePage());
  }
}
