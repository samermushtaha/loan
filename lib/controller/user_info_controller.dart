import 'package:get/get.dart';
import 'package:loan_app/model/user_info.dart';

class UserInfoController extends GetxController{

  List<UserInfo> list = [
    UserInfo(title: 'name', value: 'Samer Mushtaha'),
    UserInfo(title: 'email', value: 'samermushtaha@gmail.com'),
    UserInfo(title: 'Phone', value: '+972592121665'),
    UserInfo(title: 'birthdate', value: '13.Dec 2001'),
    UserInfo(title: 'location', value: 'Gaza'),
  ];

}