import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppNotification extends StatelessWidget {
  late String image;
  late String title;
  late String subTitle;
  late String date;
  late bool seen;

  AppNotification({required this.image, required this.title, required this.subTitle, required this.date, required this.seen});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: seen ? AppColor.white : AppColor.blue2,
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(image),
          radius: 30.r,
          backgroundColor: AppColor.white,
        ),
        title: Text(
          title.tr,
          style: TextStyle(
            color: AppColor.black,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.medium,
          ),
        ),
        subtitle: Text(
          subTitle.tr,
          style: TextStyle(
            color: AppColor.gray,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.verySmall,
          ),
        ),
        trailing: Text(
          date,
          style: TextStyle(
            color: AppColor.black,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.small,
          ),
        ),
      ),
    );
  }
}
