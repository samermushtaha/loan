import 'package:flutter/material.dart';

class AppColor{
  // Light color
  static const _lightBlue = Color(0xFF244AD3);
  static const _lightBlack = Color(0xFF2B3A4B);
  static const _lightWhite = Color(0xFFFFFFFF);
  static const _lightGray = Color(0xFFA5A5A5);
  static const _lightBlue2 = Color(0xFFE8F0FF);
  static const _lightRed = Color(0xFFFF1843);
  static const _lightGreen = Color(0xFF20A02D);

  // Dark color
  static const _darkBlue2 = Color(0xFF0066CC);
  static const _darkBlue = Color(0xFF0066CC);
  static const _darkBlack = Color(0xFF1B262C);

  // Color
  static final gray = _lightGray;
  static final red = _lightRed;
  static final green = _lightGreen;

  static final light = ThemeData.light().copyWith(
    backgroundColor: _lightWhite,
    primaryColor: _lightBlue,
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: _lightBlack),
      headline2: TextStyle(color: _lightWhite),
      headline3: TextStyle(color: _lightBlue2),
      subtitle1: TextStyle(color: _lightGray),
    ),
    iconTheme: IconThemeData(color: _lightBlue),
  );

  static final dark = ThemeData.dark().copyWith(
    backgroundColor: _darkBlack,
    primaryColor: _darkBlue,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent
    ),
    textTheme: TextTheme(
      headline1: TextStyle(color: _lightWhite),
      headline2: TextStyle(color: _lightWhite),
      headline3: TextStyle(color: _darkBlue2),
      subtitle1: TextStyle(color: _lightGray),
    ),
    iconTheme: IconThemeData(color: _lightWhite),
  );

}