import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddLoanController extends GetxController{
  late TextEditingController phone;
  late TextEditingController deadline;
  late TextEditingController amount;
  late TextEditingController note;

  @override
  void onInit() {
    phone = TextEditingController();
    deadline = TextEditingController();
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
}