import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'app_setting/app_language.dart';
import 'app_setting/app_route.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppLanguage(),
        locale: AppLocalStorage().appLanguage,
        theme: AppLocalStorage().appTheme,
        initialRoute: Routes.outBoardingScreen,
        getPages: AppRoute.routes,
      ),
    );
  }
}
