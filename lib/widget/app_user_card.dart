import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/app_setting/app_route.dart';

import '../api/api_setting.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../model/response/all_user_response.dart';

class AppUserCard extends StatelessWidget {
  late UserCard userCard;
  late Function onClick;
  AppUserCard(this.userCard, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: context.theme.textTheme.subtitle1!.color!),
          borderRadius: BorderRadius.circular(10).r),
      child: ListTile(
        onTap: (){onClick();},
        leading: CircleAvatar(
          radius: 30.r,
          backgroundImage: userCard.image != null ? NetworkImage(ApiSetting.BASE_URL + '/' + userCard.image!) : AssetImage('images/img_person.png') as ImageProvider,
          backgroundColor: context.theme.backgroundColor,
        ),
        title: Text(
          userCard.firstName.toString() + ' ' + userCard.lastName.toString(),
          style: TextStyle(
            color: context.theme.textTheme.headline1!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.medium,
          ),
        ),
        subtitle: Text(
          userCard.phoneNumber,
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
