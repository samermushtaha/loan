import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/model/debtor.dart';
import 'package:loan_app/model/select_user.dart';
import '../../model/api_result.dart';
import '../api_setting.dart';

class LoanApi with ApiHelper{

  Future<ApiResult> getNearLoan() async{
    return await getApiStatus(url: ApiSetting.NEAR_LOAN, options: option('GET'));
  }

  Future<ApiResult> addDebtor(Debitor debtor) async{
    return await getApiStatus(url: ApiSetting.ADD_DEBTOR, options: option('POST'), data: debtor.body());
  }

  Future<ApiResult> addCreditor(Debitor debtor) async{
    return await getApiStatus(url: ApiSetting.ADD_Creditor, options: option('POST'), data: debtor.body());
  }

  Future<ApiResult> addPayment(Debitor debtor) async{
    return await getApiStatus(url: ApiSetting.ADD_PAYMENT, options: option('POST'), data: debtor.body2());
  }

  Future<ApiResult> getUserLoan(SelectUser selectUser) async{
    return await getApiStatus(url: ApiSetting.GET_TRANSACTION, options: option('POST'), data: selectUser.body2());
  }

}