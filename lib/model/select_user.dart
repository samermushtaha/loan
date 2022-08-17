import 'package:dio/dio.dart';

class SelectUser{
  late String phoneNumber;
  int? pageSize;
  int? page;

  SelectUser({required this.phoneNumber, this.pageSize, this.page});

  FormData body(){
    return FormData.fromMap({
      'select_phone': phoneNumber,
    });
  }

  FormData body2(){
    return FormData.fromMap({
      'select_phone': phoneNumber,
      'page_size': pageSize.toString(),
      'page': page.toString(),
    });
  }
}