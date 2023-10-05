import 'package:flutter/material.dart';
import 'package:submission_1/homepage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'images/splashscreen.png',
            fit: BoxFit.cover,
          ),
          // Logo
          Center(
            child: Image.asset(
              'images/logo.png',
              width: 500,
              height: 500,
            ),
          ),
        ],
      ),
    );
  }
}
