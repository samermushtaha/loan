import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/app_setting/app_route.dart';

class SignInController extends GetxController{
  AuthApi _authApi = AuthApi();
  String? phoneNumber;
  RxBool isLoading = false.obs;
  RxBool isError = false.obs;
  bool validate = true;

  void onPhoneNumberChange(String number){
    phoneNumber = number;
    update();
  }

  Future<void> onContinueClick() async{
    // if(phoneNumber != null){
    //   validate = true;
    //   isLoading.value = true;
    //   bool state = await _authApi.getVerificationCode(phoneNumber!);
    //   isLoading.value = false;
    //   if(!state){
    //     isError.value = true;
    //   }
    // }else{
    //   validate = false;
    //   update(['checkValidate']);
    // }
    Get.toNamed(Routes.verificationCodeScreen);
    // Go to VerificationCodeScreen with phone number as argument
  }
}