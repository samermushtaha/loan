import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:loan_app/app_setting/app_helper.dart';
import 'package:loan_app/controller/connection_controller.dart';
import 'package:loan_app/model/api_result.dart';
import '../app_setting/app_local_storage.dart';

enum ApiStatus{
  connectionError,
  success,
  serverError,
  validationError,
  serverOff,
  other,
}

mixin ApiHelper{
  var dio = Dio();
  late Response response;
  ConnectionManagerController controller = Get.put(ConnectionManagerController());

  bool isSuccessRequest(int statusCode) {
    return statusCode < 400;
  }

  Options header(){
    return Options(headers: {"Authorization" : "Bearer ${SharedPreferencesController().token}"});
  }

  Options option(String method){
    return Options(headers: {"Authorization" : "Bearer ${SharedPreferencesController().token}"}, method: method);
  }

  Future<ApiResult> getApiStatus({required String url, Options? options, dynamic data}) async {
    late Response response;
    await controller.getConnectivityType();
    if(controller.connectionType != ConnectionType.none){
      try{
        response = await dio.request(url, data: data, options: options);
        if(response.data['success']){
          return ApiResult(status: ApiStatus.success, data: response.data);
        }else{
          // AppHelper.showSnackBar(context, text: response.data['message']);
          return ApiResult(status: ApiStatus.validationError, data: response.data);
        }
      }catch(e){
        if(e is DioError){
          if(e.response != null){
            // AppHelper.showSnackBar(context, text: 'Server Error: Some thing went wrong', error: true);
            return ApiResult(status: ApiStatus.serverError, data: '');
          }else{
            // AppHelper.showSnackBar(context, text: 'Server off: Some thing went wrong', error: true);
            return ApiResult(status: ApiStatus.serverOff, data: '');
          }
        }else{
          // AppHelper.showSnackBar(context, text: 'Some thing went wrong', error: true);
          return ApiResult(status: ApiStatus.other, data: '');
        }
      }
    }else{
      // AppHelper.showSnackBar(context, text: 'Connection Error: check your internet', error: true);
      return ApiResult(status: ApiStatus.connectionError, data: '');
    }
  }
}