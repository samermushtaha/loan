import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/controller/theme_controller.dart';
import 'app_setting/app_language.dart';
import 'app_setting/app_route.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesController().initSharedPreference();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final controller = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
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


// فإن محاولة إعادة المكتبة ستكون بلا فائدة ولن تضيف أي قيمة إلى المكتبة ، وستكون مضيعة للوقت