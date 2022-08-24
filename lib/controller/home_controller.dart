import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/loan_api.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/response/near_loan_response.dart';

import '../api/api_controller/user_api.dart';
import '../app_setting/app_font.dart';
import '../app_setting/app_route.dart';
import '../model/api_state.dart';
import '../model/response/all_user_response.dart';

class HomeController extends GetxController {
  LoanApi _loanApi = LoanApi();
  RxList<UserCard> allUsers = <UserCard>[].obs;
  UserApi _userApi = UserApi();
  ApiState userApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState loanApiState = ApiState(isLoading: false.obs, isError: false.obs);
  late ApiResult apiResultCard;
  late ApiResult apiResultUser;
  late NearLoan nearLoan;

  @override
  void onInit() {
    print(SharedPreferencesController().token);
    getNearLoan();
    getAllUser();
    super.onInit();
  }

  Future<void> getNearLoan() async {
    loanApiState.isLoading.value = true;
    apiResultCard = await _loanApi.getNearLoan();
    loanApiState.isLoading.value = false;
    if (apiResultCard.status == ApiStatus.success) {
      NearLoanResponse nearLoanResponse = NearLoanResponse.fromJson(apiResultCard.data);
      nearLoan = nearLoanResponse.data!;
      update();
    } else {
      print(apiResultCard.status);
      loanApiState.isError.value = true;
    }
  }

  Future<void> getAllUser() async {
    userApiState.isLoading.value = true;
    ApiResult apiResultUser = await _userApi.getAllUsers();
    userApiState.isLoading.value = false;
    if (apiResultUser.status == ApiStatus.success) {
      AllUserResponse response = AllUserResponse.fromJson(apiResultUser.data);
      allUsers.value = response.data;
    } else {
      userApiState.isError.value = true;
      logoutDialog();
    }
  }

  Future<void> onRefreshing() async {
    await getNearLoan();
    await getAllUser();
  }

  void logoutDialog(){
    Get.defaultDialog(
      barrierDismissible: false,
      backgroundColor: Get.theme.backgroundColor,
      title: 'Logout',
      titleStyle: TextStyle(color: Get.theme.primaryColor, fontFamily: AppFont.fontFamily, ),
      middleTextStyle: TextStyle(fontFamily: AppFont.fontFamily),
      middleText: 'Some thing went wrong you must to logout now.',
      confirm: TextButton(
        onPressed: () {
          SharedPreferencesController().sharedPreferences.remove('token');
          Get.offNamed(Routes.signInScreen);
        },
        child: Text(
          'LOGOUT',
          style: TextStyle(
              color: Get.theme.primaryColor,
              fontFamily: AppFont.fontFamily),
        ),
      ),
    );
  }
}
