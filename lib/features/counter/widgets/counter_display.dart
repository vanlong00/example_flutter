import 'package:flutter/material.dart';

class CounterDisplay extends StatelessWidget {
  final int count;

  const CounterDisplay({super.key, required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('You have pushed the button this many times:'),
        Text('$count', style: Theme.of(context).textTheme.headlineMedium),
      ],
    );
  }
}
