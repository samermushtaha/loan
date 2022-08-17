import 'package:dio/dio.dart';

class SearchUser{
  late String phoneNumber;
  late int pageSize;
  late int page;

  SearchUser({required this.phoneNumber, required this.pageSize, required this.page});

  FormData body(){
    return FormData.fromMap({
      'phone_number': phoneNumber,
      'page_size': pageSize,
      'page': page,
    });
  }

  FormData body2(){
    return FormData.fromMap({
      'phone': phoneNumber,
      'page_size': pageSize,
      'page': page,
    });
  }
}