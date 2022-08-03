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
  String get initialRoute => isFirstTime == null ? Routes.outBoardingScreen : token == null ? Routes.signInScreen : Routes.mainScreen;
  bool? get isFirstTime => sharedPreferences.getBool('isFirstTime');
  String? get token => sharedPreferences.getString('token');
  String? get latLong => sharedPreferences.getString('latLong');
  String get getAddress => sharedPreferences.getString('setAddress') ?? '';
  Locale get appLanguage => Locale(language);

  String get firstName => sharedPreferences.getString('first_name') ?? '';
  String get lastName => sharedPreferences.getString('last_name') ?? '';
  String get birthdate => sharedPreferences.getString('birthdate') ?? '';
  String get address => sharedPreferences.getString('address') ?? '';
  String get email => sharedPreferences.getString('email') ?? '';

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

  Future<void> setAddress(String address) async{
    await sharedPreferences.setString('setAddress', address);
  }

  Future<void> setLatLong(String latLong) async{
    await sharedPreferences.setString('latLong', latLong);
  }

  Future<void> setCurrentUserData(User user) async{
    await sharedPreferences.setString('first_name', user.firstName);
    await sharedPreferences.setString('last_name', user.lastName);
    // await storage.write('birthdate', user.birthdate);
    await sharedPreferences.setString('address', user.address);
    await sharedPreferences.setString('email', user.email);
  }

}