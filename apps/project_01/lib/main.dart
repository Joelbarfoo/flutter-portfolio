import 'package:flutter/material.dart';
import 'package:project_01/presentation/advicer/advicer_page.dart';
import 'package:project_01/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
      home: AdvicerPage(),
    );
  }
}
