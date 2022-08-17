import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/edit_profile_controller.dart';
import 'package:loan_app/controller/sign_up_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_text_filed.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({Key? key}) : super(key: key);

  EditProfileController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'edit_profile'.tr,
          style: TextStyle(
              color: context.theme.textTheme.headline2!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        toolbarHeight: 60.h,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: context.theme.textTheme.headline2!.color,
          ),
        ),
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: context.theme.backgroundColor,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              GetBuilder<EditProfileController>(builder: (controller) {
                return GestureDetector(
                  onTap: () {
                    _controller.onPikeImageClick();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 0.2.sh,
                    child: Center(
                      child: CircleAvatar(
                        backgroundColor: AppColor.gray,
                        backgroundImage: controller.image != null ? FileImage(File(controller.image!.path,)) : controller.currentImage != null ? NetworkImage(controller.currentImage!) : AssetImage('images/img_person.png') as ImageProvider,
                        radius: 40.r,
                      ),
                    ),
                  ),
                );
              }),
              Form(
                  key: _controller.formKey,
                  child: Column(
                    children: [
                      /// TextFiled
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: AppTextFiled(
                              controller: _controller.firstName,
                              title: 'first_name',
                              hint: 'first_name',
                              validator: (value) {
                                if (value == null) {
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
                              validator: (value) {
                                if (value == null) {
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
                        validator: (value) {
                          if (value == null) {
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
                          _controller.onSelectDateClick(context);
                        },
                        validator: (value) {
                          if (value == null) {
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
                        validator: (value) {
                          if (value == null) {
                            return 'Required';
                          }
                        },
                        onClick: () {
                          _controller.onSelectLocationClick();
                        },
                      ),
                    ],
                  )),

              SizedBox(height: 15.h),

              AppButton(
                onClick: () {
                  _controller.onEditClick();
                },
                title: 'save',
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
