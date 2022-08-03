import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppUserInfo extends StatelessWidget {
  late String title;
  late String value;

  AppUserInfo({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title.tr,
        style: TextStyle(
          color: AppColor.black,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.medium,
        ),
      ),
      trailing: Text(
        value,
        style: TextStyle(
          color: AppColor.gray,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.small,
        ),
      ),
    );
  }
}
