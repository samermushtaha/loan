import 'package:dio/dio.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/api/api_setting.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/login.dart';
import 'package:loan_app/model/phone.dart';
import '../../model/user.dart';

class AuthApi with ApiHelper {

  Future<ApiResult> getVerificationCode(Phone phone) async{
    return await getApiStatus(url: ApiSetting.GET_CODE, data: phone.body(), options: Options(method: 'POST'));
  }

  Future<ApiResult> login(Login login) async {
    return await getApiStatus(url: ApiSetting.LOGIN, data: login.body(), options: Options(method: 'POST'));
  }

  Future<ApiResult> signUp(User user) async {
    return await getApiStatus(url: ApiSetting.SIGNUP, data: user.body(), options: option('POST'));
  }

  Future<ApiResult> editProfile(User user) async {
    return await getApiStatus(url: ApiSetting.EDIT_PROFILE, data: await user.body2(), options: option('POST'));
  }

  Future<ApiResult> getCurrentUser() async {
    return await getApiStatus(url: ApiSetting.USER_DATA, options: option('GET'));
  }

  Future<ApiResult> logOut() async {
    return await getApiStatus(url: ApiSetting.LOGOUT, options: option('GET'));
  }
}
