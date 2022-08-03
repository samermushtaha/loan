import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/verification_code_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import '../../widget/app_verification_code.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);

  VerificationCodeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'verificationAppBar'.tr,
          style: TextStyle(
              color: context.theme.textTheme.headline2!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        toolbarHeight: 60.h,
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back, color: context.theme.textTheme.headline2!.color,),),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: context.theme.backgroundColor,
        ),
        child: Column(
          children: [
            SizedBox(height: 50.h),

            /// Title
            Text(
              'verificationTitle'.tr,
              style: TextStyle(
                color: context.theme.textTheme.headline1!.color,
                fontSize: AppFont.veryLarge,
                fontFamily: AppFont.fontFamily,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30.h),

            /// Verification code TextFiled
            AppVerificationCode(
              controller: _controller,
            ),
            SizedBox(height: 30.h),

            /// Continue button
            AppButton(
              onClick: () {
                _controller.onConfirmClick();
              },
              title: 'confirm'.tr,
              color: context.theme.primaryColor,
              state: _controller.apiState,
            ),
            SizedBox(height: 10.h),

            /// Footer
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'notReceived'.tr,
                  style: TextStyle(
                    color: context.theme.textTheme.headline1!.color,
                    fontFamily: AppFont.fontFamily,
                    fontSize: AppFont.medium,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'resent'.tr,
                    style: TextStyle(
                      color: context.theme.primaryColor,
                      fontFamily: AppFont.fontFamily,
                      fontSize: AppFont.medium,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
