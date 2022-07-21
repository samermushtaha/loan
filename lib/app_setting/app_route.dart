import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import 'package:loan_app/screen/out_boarding_screen.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: Routes.outBoardingScreen,
      page: () => OutBoardingScreen(),
      binding: Binding.outBoardingController,
    ),
  ];
}

class Binding {
  static final outBoardingController = BindingsBuilder(() {
    Get.put(OutBoardingController());
  });
}

class Routes {
  static const outBoardingScreen = '/out_boarding_screen';
}
