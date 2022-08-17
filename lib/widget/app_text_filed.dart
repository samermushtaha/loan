import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppTextFiled extends StatelessWidget {
  late String title;
  late String hint;
  late TextEditingController controller;
  late bool isEnable;
  late IconData? icon;
  late int minLine;
  late TextInputType type;
  Function(String value)? onChange = (value){};
  late GetxController getxController;
  Function()? onClick = (){};
  Function(String? value) validator;

  AppTextFiled({
    required this.controller,
    required this.title,
    required this.hint,
    this.isEnable = true,
    this.icon,
    this.type = TextInputType.text,
    this.minLine = 1,
    this.onClick,
    this.onChange,
    required this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.tr,
          style: TextStyle(
            color: context.theme.textTheme.headline1!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.medium,
          ),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onClick,
          child: SizedBox(
            height: 65.h,
            child: TextFormField(
              controller: controller,
              cursorColor: context.theme.primaryColor,
              enabled: isEnable,
              minLines: minLine,
              maxLines: minLine + 1,
              keyboardType: type,
              style: TextStyle(color: context.theme.textTheme.headline1!.color, fontFamily: AppFont.fontFamily),
              textInputAction: TextInputAction.next,
              validator: (value) => validator(value),
              onChanged: (value) => onChange == null  ? (value){} : onChange!(value),
              decoration: InputDecoration(
                counter: SizedBox(),
                prefixIcon: icon != null ? Icon(icon) : null,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 15, vertical: 12).r,
                hintText: hint.tr,
                hintStyle: TextStyle(
                  color: AppColor.gray,
                  fontFamily: AppFont.fontFamily,
                  fontSize: AppFont.medium,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).r,
                  borderSide: BorderSide(color: context.theme.primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).r,
                  borderSide: BorderSide(color: AppColor.gray),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).r,
                  borderSide: BorderSide(color: AppColor.gray),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).r,
                  borderSide: BorderSide(color: AppColor.red),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10).r,
                  borderSide: BorderSide(color: context.theme.primaryColor),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
