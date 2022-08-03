import 'package:dio/dio.dart';

class Phone{
  late String phoneNumber;

  Phone({required this.phoneNumber});

  FormData body(){
    return FormData.fromMap({
      'phone_number': phoneNumber,
    });
  }
}