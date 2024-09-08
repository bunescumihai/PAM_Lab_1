import 'package:flutter/material.dart';
import 'screens/intro_screen/intro_screen.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Currency Converter',
      home: SafeArea(child:  IntroScreen())
    );
  }
}

class MainScreen {
}
