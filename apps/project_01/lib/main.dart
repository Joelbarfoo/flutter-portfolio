import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_01/application/bloc/advicer_bloc.dart';
import 'package:project_01/injection.dart';
import 'package:project_01/presentation/advicer/advicer_page.dart';
import 'package:project_01/theme.dart';
import 'package:project_01/injection.dart' as di; // di == dependency injection

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
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
      home: BlocProvider(
        create: (context) => sl<AdvicerBloc>(),
        child: AdvicerPage(),
      ),
    );
  }
}
