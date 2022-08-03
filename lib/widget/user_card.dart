import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/app_setting/app_route.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: context.theme.textTheme.subtitle1!.color!),
          borderRadius: BorderRadius.circular(10).r),
      child: ListTile(
        onTap: (){Get.toNamed(Routes.loanDetailsScreen);},
        leading: CircleAvatar(
          child: Image.asset('images/img_person.png'),
          radius: 30.r,
          backgroundColor: context.theme.backgroundColor,
        ),
        title: Text(
          'Samer Mushtaha',
          style: TextStyle(
            color: context.theme.textTheme.headline1!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.medium,
          ),
        ),
        subtitle: Text(
          '+972592121665',
          style: TextStyle(
            color: context.theme.textTheme.subtitle1!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.small,
          ),
        ),
      ),
    );
  }
}
