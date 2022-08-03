import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/widget/app_profile_item.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'profile'.tr,
          style: TextStyle(
              color: AppColor.textColor,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        toolbarHeight: 60.h,
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        automaticallyImplyLeading: false,
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
            Container(
              width: double.infinity,
              height: 0.3.sh,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      child: Image.asset('images/img_person.png'),
                      radius: 50.r,
                      backgroundColor: AppColor.white,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Samer Mushtaha',
                      style: TextStyle(
                        color: AppColor.black,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.large,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
            ListView.separated(
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return AppProfileItem(
                  onClick: _controller.list[index].onClick,
                  icon: _controller.list[index].icon,
                    title: _controller.list[index].title,
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColor.blue2,
                );
              },
              itemCount: _controller.list.length,
            )
          ],
        ),
      ),
    );
  }
}
