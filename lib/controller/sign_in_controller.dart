import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/api_state.dart';
import 'package:loan_app/model/phone.dart';

class SignInController extends GetxController {
  AuthApi _authApi = AuthApi();
  String phoneNumber = '';
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool validate = true;

  void onPhoneNumberChange(String number) {
    phoneNumber = number;
    update();
  }

  Future<void> onLoginClick() async {
    if (phoneNumber != '') {
      apiState.isLoading.value = true;
      Phone phone = Phone(phoneNumber: phoneNumber);
      int? verificationCode = await _authApi.getVerificationCode(phone);
      apiState.isLoading.value = false;
      if (verificationCode != null) {
        Get.snackbar(
          'verificationAppBar'.tr,
          verificationCode.toString(),
          snackPosition: SnackPosition.TOP,
          backgroundColor: Get.theme.backgroundColor,
          duration: Duration(seconds: 3),
        );
        Get.toNamed(Routes.verificationCodeScreen,
            arguments: [phoneNumber]);
      } else {
        apiState.isError.value = true;
      }
    } else {
      validate = false;
      update(['checkValidate']);
    }
  }
}
