import 'package:dio/src/response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/app_setting/app_helper.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/verification_code_controller.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/api_state.dart';
import 'package:loan_app/model/phone.dart';
import 'package:loan_app/model/response/verification_code_response.dart';

import '../api/api_helper.dart';

class SignInController extends GetxController {
  AuthApi _authApi = AuthApi();
  String phoneNumber = '';
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool validate = true;
  late ApiResult apiResult;

  void onPhoneNumberChange(String number) {
    phoneNumber = number;
    update();
  }

  Future<void> onLoginClick() async {
    if (phoneNumber.length > 4) {
      apiState.isLoading.value = true;
      apiResult = await _authApi.getVerificationCode(Phone(phoneNumber: phoneNumber));
      apiState.isLoading.value = false;
      if(apiResult.status == ApiStatus.success){
        VerificationCodeResponse response = VerificationCodeResponse.fromJson(apiResult.data);
        Get.snackbar('Verification Code', response.data.toString(), snackPosition: SnackPosition.TOP, colorText: Get.theme.textTheme.headline1!.color!, backgroundColor: Get.theme.backgroundColor);
        Get.toNamed(Routes.verificationCodeScreen, arguments: [phoneNumber]);
      }else{
        apiState.isError.value = true;
      }
    } else {
      validate = false;
      update(['checkValidate']);
    }

  }
}
