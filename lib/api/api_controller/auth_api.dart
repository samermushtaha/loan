
import 'package:dio/dio.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/api/api_setting.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/model/login.dart';
import 'package:loan_app/model/verification_code_response.dart';
import 'package:loan_app/model/phone.dart';
import '../../model/login_response.dart';
import '../../model/sign_up_response.dart';
import '../../model/user.dart';

class AuthApi with ApiHelper {
  late Response response;
  var dio = Dio();

  Future<int?> getVerificationCode(Phone phone) async {
    response = await dio.post(ApiSetting.GET_CODE, data: phone.body());
    if(isSuccessRequest(response.statusCode!)){
      VerificationCodeResponse loginResponse = VerificationCodeResponse.fromJson(response.data);
      if(loginResponse.success){
        return loginResponse.data;
      }else{
        print('Body = ${response.data['message']}');
        return null;
      }
    }else{
      print('Status = ${response.statusCode}');
      print('Body = ${response.data['message']}');
      return null;
    }
  }

  Future<bool> login(Login login) async {
    response = await dio.post(ApiSetting.LOGIN, data: login.body());
    if(isSuccessRequest(response.statusCode!)){
      LoginResponse loginResponse = LoginResponse.fromJson(response.data);
      if(loginResponse.success){
        SharedPreferencesController().setToken(loginResponse.data!.token!);
        print(SharedPreferencesController().token);
        return true;
      }else{
        print('Body = ${response.data['message']}');
        return false;
      }
    }else{
      print('Status = ${response.statusCode}');
      print('Body = ${response.data['message']}');
      return false;
    }
  }

  Future<bool> signUp(User user) async {
    response = await dio.post(ApiSetting.SIGNUP, data: user.body(), options: header());
    if(isSuccessRequest(response.statusCode!)){
      print('Body** = ${response.data['Message']}');
      SignUpResponse signUpResponse = SignUpResponse.fromJson(response.data);

      if(signUpResponse.success){
        print('Body*/ = ${response.data['Message']}');
        SharedPreferencesController().setCurrentUserData(user);
        return true;
      }else{
        print('Body +*/= ${response.data['Message']}');
        return false;
      }
    }else{
      print('Status = ${response.statusCode}');
      print('Body = ${response.data['message']}');
      return false;
    }
  }

  Future<bool> logOut() async {
    response = await dio.get(ApiSetting.LOGOUT, options: header());
    if(isSuccessRequest(response.statusCode!)){
      if(response.data['success']){
        SharedPreferencesController().sharedPreferences.remove('token');
        return true;
      }else{
        print('Body +*/= ${response.data['Message']}');
        return false;
      }
    }else{
      print('Status = ${response.statusCode}');
      print('Body = ${response.data['message']}');
      return false;
    }
  }

}
