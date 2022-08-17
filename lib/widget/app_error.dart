import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_setting/app_font.dart';

class AppError extends StatelessWidget {
  late Function() onClick;

  AppError({required this.onClick()});

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.dangerous_outlined, size: 100.r,), Text('Some thing went wrong', style: TextStyle(color: context.theme.textTheme.headline1!.color, fontFamily: AppFont.fontFamily, fontSize: AppFont.medium),), TextButton(onPressed: (){onClick();}, child: Text('Try again', style: TextStyle(color: context.theme.primaryColor, fontFamily: AppFont.fontFamily, fontSize: AppFont.medium),)),],),),);
  }
}
