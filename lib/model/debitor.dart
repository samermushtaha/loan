import 'package:dio/dio.dart';

class Debitor{
  late String phone;
  late String amount;
  String? deadline;
  late String note;

  Debitor({required this.phone, required this.amount, this.deadline, required this.note});

  FormData body() {
    return FormData.fromMap({
      'phone': phone,
      'amount': amount,
      'deadline': deadline,
      'note': note,
    });
  }

  FormData body2() {
    return FormData.fromMap({
      'phone': phone,
      'amount': amount,
      'note': note,
    });
  }
}