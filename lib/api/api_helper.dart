import 'package:dio/dio.dart';

import '../app_setting/app_local_storage.dart';

mixin ApiHelper{
  bool isSuccessRequest(int statusCode) {
    return statusCode < 400;
  }

  Options header(){
    return Options(headers: {"Authorization" : "Bearer ${SharedPreferencesController().token}"},);
  }
}