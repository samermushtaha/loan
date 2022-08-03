import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/theme_controller.dart';
import 'app_setting/app_language.dart';
import 'app_setting/app_route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initSharedPreference();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeController controller = Get.put(ThemeController());
    controller.getThemeModeFromPreferences();
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        translations: AppLanguage(),
        locale: SharedPreferencesController().appLanguage,
        theme: AppColor.light,
        darkTheme: AppColor.dark,
        themeMode: controller.themeMode,
        initialRoute: SharedPreferencesController().initialRoute,
        getPages: AppRoute.routes,
      ),
    );
  }
}
