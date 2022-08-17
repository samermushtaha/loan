import 'package:dio/dio.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/filter_user.dart';
import 'package:loan_app/model/phone.dart';
import 'package:loan_app/model/response/all_user_response.dart';
import 'package:loan_app/model/response/select_user_response.dart';
import 'package:loan_app/model/search_user.dart';

import '../../model/api_result.dart';
import '../../model/response/filter_user_response.dart';
import '../../model/select_user.dart';
import '../api_setting.dart';

class UserApi with ApiHelper{

  Future<ApiResult> getAllUsers() async {
    return await getApiStatus(url: ApiSetting.ALL_USERS, options: option('GET'));
  }

  // Future<List<UserCard>?> getAllUsers() async{
  //   response = await dio.get(ApiSetting.ALL_USERS, options: header());
  //   print(response.statusCode!);
  //   if(isSuccessRequest(response.statusCode!)){
  //     AllUserResponse allUserResponse = AllUserResponse.fromJson(response.data);
  //     if(response.data['success']){
  //       return allUserResponse.data;
  //     }else{
  //       print('Body +*/= ${response.data['message']}');
  //       return null;
  //     }
  //   }else{
  //     print('Status = ${response.statusCode}');
  //     print('Body = ${response.data['message']}');
  //     return null;
  //   }
  // }

  Future<ApiResult> getSelectedUser(SelectUser selectUser) async {
    return await getApiStatus(url: ApiSetting.SELECT_USER, options: option('POST'), data: selectUser.body());
  }

  Future<ApiResult> getAllUser(FilterUser filterUser) async {
    return await getApiStatus(url: ApiSetting.FILTER_USERS, options: option('POST'), data: filterUser.body());
  }

  Future<ApiResult> searchUser(SearchUser searchUser) async {
    return await getApiStatus(url: ApiSetting.SEARCH_USER, options: option('POST'), data: searchUser.body2());
  }

  // Future<Dataa?> getSelectedUser(SelectUser selectUser) async{
  //   response = await dio.post(ApiSetting.SELECT_USER, options: header(), data: selectUser.body());
  //   if(isSuccessRequest(response.statusCode!)){
  //     SelectUserResponse selectUserResponse = SelectUserResponse.fromJson(response.data);
  //     if(response.data['success']){
  //       return selectUserResponse.data;
  //     }else{
  //       print('Body +*/= ${response.data['message']}');
  //       return null;
  //     }
  //   }else{
  //     print('Status = ${response.statusCode}');
  //     print('Body = ${response.data['message']}');
  //     return null;
  //   }
  // }

  // Future<List<UserCard>?> getAllUser(FilterUser filterUser) async{
  //   response = await dio.post(ApiSetting.FILTER_USERS, options: header(), data: filterUser.body());
  //   if(isSuccessRequest(response.statusCode!)){
  //     FilterUserResponse filterUserResponse = FilterUserResponse.fromJson(response.data);
  //     if(response.data['success']){
  //       return filterUserResponse.data!;
  //     }else{
  //       print('Body +*/= ${response.data['message']}');
  //       return null;
  //     }
  //   }else{
  //     print('Status = ${response.statusCode}');
  //     print('Body = ${response.data['message']}');
  //     return null;
  //   }
  // }

  // Future<List<UserCard>?> searchUser(SearchUser searchUser) async{
  //   response = await dio.post(ApiSetting.SEARCH_USER, options: header(), data: searchUser.body2());
  //   if(isSuccessRequest(response.statusCode!)){
  //     FilterUserResponse filterUserResponse = FilterUserResponse.fromJson(response.data);
  //     if(response.data['success']){
  //       return filterUserResponse.data!;
  //     }else{
  //       print('Body +*/= ${response.data['message']}');
  //       return null;
  //     }
  //   }else{
  //     print('Status = ${response.statusCode}');
  //     print('Body = ${response.data['message']}');
  //     return null;
  //   }
  // }
}