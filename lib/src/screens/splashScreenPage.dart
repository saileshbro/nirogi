import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 100,
          child: Image.asset(
            'assets/images/icons/splash.png',
          ),
        ),
      ),
    );
  }
}
