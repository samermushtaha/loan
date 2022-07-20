import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';

class OutBoardingScreen extends StatelessWidget {
  OutBoardingScreen({Key? key}) : super(key: key);

  OutBoardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {},
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 0.6.sh,
                child: Center(
                  child: Image.asset('images/img_out_boarding_1.png'),
                ),
              ),
              SizedBox(
                height: 20.h,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return CircleAvatar(
                      backgroundColor: AppColor.orange,
                      radius: 10.r,
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                  itemCount: 2,
                ),
              ),
              SizedBox(height: 50.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Text(
                  'Get Access To Quick Loans',
                  style: TextStyle(
                      color: AppColor.black,
                      fontFamily: AppFont.fontFamily,
                      fontSize: AppFont.veryLarge),
                ),
              ),
              SizedBox(height: 5.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20).r,
                child: Text(
                  'Easily get access to loans using your phone',
                  style: TextStyle(
                    color: AppColor.gray,
                    fontFamily: AppFont.fontFamily,
                    fontSize: AppFont.medium,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
