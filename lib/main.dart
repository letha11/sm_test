import 'package:flutter/material.dart';
import 'package:suitmedia_test/views/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: const TextTheme(
          bodySmall: TextStyle(fontSize: 12, fontFamily: 'Poppins'),
          bodyMedium: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w500, fontFamily: 'Poppins'),
          bodyLarge: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w600, fontFamily: 'Poppins'),
        ),
      ),
      title: 'Suitmedia Test',
      home: const FirstScreen(),
    );
  }
}
