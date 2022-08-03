import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/api/api_controller/auth_api.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/model/api_state.dart';
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
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    firstName = TextEditingController();
    lastName = TextEditingController();
    email = TextEditingController();
    birthdate = TextEditingController();
    address = TextEditingController();
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
      birthdate.text = DateFormat('dd / MM / yyyy').format(dateTime);
      update();
    }
  }

  void onSelectLocationClick() {
    Get.toNamed(Routes.mapScreen);
  }

  Future<void> onSignUpClick() async {
    address.text = SharedPreferencesController().getAddress;
    if(formKey.currentState!.validate()){
      apiState.isLoading.value = true;
      User signUp = User(firstName: firstName.text, lastName: lastName.text, address: address.text, email: email.text);
      bool state = await _authApi.signUp(signUp);
      apiState.isLoading.value = false;
      if (state) {
        Get.toNamed(Routes.mainScreen);
      } else {
        apiState.isError.value = true;
      }
    }

  }

}