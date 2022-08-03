import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/sign_up_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_text_filed.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  SignUpController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'edit_profile'.tr,
          style: TextStyle(
              color: AppColor.textColor,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        toolbarHeight: 60.h,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back, color: AppColor.white,),),
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: AppColor.white,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Container(
                width: double.infinity,
                height: 0.2.sh,
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: AppColor.gray,
                    child: Icon(
                      Icons.add_a_photo,
                      color: AppColor.white,
                    ),
                    radius: 40.r,
                  ),
                ),
              ),

              /// TextFiled
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AppTextFiled(
                      controller: _controller.firstName,
                      title: 'first_name',
                      hint: 'first_name',
                      validator: (value){
                        if(value == null){
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
                        if(value == null){
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
                  if(value == null){
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
                onClick: () {
                  _controller.onSelectDateClick(context, _controller);
                },
                validator: (value){
                  if(value == null){
                    return 'Required';
                  }
                },
              ),

              AppTextFiled(
                controller: _controller.address,
                title: 'address',
                hint: 'address',
                icon: Icons.location_on_outlined,
                isEnable: false,
                validator: (value){
                  if(value == null){
                    return 'Required';
                  }
                },
                onClick: () {
                  _controller.onSelectLocationClick();
                },
              ),
              SizedBox(height: 15.h),

              AppButton(
                onClick: () {
                  _controller.onSignUpClick();
                },
                title: 'sign_up',
                color: AppColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
