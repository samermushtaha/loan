import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/controller/verification_code_controller.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppVerificationCode extends StatelessWidget {
  late VerificationCodeController controller;

  AppVerificationCode({required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80.h,
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onDoubleTap: () {
              controller.pastVerificationCode();
            },
            child: SizedBox(
              width: 60.w,
              height: 60.h,
              child: TextField(
                controller: controller.list[index],
                cursorColor: AppColor.blue,
                textAlign: TextAlign.center,
                maxLength: 1,
                autofocus: true,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                style: TextStyle(
                  color: AppColor.blue,
                  fontFamily: AppFont.fontFamily,
                  fontSize: AppFont.veryLarge,
                ),
                decoration: InputDecoration(
                  counter: SizedBox(),
                  contentPadding: EdgeInsets.zero,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.blue),
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: AppColor.gray),
                    borderRadius: BorderRadius.circular(10).r,
                  ),
                ),
                onChanged: (value) {
                  controller.onChange(context, index);
                },
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 20.w,
          );
        },
        itemCount: controller.list.length,
      ),
    );
  }
}
