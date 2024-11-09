import 'package:flutter/material.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:minimal_launcher/presentation/screens/counter_functions_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const CounterFunctionsScreen(),
      theme: ThemeData(
        useMaterial3: true
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
