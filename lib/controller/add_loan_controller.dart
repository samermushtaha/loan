import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/api/api_controller/loan_api.dart';
import 'package:loan_app/api/api_helper.dart';
import 'package:loan_app/controller/home_controller.dart';
import 'package:loan_app/model/api_result.dart';
import 'package:loan_app/model/debitor.dart';

import '../model/api_state.dart';

class AddLoanController extends GetxController {
  LoanApi loanApi = LoanApi();
  late TextEditingController phone;
  late TextEditingController deadline;
  late TextEditingController amount;
  late TextEditingController note;
  late String loanType;
  late String selectedTime;
  late String selectedDate;
  late DateTime selectedDateTime;
  ApiState apiState = ApiState(isLoading: false.obs, isError: false.obs);
  bool validate = true;
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    loanType = Get.arguments[0];
    if(loanType == 'pay'){
      phone = TextEditingController(text: Get.arguments[1].toString());
      deadline = TextEditingController(text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
    }else{
      phone = TextEditingController();
      deadline = TextEditingController();
    }
    amount = TextEditingController();
    note = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phone.dispose();
    deadline.dispose();
    amount.dispose();
    note.dispose();
    super.onClose();
  }

  Future<void> onSelectDateTimeClick(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 10),
    );
    if (date != null) {
      selectedDate = date.toString();
    }

    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (time != null) {
      selectedTime = time.toString();
    }

    if(date != null && time != null){
      selectedDateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
    }

    deadline.text = DateFormat('yyyy-MM-dd HH:mm').format(selectedDateTime);
  }

  Future<void> onAddLoanClick() async {
    if (formKey.currentState!.validate()) {
      apiState.isLoading.value = true;
      Debitor debitor = Debitor(amount: amount.text, deadline: deadline.text, note: note.text, phone: phone.text);
      late ApiResult apiResult;
      if (loanType == 'cr') {
        apiResult = await loanApi.addDebitor(debitor);
      } else if (loanType == 'dr') {
        apiResult = await loanApi.addCreditor(debitor);
      } else if(loanType == 'pay'){
        apiResult = await loanApi.addPayment(debitor);
      }
      apiState.isLoading.value = false;
      if (apiResult.status == ApiStatus.success) {
        HomeController controller = Get.find();
        apiState.isLoading.value = true;
        await controller.getNearLoan();
        await controller.getAllUser();
        apiState.isLoading.value = false;
        Get.back();
      } else {
        apiState.isError.value = true;
      }
    }
  }
}
