import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesController{
  static SharedPreferencesController instance = SharedPreferencesController._();
  late SharedPreferences sharedPreferences;

  SharedPreferencesController._();

  factory SharedPreferencesController() {
    return instance;
  }

  Future<void> initSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  String get language => sharedPreferences.getString('appLanguage') ?? 'en';
  String? get theme => sharedPreferences.getString('appTheme');
  String get initialRoute => isFirstTime == null ? Routes.outBoardingScreen : token == null ? Routes.signInScreen : draft == 1 ? Routes.signUpScreen : Routes.mainScreen;
  bool? get isFirstTime => sharedPreferences.getBool('isFirstTime');
  String? get token => sharedPreferences.getString('token');
  String get getAddress => sharedPreferences.getString('setAddress') ?? '';
  String get longitude => sharedPreferences.getString('longitude') ?? '';
  String get latitude => sharedPreferences.getString('latitude') ?? '';
  int get draft => sharedPreferences.getInt('draft') ?? 1;
  Locale get appLanguage => Locale(language);
  String get user => sharedPreferences.getString('currentUser') ?? '';
  User get currentUser => User.fromJson(jsonDecode(user));


  Future<void> setLanguage(String languageCode) async{
    await sharedPreferences.setString('appLanguage', languageCode);
  }

  Future<void> setTheme(String themeName) async{
    await sharedPreferences.setString('appTheme', themeName);
  }

  Future<void> setFirsTime(bool isFirsTime) async{
    await sharedPreferences.setBool('isFirstTime', isFirsTime);
  }

  Future<void> setToken(String token) async{
    await sharedPreferences.setString('token', token);
  }

  Future<void> setDraft(int draft) async{
    await sharedPreferences.setInt('draft', draft);
  }

  Future<void> setLatitude(String latitude) async{
    await sharedPreferences.setString('latitude', latitude);
  }

  Future<void> setLongitude(String longitude) async{
    await sharedPreferences.setString('longitude', longitude);
  }

  Future<void> setAddress(String address) async{
    await sharedPreferences.setString('setAddress', address);
  }

  Future<void> setCurrentUserData2(User user) async{
    await sharedPreferences.setString('currentUser', jsonEncode(user));
  }

}