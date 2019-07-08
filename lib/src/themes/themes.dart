import 'package:flutter/material.dart';

final ThemeData kLightTheme = _buildLightTheme();

ThemeData _buildLightTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    highlightColor: Colors.grey[400].withOpacity(.6),
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(color: Colors.red[700]),
      elevation: 0,
    ),
    primaryColor: Colors.white,
    accentColor: Colors.blue,
    primaryIconTheme: IconThemeData(
      color: Colors.red[700],
    ),
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red[700],
        ),
      ),
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
      button: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontSize: 12,
        letterSpacing: 2,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    buttonColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
  );
}

final ThemeData kDarkTheme = _buildDarkTheme();

ThemeData _buildDarkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(
        fontSize: 14,
        color: Colors.black,
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.normal,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red[700],
        ),
      ),
    ),
    buttonColor: Colors.white,
    buttonTheme: ButtonThemeData(
      buttonColor: Colors.white,
    ),
    highlightColor: Colors.white24,
    appBarTheme: AppBarTheme(
      iconTheme: IconThemeData(
        color: Colors.red[700],
      ),
      elevation: 0.0,
    ),
    primaryColor: Color(0xff212121),
    scaffoldBackgroundColor: Color(0xff212121),
    canvasColor: Color(0xff303030),
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
      button: TextStyle(
        fontFamily: 'Montserrat',
        fontWeight: FontWeight.w600,
        color: Colors.white,
        fontSize: 17,
        letterSpacing: 2,
      ),
    ),
  );
}
