import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
  appBarTheme: AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.red[700], size: 32),
    elevation: 0.0,
  ),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.black,
      fontSize: 18,
      fontFamily: "Montserrat",
      fontWeight: FontWeight.w400,
    ),
  ),
  scaffoldBackgroundColor: Colors.white,
);
final ThemeData darkTheme = ThemeData.dark();
