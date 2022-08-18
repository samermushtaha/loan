import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/api/api_controller/loan_api.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/phone.dart';
import 'package:loan_app/model/response/select_user_response.dart';
import 'package:loan_app/model/select_user.dart';
import 'package:loan_app/model/transaction.dart';

import '../api/api_controller/user_api.dart';
import '../api/api_helper.dart';
import '../model/api_state.dart';
import '../model/response/response2.dart';

class LoanDetailsController extends GetxController{
  late Dataa selectedUser;
  late String phoneNumber;
  int pageNo = 1;
  UserApi _userApi = UserApi();
  LoanApi _loanApi = LoanApi();
  ApiState userApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState loanApiState = ApiState(isLoading: false.obs, isError: false.obs);
  ApiState pagenationApiState = ApiState(isLoading: false.obs, isError: false.obs);
  late ApiResult apiResult;
  ScrollController scrollController = ScrollController();
  RxList<Transaction> list = <Transaction>[].obs;

  @override
  void onInit() {
    phoneNumber = Get.arguments[0];
    scrollController = ScrollController();
    scrollController.addListener(_scrollListener, );
    getUserDetails();
    getUserLoan();
    super.onInit();
  }

  Future<void> getUserDetails() async{
    userApiState.isLoading.value = true;
    apiResult = await _userApi.getSelectedUser(SelectUser(phoneNumber: phoneNumber));
    userApiState.isLoading.value = false;
    if(apiResult.status == ApiStatus.success){
      SelectUserResponse response = SelectUserResponse.fromJson(apiResult.data);
      selectedUser = response.data!;
      update();
    }else{
      userApiState.isError.value = true;
    }
  }

  void _scrollListener() async {
    if (scrollController.offset >= scrollController.position.maxScrollExtent && !scrollController.position.outOfRange) {
      pagenationApiState.isLoading.value = true;
      apiResult = await _loanApi.getUserLoan(SelectUser(phoneNumber: phoneNumber, page: ++pageNo, pageSize: 6));
      pagenationApiState.isLoading.value = false;
      if(apiResult.status == ApiStatus.success){
        Response2 response = Response2.fromJson(apiResult.data);
        if (response.data!.data!.isNotEmpty) {
          list.addAll(response.data!.data!);
        }
      }
    }
  }

  Future<void> getUserLoan() async{
    loanApiState.isLoading.value = true;
    apiResult = await _loanApi.getUserLoan(SelectUser(phoneNumber: phoneNumber, page: pageNo, pageSize: 6));
    loanApiState.isLoading.value = false;
    if(apiResult.status == ApiStatus.success){
      Response2 response = Response2.fromJson(apiResult.data);
      if(response.data!.data!.isNotEmpty){
        list.assignAll(response.data!.data!);
      }
    }else{
      loanApiState.isError.value = true;
    }
  }
}