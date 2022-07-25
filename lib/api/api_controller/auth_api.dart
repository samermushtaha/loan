import 'package:dio/dio.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/api/api_setting.dart';

class AuthApi with ApiHelper {
  late Response response;
  var dio = Dio();

  Future<bool> getVerificationCode(String phoneNumber) async {
    var formData = FormData.fromMap({
      'phone_number': phoneNumber,
    });
    response = await dio.post(ApiSetting.GET_CODE, data: formData);
    if(isSuccessRequest(response.statusCode!)){
      print(response.data['activation_code']);
      return true;
    }else{
      print('Status = ${response.statusCode}');
      print('Body = ${response.data}');
      return false;
    }
  }

  Future<bool> addProduct() async {
    var formData = FormData.fromMap({
      'title': 'test product',
      'description': 'lorem ipsum set',
      'image': 'https://i.pravatar.cc',
      'category': 'electronic',
      'price': 13.5,
    });
    response = await dio.post(
      ApiSetting.ADD_PRODUCT,
      data: formData,
      onSendProgress: (int sent, int total) {
        // print('$sent / $total');
      },
    );
    print(response.statusCode);
    if(isSuccessRequest(response.statusCode!)){
      // user = User.fromJson(jsonDecode(response.body));
      return true;
    }else{
      print(response.data);
      return false;
    }
  }
}
