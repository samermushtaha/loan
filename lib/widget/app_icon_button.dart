import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_setting/app_color.dart';

class AppIconButton extends StatelessWidget {
  late Icon icon;
  late Function() onClick;

  AppIconButton({required this.icon, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColor.white,
        boxShadow: [
          BoxShadow(
            color: AppColor.gray,
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      padding: EdgeInsets.all(5).r,
      child: IconButton(
        onPressed: onClick,
        icon: icon
      ),
    );
  }
}
