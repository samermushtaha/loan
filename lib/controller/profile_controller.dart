import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/app_setting/app_route.dart';

import '../model/profile_item.dart';

class ProfileController extends GetxController{
  static AuthApi _authApi = AuthApi();



  static Future<void> onLogOutClick() async{
    bool states = await _authApi.logOut();
    if(states){
      Get.offNamed(Routes.signInScreen);
    }
  }

  List<ProfileItem> list = [
    ProfileItem(icon: Icons.person_outline, title: 'profile_item_1', onClick: (){Get.toNamed(Routes.editProfileScreen);}),
    ProfileItem(icon: Icons.groups_outlined, title: 'profile_item_2', onClick: (){Get.toNamed(Routes.allUserScreen);}),
    ProfileItem(icon: Icons.settings, title: 'profile_item_3', onClick: (){Get.toNamed(Routes.settingScreen);}),
    ProfileItem(icon: Icons.logout_outlined, title: 'profile_item_4', onClick: (){onLogOutClick();}),
  ];

}