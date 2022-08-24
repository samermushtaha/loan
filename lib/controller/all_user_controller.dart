import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/user_api.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/api_state.dart';
import 'package:loan_app/model/filter_user.dart';
import 'package:loan_app/model/response/all_user_response.dart';
import 'package:loan_app/model/search_user.dart';

import '../model/radio_item.dart';
import '../model/response/filter_user_response.dart';
import '../model/response/select_user_response.dart';

class AllUserController extends GetxController{
  RxList<UserCard> allUsers = <UserCard>[].obs;
  RxList<UserCard> searchList = <UserCard>[].obs;
  UserApi _userApi = UserApi();
  ApiState userApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState searchApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState pagenationApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState pagenationApiState2 = ApiState(isLoading: false.obs, isError: false.obs);
  late TextEditingController search;
  late ScrollController scrollController;
  late ScrollController scrollController2;
  late ApiResult apiResult;
  int pageNo = 1;
  int pageNo2 = 1;

  List<RadioItem> filterList = [
    RadioItem(title: 'all_user', value: 'a'),
    RadioItem(title: 'cr', value: 'c'),
    RadioItem(title: 'dr', value: 'd'),
  ];

  String selectedType = 'a';

  Future<void> getAllUser() async{
    userApiState.isLoading.value = true;
    apiResult = await _userApi.getAllUser(FilterUser(filterBy: selectedType, pageSize: 10, page: pageNo));
    userApiState.isLoading.value = false;
    if(apiResult.status == ApiStatus.success){
      FilterUserResponse response = FilterUserResponse.fromJson(apiResult.data);
      if(response.data!.isNotEmpty){
        allUsers.assignAll(response.data!);
      }
    }else{
      userApiState.isError.value = true;
    }
  }

  Future<void> searchUser() async{
    if(search.text.isNotEmpty){
      searchApiState.isLoading.value = true;
      apiResult = await _userApi.searchUser(SearchUser(phoneNumber: search.text, pageSize: 10, page: pageNo2));
      searchApiState.isLoading.value = false;
      if(apiResult.status == ApiStatus.success){
        FilterUserResponse response = FilterUserResponse.fromJson(apiResult.data);
        if(response.data!.isNotEmpty){
          allUsers.assignAll(response.data!);
        }
      }else{
        searchApiState.isError.value = true;
      }
    }
  }

  @override
  void onInit() {
    search = TextEditingController();
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener);
    scrollController2 = ScrollController();
    scrollController2.addListener(_scrollListener2);
    getAllUser();
    super.onInit();
  }

  @override
  void onClose() {
    search.dispose();
    super.onClose();
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      pagenationApiState.isLoading.value = true;
      apiResult = await await _userApi.getAllUser(FilterUser(filterBy: selectedType, pageSize: 10, page: ++pageNo));
      pagenationApiState.isLoading.value = false;
      if(apiResult.status == ApiStatus.success){
        FilterUserResponse response = FilterUserResponse.fromJson(apiResult.data);
        if(response.data!.isNotEmpty){
          allUsers.assignAll(response.data!);
        }
      }
    }
  }

  void _scrollListener2() async {
    if (scrollController2.offset >= scrollController2.position.maxScrollExtent && !scrollController2.position.outOfRange) {
      pagenationApiState2.isLoading.value = true;
      apiResult = await await _userApi.searchUser(SearchUser(phoneNumber: search.text, pageSize: 10, page: ++pageNo2));
      pagenationApiState2.isLoading.value = false;
      if(apiResult.status == ApiStatus.success){
        FilterUserResponse response = FilterUserResponse.fromJson(apiResult.data);
        if(response.data!.isNotEmpty){
          allUsers.assignAll(response.data!);
        }
      }
    }
  }
}