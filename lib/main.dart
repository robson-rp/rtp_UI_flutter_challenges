import 'package:flutter/material.dart';
import 'package:flutter_challenges/pages/fashion_app/fashion_onboarding_screen.dart';

import 'pages/calculator/calculator_main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculatorMainScreen(),
    );
  }
}
