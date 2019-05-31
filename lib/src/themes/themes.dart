import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    highlightColor: Colors.grey[400].withOpacity(.6),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.red[700]),
      elevation: 0.5,
    ),
    primaryColor: Colors.white,
    accentColor: Colors.black,
    primaryIconTheme: IconThemeData(
      color: Colors.red[700],
    ),
    textTheme: TextTheme(
      headline: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
        color: Colors.black,
      ),
      body1: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      body2: TextStyle(
          fontFamily: 'Karla',
          fontWeight: FontWeight.normal,
          color: Colors.black,
          fontSize: 12),
    ),
    scaffoldBackgroundColor: Colors.white,
  );
}

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    highlightColor: Colors.white24,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.red[700],
      ),
      elevation: 0.5,
    ),
    primaryColor: Color(0xff121212),
    scaffoldBackgroundColor: Color(0xff121212),
    canvasColor: Color(0xff1e1e1e),
    accentColor: Colors.blue,
    primaryIconTheme: IconThemeData(color: Colors.black),
    textTheme: TextTheme(
      headline: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontSize: 24),
      body1: TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.normal,
          color: Colors.white,
          fontSize: 14),
      body2: TextStyle(
        fontFamily: 'Karla',
        fontWeight: FontWeight.normal,
        color: Colors.white,
        fontSize: 12,
      ),
    ),
  );
}
