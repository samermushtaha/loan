import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/sign_in_controller.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../model/api_state.dart';

class AppButton extends StatelessWidget {
  late Function() onClick;
  late Color color;
  late String title;
  ApiState? state;

  AppButton({
    required this.onClick,
    required this.title,
    required this.color,
    this.state
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: state != null ? state!.isLoading.value ? null : (){onClick();} : (){onClick();},
      child: state != null
          ? Obx(
              () => state!.isLoading.value
                  ? CircularProgressIndicator(color: context.theme.textTheme.headline2!.color,)
                  : state!.isError.value
                      ? Text(
                          'Error',
                          style: TextStyle(
                            color: context.theme.textTheme.headline2!.color,
                            fontSize: AppFont.medium,
                            fontFamily: AppFont.fontFamily,
                          ),
                        )
                      : Text(
                          title.tr,
                          style: TextStyle(
                            color: context.theme.textTheme.headline2!.color,
                            fontSize: AppFont.medium,
                            fontFamily: AppFont.fontFamily,
                          ),
                        ),
            )
          : Text(
              title.tr,
              style: TextStyle(
                color: context.theme.textTheme.headline2!.color,
                fontSize: AppFont.medium,
                fontFamily: AppFont.fontFamily,
              ),
            ),
      style: ElevatedButton.styleFrom(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
        primary: color,
        minimumSize: Size(double.infinity, 50.h),
        elevation: 0,
      ),
    );
  }
}
