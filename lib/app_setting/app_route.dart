import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import 'package:loan_app/controller/sign_in_controller.dart';
import 'package:loan_app/screen/out_boarding_screen.dart';
import 'package:loan_app/screen/sign_in_screen.dart';
import 'package:loan_app/screen/verification_code_screen.dart';

import '../controller/verification_code_controller.dart';

class AppRoute {
  static final routes = [
    GetPage(
      name: Routes.outBoardingScreen,
      page: () => OutBoardingScreen(),
      binding: Binding.outBoardingController,
    ),
    GetPage(
      name: Routes.signInScreen,
      page: () => SignInScreen(),
      binding: Binding.signInController,
    ),
    GetPage(
      name: Routes.verificationCodeScreen,
      page: () => VerificationCodeScreen(),
      binding: Binding.verificationCodeController,
    ),
  ];
}

class Binding {
  static final outBoardingController = BindingsBuilder(() {
    Get.put(OutBoardingController());
  });
  static final signInController = BindingsBuilder(() {
    Get.put(SignInController());
  });
  static final verificationCodeController = BindingsBuilder(() {
    Get.put(VerificationCodeController());
  });
}

class Routes {
  static const outBoardingScreen = '/out_boarding_screen';
  static const signInScreen = '/sign_in_screen';
  static const verificationCodeScreen = '/verification_code_screen';
}
