import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 192,
          width: 192,
          child: Image.asset("assets/images/logos/brand-logo-dark.png"),
        )
      ),
    );
  }
}
