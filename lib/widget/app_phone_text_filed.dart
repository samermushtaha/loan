import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loan_app/controller/sign_in_controller.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../app_setting/app_local_storage.dart';

class AppPhoneTextFiled extends StatelessWidget {
  late SignInController controller;
  AppPhoneTextFiled({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              border: Border.all(color: AppColor.gray),
              borderRadius: BorderRadius.circular(10).r
          ),
          child: InternationalPhoneNumberInput(
            maxLength: 11,
            autoFocus: true,
            locale: AppLocalStorage().language,
            cursorColor: AppColor.blue,
            textStyle: TextStyle(color: AppColor.black, fontSize: AppFont.medium, fontFamily: AppFont.fontFamily),
            selectorConfig: SelectorConfig(
                trailingSpace: false,
                leadingPadding: 20.r,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET
            ),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              hintText: '591234567',
              hintStyle: TextStyle(color: AppColor.gray, fontSize: AppFont.medium, fontFamily: AppFont.fontFamily),
            ),
            onInputChanged: (phone) {
              controller.onPhoneNumberChange(phone.phoneNumber!);
            },
          ),
        ),
        SizedBox(height: 5.h),
        GetBuilder<SignInController>(
          id: 'checkValidate',
          builder: (controller) {
            return !controller.validate ? Align(alignment: Alignment.centerLeft, child: Text('Phone number is required', style: TextStyle(color: Colors.red, fontSize: AppFont.verySmall, fontFamily: AppFont.fontFamily),)) : SizedBox();
          }
        )
      ],
    );
  }
}
