import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/widget/app_text_filed.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../widget/user_card.dart';

class AllUserScreen extends StatelessWidget {
  const AllUserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'all_users'.tr,
          style: TextStyle(
              color: AppColor.textColor,
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
            color: AppColor.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.filter_list,
                color: AppColor.white,
              )),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: AppColor.white,
        ),
        child: Column(
          children: [
            AppTextFiled(
              controller: TextEditingController(),
              title: '',
              hint: 'search',
              icon: Icons.search,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                }
              },
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return UserCard();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 10.h,
                  );
                },
                itemCount: 3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
