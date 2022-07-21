import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class AppLocalStorage{
  final storage = GetStorage();

  String get _language => storage.read('appLanguage') ?? 'en';
  String get _theme => storage.read('appTheme') ?? 'light';
  Locale get appLanguage => Locale(_language);
  ThemeData get appTheme => _theme == 'dark' ? ThemeData.dark() : ThemeData.light();

  Future<void> setLanguage(String languageCode) async{
    await storage.write('appLanguage', languageCode);
  }

  Future<void> setTheme(String themeName) async{
    await storage.write('appTheme', themeName);
  }


}