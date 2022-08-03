import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/widget/app_notification.dart';

import '../app_setting/app_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'notification'.tr,
          style: TextStyle(
              color: AppColor.textColor,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        toolbarHeight: 60.h,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Container(
        height: 1.sh,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: AppColor.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50).r,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return AppNotification(
                image: 'images/img_person.png',
                title: 'Samer Mushtaha',
                subTitle: 'Lorem Ipsum is simply dummy text of the printing',
                date: '13/12/2001',
                seen: true,
              );
            },
            itemCount: 3,
          ),
        ),
      ),
    );
  }
}
