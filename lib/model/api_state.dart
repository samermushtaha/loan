import 'package:get/get.dart';

class ApiState{
  late RxBool isLoading;
  late RxBool isError;

  ApiState({required this.isLoading, required this.isError});
}