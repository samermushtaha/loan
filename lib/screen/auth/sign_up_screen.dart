import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/sign_up_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_text_filed.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  SignUpController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Container(
                width: double.infinity,
                height: 0.3.sh,
                child:
                    Center(child: SvgPicture.asset('images/img_sign_up.svg')),
              ),

              /// Title
              Text(
                'sign_up_title'.tr,
                style: TextStyle(
                  color: context.theme.textTheme.headline1!.color,
                  fontFamily: AppFont.fontFamily,
                  fontSize: AppFont.veryLarge,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 25.h),

              Form(
                key: _controller.formKey,
                  child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: AppTextFiled(
                          controller: _controller.firstName,
                          title: 'first_name',
                          hint: 'first_name',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Required';
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Flexible(
                        child: AppTextFiled(
                          controller: _controller.lastName,
                          title: 'last_name',
                          hint: 'last_name',
                          validator: (value){
                            if(value!.isEmpty){
                              return 'Required';
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  AppTextFiled(
                    controller: _controller.email,
                    title: 'email',
                    hint: 'example@gmail.com',
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }
                    },
                  ),
                  AppTextFiled(
                    controller: _controller.birthdate,
                    title: 'birthdate',
                    hint: 'dd/mm/yyyy',
                    icon: Icons.date_range,
                    isEnable: false,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }
                    },
                    onClick: () {
                      _controller.onSelectDateClick(context, _controller);
                    },
                  ),
                  AppTextFiled(
                    controller: _controller.address,
                    title: 'address',
                    hint: 'address',
                    icon: Icons.location_on_outlined,
                    isEnable: false,
                    validator: (value){
                      if(value!.isEmpty){
                        return 'Required';
                      }
                    },
                    onClick: () {
                      _controller.onSelectLocationClick();
                    },
                  ),
                  SizedBox(height: 15.h),
                ],
              )),

              AppButton(
                onClick: () {
                  _controller.onSignUpClick();
                },
                title: 'sign_up',
                color: context.theme.primaryColor,
                state: _controller.apiState,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
