import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppTransaction extends StatelessWidget {
  late String who;
  late String amount;
  late String date;

  AppTransaction({required this.who, required this.amount, required this.date});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: who == 'cr' ? Icon(
        Icons.arrow_upward_rounded,
        color: AppColor.green,
      ) : Icon(
        Icons.arrow_downward_rounded,
        color: AppColor.red,
      ),
      title: Text(
        '$amount\$',
        style: TextStyle(
          color: context.theme.textTheme.headline1!.color,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.large,
        ),
      ),
      trailing: Text(
        date,
        style: TextStyle(
          color: AppColor.gray,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.small,
        ),
      ),
    );
  }
}
