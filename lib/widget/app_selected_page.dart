import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import '../app_setting/app_color.dart';

class AppSelectedPage extends StatelessWidget {
  late OutBoardingController controller;
  AppSelectedPage({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20.h,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CircleAvatar(
            backgroundColor:
            controller.pageIndex == index
                ? context.theme.primaryColor
                : context.theme.textTheme.subtitle1!.color,
            radius: 5.r,
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10.w,
          );
        },
        itemCount: controller.pages.length,
      ),
    );
  }
}
