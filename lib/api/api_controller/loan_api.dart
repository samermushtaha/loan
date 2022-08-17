import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/debitor.dart';
import 'package:loan_app/model/response/debitor_response.dart';
import 'package:loan_app/model/response/response2.dart';
import 'package:loan_app/model/select_user.dart';
import 'package:loan_app/model/transaction.dart';

import '../../model/api_result.dart';
import '../../model/response/near_loan_response.dart';
import '../api_setting.dart';

class LoanApi with ApiHelper{

  Future<ApiResult> getNearLoan() async{
    return await getApiStatus(url: ApiSetting.NEAR_LOAN, options: option('GET'));
  }

  Future<ApiResult> addDebitor(Debitor debitor) async{
    return await getApiStatus(url: ApiSetting.ADD_DEBITOR, options: option('POST'), data: debitor.body());
  }

  Future<ApiResult> addCreditor(Debitor debitor) async{
    return await getApiStatus(url: ApiSetting.ADD_Creditor, options: option('POST'), data: debitor.body());
  }

  Future<ApiResult> addPayment(Debitor debitor) async{
    return await getApiStatus(url: ApiSetting.ADD_PAYMENT, options: option('POST'), data: debitor.body2());
  }

  Future<ApiResult> getUserLoan(SelectUser selectUser) async{
    return await getApiStatus(url: ApiSetting.GET_TRANSACTION, options: option('POST'), data: selectUser.body2());
  }

}