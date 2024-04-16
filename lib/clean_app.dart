import 'package:flutter/material.dart';
import 'package:flutter_clean_stuff/features/maths/maths.dart';

class CleanApp extends StatelessWidget {
  const CleanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean App',
      theme: ThemeData(
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(
            fontSize: 32,
          ),
        ),
      ),
      home: const MathsPage(),
    );
  }
}
