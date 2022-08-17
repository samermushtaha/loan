import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/api_state.dart';
import 'package:loan_app/model/response/sign_up_response.dart';
import 'package:loan_app/model/user.dart';

import '../app_setting/app_route.dart';

class SignUpController extends GetxController {
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController birthdate;
  late TextEditingController address;
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool validate = true;
  AuthApi _authApi = AuthApi();
  late ApiResult apiResult;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    birthdate = TextEditingController();
    address = TextEditingController(text: SharedPreferencesController().getAddress);
    super.onInit();
  }

  @override
  void onClose() {
    firstName.dispose();
    lastName.dispose();
    email.dispose();
    birthdate.dispose();
    address.dispose();
    super.onClose();
  }

  Future<void> onSelectDateClick(BuildContext context,
      SignUpController controller) async {
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime(2022),
      firstDate: DateTime(1900),
      lastDate: DateTime(DateTime.now().year),
    );
    if (dateTime != null) {
      birthdate.text = DateFormat('yyyy-MM-dd').format(dateTime);
      update();
    }
  }

  void onSelectLocationClick() {
    Get.toNamed(Routes.mapScreen);
  }

  Future<void> onSignUpClick() async {
    // address.text = SharedPreferencesController().getAddress;
    if(formKey.currentState!.validate()){
      apiState.isLoading.value = true;
      User user = User(firstName: firstName.text, lastName: lastName.text, address: address.text, email: email.text, birthdate: birthdate.text, latitude: SharedPreferencesController().latitude, longitude: SharedPreferencesController().longitude, image: '');
      apiResult = await _authApi.signUp(user);
      apiState.isLoading.value = false;
      if (apiResult.status == ApiStatus.success) {
        SignUpResponse response = SignUpResponse.fromJson(apiResult.data);
        SharedPreferencesController().setCurrentUserData2(response.data!);
        Get.toNamed(Routes.mainScreen);
      } else {
        apiState.isError.value = true;
      }
    }
  }

}