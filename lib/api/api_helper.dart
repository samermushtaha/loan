import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
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
  Dio dio = Dio();
  late Response response;
  ConnectionManagerController controller = Get.put(ConnectionManagerController());

  Options option(String method){
    return Options(headers: {"Authorization" : "Bearer ${SharedPreferencesController().token}"}, method: method, receiveTimeout: 20000, sendTimeout: 20000,);
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
          return ApiResult(status: ApiStatus.validationError, data: response.data);
        }
      }catch(e){
        if(e is DioError){
          if(e.response != null){
            print(e);
            return ApiResult(status: ApiStatus.serverError, data: '');
          }else{
            print(e);
            return ApiResult(status: ApiStatus.serverOff, data: '');
          }
        }else{
          print(e);
          return ApiResult(status: ApiStatus.other, data: '');
        }
      }
    }else{
      return ApiResult(status: ApiStatus.connectionError, data: '');
    }
  }
}