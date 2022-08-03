
import 'package:dio/dio.dart';

class Login{
  late String phoneNumber;
  late String verificationCode;

  Login({required this.phoneNumber, required this.verificationCode});

  FormData body(){
    return FormData.fromMap({
      'phone_number': phoneNumber,
      'code': verificationCode,
    });
  }
}