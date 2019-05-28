import 'package:flutter/material.dart';
import 'package:nirogi/src/screens/homepage.dart';
import 'package:nirogi/src/themes/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      title: 'Hami Nirogi',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
    );
  }
}
