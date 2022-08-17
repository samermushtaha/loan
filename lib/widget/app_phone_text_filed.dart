import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:loan_app/controller/sign_in_controller.dart';
import '../app_setting/app_font.dart';

class AppPhoneTextFiled extends StatelessWidget {
  late SignInController controller;
  late String title;

  AppPhoneTextFiled({
    required this.controller,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Phone Number Title
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            title.tr,
            style: TextStyle(
              color: context.theme.textTheme.headline1!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.medium,
            ),
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Container(
          height: 55.h,
          decoration: BoxDecoration(
              border:
                  Border.all(color: context.theme.textTheme.subtitle1!.color!),
              borderRadius: BorderRadius.circular(10).r),
          child: InternationalPhoneNumberInput(
            maxLength: 11,
            initialValue: PhoneNumber(isoCode: 'PSE'),
            autoFocus: true,
            cursorColor: context.theme.primaryColor,
            textStyle: TextStyle(
                color: context.theme.textTheme.headline1!.color,
                fontSize: AppFont.medium,
                fontFamily: AppFont.fontFamily),
            selectorConfig: SelectorConfig(
                trailingSpace: false,
                leadingPadding: 20.r,
                selectorType: PhoneInputSelectorType.BOTTOM_SHEET),
            inputDecoration: InputDecoration(
              border: InputBorder.none,
              hintText: '591234567',
              hintStyle: TextStyle(
                  color: context.theme.textTheme.subtitle1!.color!,
                  fontSize: AppFont.medium,
                  fontFamily: AppFont.fontFamily),
            ),
            onInputChanged: (phone) {
              controller.onPhoneNumberChange(phone.phoneNumber.toString());
            },
          ),
        ),
        SizedBox(height: 5.h),
        GetBuilder<SignInController>(
            id: 'checkValidate',
            builder: (controller) {
              return !controller.validate
                  ? Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Phone number is required',
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: AppFont.verySmall,
                            fontFamily: AppFont.fontFamily),
                      ),
                    )
                  : SizedBox();
            })
      ],
    );
  }
}
