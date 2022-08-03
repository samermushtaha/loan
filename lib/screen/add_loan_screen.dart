import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/add_loan_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_phone_text_filed.dart';
import 'package:loan_app/widget/app_text_filed.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../controller/sign_in_controller.dart';

class AddLoanScreen extends StatelessWidget {
  AddLoanScreen({Key? key}) : super(key: key);

  AddLoanController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'request_loan'.tr,
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
            children: [
              SizedBox(height: 50.h),
              AppTextFiled(
                controller: _controller.phone,
                title: 'phone',
                hint: '+972591234567',
                icon: Icons.call,
                isEnable: false,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required';
                  }
                },
                onClick: (){},
              ),              SizedBox(height: 15.h),
              AppTextFiled(
                controller: _controller.deadline,
                title: 'deadline',
                hint: 'dd/mm/yyyy',
                icon: Icons.calendar_month_outlined,
                isEnable: false,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required';
                  }
                },
                onClick: (){},
              ),
              AppTextFiled(
                controller: _controller.amount,
                title: 'amount',
                hint: '100',
                icon: Icons.attach_money,
                type: TextInputType.number,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required';
                  }
                },
              ),
              AppTextFiled(
                controller: _controller.note,
                title: 'note',
                hint: 'note_hint',
                minLine: 3,
                validator: (value){
                  if(value!.isEmpty){
                    return 'Required';
                  }
                },
              ),
              SizedBox(height: 20.h),
              AppButton(
                onClick: () {},
                title: 'request',
                color: AppColor.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
