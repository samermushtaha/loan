import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/filter_user.dart';
import 'package:loan_app/model/search_user.dart';
import '../../model/api_result.dart';
import '../../model/select_user.dart';
import '../api_setting.dart';

class UserApi with ApiHelper{

  Future<ApiResult> getAllUsers() async {
    return await getApiStatus(url: ApiSetting.ALL_USERS, options: option('GET'));
  }

  Future<ApiResult> getSelectedUser(SelectUser selectUser) async {
    return await getApiStatus(url: ApiSetting.SELECT_USER, options: option('POST'), data: selectUser.body());
  }

  Future<ApiResult> getAllUser(FilterUser filterUser) async {
    return await getApiStatus(url: ApiSetting.FILTER_USERS, options: option('POST'), data: filterUser.body());
  }

  Future<ApiResult> searchUser(SearchUser searchUser) async {
    return await getApiStatus(url: ApiSetting.SEARCH_USER, options: option('POST'), data: searchUser.body2());
  }
}