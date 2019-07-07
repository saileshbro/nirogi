import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/icons/splash.png',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
