import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/verification_code_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import '../widget/app_verification_code.dart';

class VerificationCodeScreen extends StatelessWidget {
  VerificationCodeScreen({Key? key}) : super(key: key);

  VerificationCodeController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'VerificationAppBar'.tr,
          style: TextStyle(
              color: AppColor.white,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30).r,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20).r,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft: Radius.circular(50),
              ).r,
              color: AppColor.white),
          child: Column(
            children: [
              SizedBox(height: 50.h),
              /// Title
              Text(
                'verificationTitle'.tr,
                style: TextStyle(
                  color: AppColor.black,
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

              /// Continue button
              AppButton(
                onClick: () {},
                title: 'continue'.tr,
                color: AppColor.blue,
              ),
              SizedBox(height: 10.h),

              /// Footer
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'notReceived'.tr,
                    style: TextStyle(
                      color: AppColor.black,
                      fontFamily: AppFont.fontFamily,
                      fontSize: AppFont.medium,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'resent'.tr,
                      style: TextStyle(
                        color: AppColor.blue,
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
      ),
    );
  }
}
