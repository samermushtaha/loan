import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/utils.dart';
import 'package:loan_app/controller/verification_code_controller.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppVerificationCode extends StatelessWidget {
  late VerificationCodeController controller;

  AppVerificationCode({required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VerificationCodeController>(
      id: 'checkValidate2',
      builder: (controller2) {
        return SizedBox(
          height: 60.h,
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
                  child: TextField(
                    controller: controller.list[index],
                    cursorColor: context.theme.primaryColor,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    style: TextStyle(
                      color: context.theme.textTheme.headline1!.color,
                      fontFamily: AppFont.fontFamily,
                      fontSize: AppFont.veryLarge,
                    ),
                    decoration: InputDecoration(
                      counter: SizedBox(),
                      contentPadding: EdgeInsets.symmetric(vertical: 13).r,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: context.theme.primaryColor),
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: controller2.validate != null ? controller2.validate! ? AppColor.green : AppColor.red : AppColor.gray),
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
    );
  }
}
