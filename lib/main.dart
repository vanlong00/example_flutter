import 'package:example/config/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/theme.dart';
import 'features/counter/bloc/counter_bloc.dart';
import 'features/counter/pages/counter_page.dart';

void main() {
  configureDependencies(); // Initialize DI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: BlocProvider(
        create: (context) => getIt<CounterBloc>(),
        child: const CounterPage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
