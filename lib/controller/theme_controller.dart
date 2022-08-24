import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';

class ThemeController extends GetxController{

  @override
  void onInit() {
    getThemeModeFromPreferences();
    super.onInit();
  }

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;
  static ThemeController get to => Get.find();

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    update();
    await SharedPreferencesController().setTheme(themeMode.toString().split('.')[1]);
  }

  Future<ThemeMode> getThemeModeFromPreferences() async {
    try {
      _themeMode = ThemeMode.values.firstWhere((e) => describeEnum(e) == SharedPreferencesController().theme);
    } catch (e) {
      _themeMode = ThemeMode.system;
    }
    setThemeMode(themeMode);
    return _themeMode;
  }
}