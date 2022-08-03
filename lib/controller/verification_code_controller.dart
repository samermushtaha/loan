import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/login.dart';

import '../api/api_controller/auth_api.dart';
import '../model/api_state.dart';

class VerificationCodeController extends GetxController{

  List<TextEditingController> list = [];
  AuthApi _authApi = AuthApi();
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool? validate;
  String phoneNumber = '';
  String verificationCode = '';

  @override
  void onInit() {
    phoneNumber = Get.arguments[0];
    for(int i = 0; i < 4; i++){
      list.add(TextEditingController());
    }
    super.onInit();
  }

  @override
  void onClose() {
    for(TextEditingController controller in list){
      controller.dispose();
    }
    super.onClose();
  }

  void pastVerificationCode(){
    FlutterClipboard.paste().then((value) {
      if (value.length == 4) {
        int j = 1;
        for(int i = 0; i < list.length; i++){
          list[i].text = value.substring(i, j);
          j++;
        }
      }
    });
  }

  void onChange(BuildContext context, int index){
    if(list[index].text.length == 1){
      FocusScope.of(context).nextFocus();
    }else{
      FocusScope.of(context).previousFocus();
    }
  }

  Future<void> onConfirmClick() async{
    if (list[0].text.isNotEmpty && list[1].text.isNotEmpty && list[2].text.isNotEmpty && list[3].text.isNotEmpty) {
      apiState.isLoading.value = true;
      for(TextEditingController controller in list){
        verificationCode += controller.text;
      }
      Login login = Login(phoneNumber: phoneNumber, verificationCode: verificationCode);
      bool states = await _authApi.login(login);
      apiState.isLoading.value = false;
      if (states) {
        Get.toNamed(Routes.signUpScreen);
      } else {
        validate = false;
        update(['checkValidate2']);
      }
    } else {
      validate = false;
      update(['checkValidate2']);
    }
  }

}