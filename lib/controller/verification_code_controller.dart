import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/login.dart';
import 'package:loan_app/model/phone.dart';
import 'package:loan_app/model/response/verification_code_response.dart';
import '../api/api_controller/auth_api.dart';
import '../api/api_helper.dart';
import '../model/api_result.dart';
import '../model/api_state.dart';
import '../model/response/login_response.dart';

class VerificationCodeController extends GetxController{
  List<TextEditingController> list = [];
  AuthApi _authApi = AuthApi();
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool? validate;
  String phoneNumber = '';
  String verificationCode = '';
  late ApiResult apiResult;

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
    print('close');
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
      apiResult = await _authApi.login(login);
      apiState.isLoading.value = false;
      if (apiResult.status == ApiStatus.success) {
        LoginResponse loginResponse = LoginResponse.fromJson(apiResult.data);
        SharedPreferencesController().setToken(loginResponse.data!.token);
        SharedPreferencesController().setDraft(loginResponse.data!.draft);
        if(loginResponse.data!.draft == 0){
          SharedPreferencesController().setCurrentUserData2(loginResponse.data!.user!);
          print(SharedPreferencesController().currentUser.image);
          Get.offNamed(Routes.mainScreen);
        }else{
          Get.toNamed(Routes.signUpScreen);
        }
      }else{
        print(apiResult.data['message'] + ':' + verificationCode);
        apiState.isError.value = true;
      }
    } else {
      validate = false;
      update(['checkValidate2']);
    }
  }

  Future<void> onResendCodeClick() async {
    apiState.isLoading.value = true;
    apiResult = await _authApi.getVerificationCode(Phone(phoneNumber: phoneNumber));
    apiState.isLoading.value = false;
    if (apiResult.status == ApiStatus.success) {
      VerificationCodeResponse response = VerificationCodeResponse.fromJson(apiResult.data);
      Get.snackbar('Verification Code', response.data.toString(), snackPosition: SnackPosition.TOP, colorText: Get.theme.textTheme.headline1!.color!, backgroundColor: Get.theme.backgroundColor);
    }else{
      apiState.isError.value = true;
    }
  }

}