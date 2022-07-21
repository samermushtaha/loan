import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AppColor{
  // Light color
  static const _lightOrange = Color(0xFFFCDEBE);
  static const _lightBlack = Color(0xFF090909);
  static const _lightWhite = Color(0xFFFFFFFF);
  static const _lightGray = Color(0xFFA5A5A5);

  // Dark color
  static const _darkOrange = Color(0xFFFCDEBE);
  static const _darkBlack = Color(0xFFFCDEBE);
  static const _darkWhite = Color(0xFF090909);
  static const _darkGray = Color(0xFFFCDEBE);

  // Color
  static final orange = Get.isDarkMode ? _darkOrange : _lightOrange;
  static final black = Get.isDarkMode ? _darkWhite : _lightBlack;
  static final white = Get.isDarkMode ? _darkBlack : _lightWhite;
  static final gray = Get.isDarkMode ? _darkGray : _lightGray;
}