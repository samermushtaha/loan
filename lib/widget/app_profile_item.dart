import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppProfileItem extends StatelessWidget {
  late IconData icon;
  late String title;
  late Function onClick;

  AppProfileItem({required this.icon, required this.title, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: (){onClick();},
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: EdgeInsets.all(10).r,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColor.blue2,
        ),
        child: Icon(
          icon,
          color: AppColor.blue,
        ),
      ),
      horizontalTitleGap: 25.w,
      title: Text(
        title.tr,
        style: TextStyle(
          color: AppColor.black,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.medium,
        ),
      ),
    );
  }
}
