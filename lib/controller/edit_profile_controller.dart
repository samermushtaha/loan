import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/api_result.dart';

import '../api/api_controller/auth_api.dart';
import '../api/api_setting.dart';
import '../app_setting/app_local_storage.dart';
import '../app_setting/app_route.dart';
import '../model/api_state.dart';
import '../model/response/sign_up_response.dart';
import '../model/user.dart';

class EditProfileController extends GetxController{
  late TextEditingController firstName;
  late TextEditingController lastName;
  late TextEditingController email;
  late TextEditingController birthdate;
  late TextEditingController address;
  String? currentImage;
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool validate = true;
  AuthApi _authApi = AuthApi();
  final formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? image;
  late ApiResult apiResult;

  @override
  void onInit() {
    firstName = TextEditingController(text: SharedPreferencesController().currentUser.firstName);
    lastName = TextEditingController(text: SharedPreferencesController().currentUser.lastName);
    email = TextEditingController(text: SharedPreferencesController().currentUser.email);
    birthdate = TextEditingController(text: SharedPreferencesController().currentUser.birthdate);
    address = TextEditingController(text: SharedPreferencesController().currentUser.address);
    currentImage = SharedPreferencesController().currentUser.image != null ? ApiSetting.BASE_URL + '/' +  SharedPreferencesController().currentUser.image!: null ;
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

  Future<void> onSelectDateClick(BuildContext context) async {
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

  Future<void> onPikeImageClick() async{
    image = await _picker.pickImage(source: ImageSource.gallery);
    update();
  }

  Future<void> onEditClick() async {
    address.text = SharedPreferencesController().getAddress;
    if(formKey.currentState!.validate()){
      apiState.isLoading.value = true;
      User user = User(firstName: firstName.text, lastName: lastName.text, address: address.text, email: email.text, birthdate: birthdate.text, latitude: SharedPreferencesController().latitude, longitude: SharedPreferencesController().longitude, image: image != null ? image!.path : null);
      apiResult = await _authApi.editProfile(user);
      apiState.isLoading.value = false;
      if (apiResult.status == ApiStatus.success) {
        SignUpResponse response = SignUpResponse.fromJson(apiResult.data);
        SharedPreferencesController().setCurrentUserData2(response.data!);
        Get.back();
      } else {
        apiState.isError.value = true;
      }
    }
  }
}