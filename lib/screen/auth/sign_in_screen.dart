import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/sign_in_controller.dart';
import 'package:loan_app/model/api_state.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_phone_text_filed.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);

  SignInController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          children: [
            /// Logo
            Container(
              width: double.infinity,
              height: 0.35.sh,
              child: Center(
                child: Image.asset('images/img_logo.png'),
              ),
            ),

            /// Title
            Text(
              'signIn'.tr,
              style: TextStyle(
                color: context.theme.textTheme.headline1!.color,
                fontFamily: AppFont.fontFamily,
                fontSize: AppFont.veryLarge,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.h),

            /// Phone Number TextFiled
            AppPhoneTextFiled(controller: _controller, title: 'enterPhone'),
            SizedBox(
              height: 30.h,
            ),

            /// Continue Button
            AppButton(
              onClick: () {
                _controller.onLoginClick();
              },
              title: 'login'.tr,
              color: context.theme.primaryColor,
              state: _controller.apiState
            ),
          ],
        ),
      ),
    );
  }
}
