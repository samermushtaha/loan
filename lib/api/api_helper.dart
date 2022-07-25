import 'package:dio/dio.dart';

mixin ApiHelper{
  bool isSuccessRequest(int statusCode) {
    return statusCode < 400;
  }
}