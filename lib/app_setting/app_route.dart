import 'package:get/get.dart';
import 'package:loan_app/controller/main_controller.dart';
import 'package:loan_app/controller/notification_controller.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import 'package:loan_app/controller/setting_controller.dart';
import 'package:loan_app/controller/sign_in_controller.dart';
import 'package:loan_app/screen/add_loan_screen.dart';
import 'package:loan_app/screen/all_user_screen.dart';
import 'package:loan_app/screen/edit_profile_screen.dart';
import 'package:loan_app/screen/loan_details_screen.dart';
import 'package:loan_app/screen/main_screen.dart';
import 'package:loan_app/screen/map_screen.dart';
import 'package:loan_app/screen/notification_screen.dart';
import 'package:loan_app/screen/out_boarding_screen.dart';
import 'package:loan_app/screen/setting_screen.dart';
import 'package:loan_app/screen/auth/sign_in_screen.dart';
import 'package:loan_app/screen/user_info_screen.dart';
import 'package:loan_app/screen/auth/verification_code_screen.dart';
import '../controller/add_loan_controller.dart';
import '../controller/all_user_controller.dart';
import '../controller/edit_profile_controller.dart';
import '../controller/map_controller.dart';
import '../controller/sign_up_controller.dart';
import '../controller/user_info_controller.dart';
import '../controller/verification_code_controller.dart';
import '../screen/auth/sign_up_screen.dart';

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
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignUpScreen(),
      binding: Binding.signUpController,
    ),
    GetPage(
      name: Routes.mainScreen,
      page: () => MainScreen(),
      binding: Binding.mainController,
    ),
    GetPage(
      name: Routes.mapScreen,
      page: () => MapScreen(),
      binding: Binding.mapController,
    ),
    GetPage(
      name: Routes.allUserScreen,
      page: () => AllUserScreen(),
      binding: Binding.allUserController,
    ),
    GetPage(
      name: Routes.addLoanScreen,
      page: () => AddLoanScreen(),
      binding: Binding.addLoanController,
    ),
    GetPage(
      name: Routes.loanDetailsScreen,
      page: () => LoanDetailsScreen(),
      // binding: Binding.loanDetailsController,
    ),
    GetPage(
      name: Routes.notificationScreen,
      page: () => NotificationScreen(),
      binding: Binding.notificationController,
    ),
    GetPage(
      name: Routes.editProfileScreen,
      page: () => EditProfileScreen(),
      binding: Binding.editProfileController,
    ),
    GetPage(
      name: Routes.settingScreen,
      page: () => SettingScreen(),
      binding: Binding.settingController,
    ),
    GetPage(
      name: Routes.userInfoScreen,
      page: () => UserInfoScreen(),
      binding: Binding.userInfoController,
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
  static final signUpController = BindingsBuilder(() {
    Get.put(SignUpController());
  });
  static final mainController = BindingsBuilder(() {
    Get.put(MainController());
  });
  static final mapController = BindingsBuilder(() {
    Get.put(MapController());
  });
  static final allUserController = BindingsBuilder(() {
    Get.put(AllUserController());
  });
  static final addLoanController = BindingsBuilder(() {
    Get.put(AddLoanController());
  });
  // static final loanDetailsController = BindingsBuilder(() {
  //   Get.put(LoanDetailsScreen());
  // });
  static final notificationController = BindingsBuilder(() {
    Get.put(NotificationController());
  });
  static final editProfileController = BindingsBuilder(() {
    Get.put(EditProfileController());
  });
  static final settingController = BindingsBuilder(() {
    Get.put(SettingController());
  });
  static final userInfoController = BindingsBuilder(() {
    Get.put(UserInfoController());
  });
}

class Routes {
  static const outBoardingScreen = '/out_boarding_screen';
  static const signInScreen = '/sign_in_screen';
  static const verificationCodeScreen = '/verification_code_screen';
  static const signUpScreen = '/sign_up_screen';
  static const mainScreen = '/main_screen';
  static const mapScreen = '/map_screen';
  static const allUserScreen = '/all_user_screen';
  static const addLoanScreen = '/add_loan_screen';
  static const loanDetailsScreen = '/loan_details_screen';
  static const notificationScreen = '/notification_screen';
  static const editProfileScreen = '/edit_profile_screen';
  static const settingScreen = '/setting_screen';
  static const userInfoScreen = '/user_info_screen';
}
