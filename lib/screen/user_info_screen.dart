import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/user_info_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_user_info.dart';

class UserInfoScreen extends StatelessWidget {
  UserInfoScreen({Key? key}) : super(key: key);

  UserInfoController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10).r,
                    boxShadow: [
                      BoxShadow(
                        color: AppColor.gray,
                        spreadRadius: 2,
                        blurRadius: 10,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: _controller.list.length,
                      itemBuilder: (context, index) {
                        return AppUserInfo(
                            title: _controller.list[index].title,
                            value: _controller.list[index].value);
                      }),
                ),
                Center(
                  child: CircleAvatar(
                    child: Image.asset(
                      'images/img_person.png',
                    ),
                    backgroundColor: AppColor.white,
                    radius: 40.r,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.h),
            AppButton(onClick: () {}, title: 'Call him', color: AppColor.blue)
          ],
        ),
      ),
    );
  }
}
