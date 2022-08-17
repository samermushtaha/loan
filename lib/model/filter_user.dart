import 'package:dio/dio.dart';

class FilterUser{
  late String filterBy;
  late int pageSize;
  late int page;

  FilterUser({required this.filterBy, required this.pageSize, required this.page});

  FormData body(){
    return FormData.fromMap({
      'type': filterBy,
      'page_size': pageSize,
      'page': page,
    });
  }
}