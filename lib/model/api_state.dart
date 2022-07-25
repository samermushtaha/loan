import 'package:get/get.dart';

class ApiState{
  RxBool? isLoading;
  RxBool? isError;

  ApiState({required this.isLoading, required this.isError});
}