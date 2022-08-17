import 'package:loan_app/api/api_helper.dart';

class ApiResult{
  late ApiStatus status;
  late dynamic data;

  ApiResult({required this.status, required this.data});
}