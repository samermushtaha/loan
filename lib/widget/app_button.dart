import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppButton extends StatelessWidget {
  late Function() onClick;
  late Color color;
  late String title;
  AppButton({required this.onClick, required this.title, required this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onClick();
      },
      child: Text(
        title,
        style: TextStyle(
          color: AppColor.black,
          fontSize: AppFont.medium,
          fontFamily: AppFont.fontFamily,
        ),
      ),
      style: ElevatedButton.styleFrom(
          primary: color,
          minimumSize: Size(double.infinity, 50.h),
          elevation: 0),
    );
  }
}
