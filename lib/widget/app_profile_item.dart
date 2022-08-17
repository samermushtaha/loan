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
          color: context.theme.textTheme.headline3!.color,
        ),
        child: Icon(
          icon,
          color: context.theme.iconTheme.color,
        ),
      ),
      horizontalTitleGap: 25.w,
      title: Text(
        title.tr,
        style: TextStyle(
          color: context.theme.textTheme.headline1!.color,
          fontFamily: AppFont.fontFamily,
          fontSize: AppFont.medium,
        ),
      ),
    );
  }
}
