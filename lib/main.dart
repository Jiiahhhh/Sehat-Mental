import 'package:flutter/material.dart';
import 'package:submission_1/splashscreen.dart';
// Import file penyakit.dart

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sehat Mental',
      theme: ThemeData(
        primaryColor: Color(0xFFAF2246),
        colorScheme: const ColorScheme.light(
          primary: Color(0xFFAF2246),
          secondary: Color(0xFFAF2246),
        ),
        fontFamily: 'Fredoka',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreen(),
    );
  }
}
