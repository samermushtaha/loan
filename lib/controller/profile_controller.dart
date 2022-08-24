import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/api_result.dart';

import '../model/api_state.dart';
import '../model/profile_item.dart';
import '../model/response/sign_up_response.dart';

class ProfileController extends GetxController{
  static AuthApi _authApi = AuthApi();
  static late ApiResult apiResult;
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  static ApiState logoutApiState = ApiState(isLoading: false.obs, isError: false.obs);

  @override
  void onInit() {
    getCurrentUserData();
    super.onInit();
  }


  static Future<void> onLogOutClick() async{
    logoutApiState.isLoading.value = true;
    apiResult = await _authApi.logOut();
    logoutApiState.isLoading.value = false;
    if(apiResult.status == ApiStatus.success){
      SharedPreferencesController().sharedPreferences.remove('token');
      SharedPreferencesController().sharedPreferences.remove('currentUser');
      Get.offNamed(Routes.signInScreen);
    }
  }

  List<ProfileItem> list = [
    ProfileItem(icon: Icons.person_outline, title: 'profile_item_1', onClick: (){Get.toNamed(Routes.editProfileScreen);}),
    ProfileItem(icon: Icons.groups_outlined, title: 'profile_item_2', onClick: (){Get.toNamed(Routes.allUserScreen);}),
    ProfileItem(icon: Icons.settings, title: 'profile_item_3', onClick: (){Get.toNamed(Routes.settingScreen);}),
    ProfileItem(icon: Icons.logout_outlined, title: 'profile_item_4', onClick: (){onLogOutClick();}),
  ];


  Future<void> getCurrentUserData() async {
    apiState.isLoading.value = true;
    apiResult = await _authApi.getCurrentUser();
    apiState.isLoading.value = false;
    if (apiResult.status == ApiStatus.success) {
      SignUpResponse response = SignUpResponse.fromJson(apiResult.data);
      SharedPreferencesController().setCurrentUserData2(response.data!);
    } else {
      apiState.isError.value = true;
    }
  }

  Future<void> onRefreshing() async {
    getCurrentUserData();
  }

}