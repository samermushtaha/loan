import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppOutBoarding extends StatelessWidget {
  late String image;
  late String title;
  late String subTitle;
  late OutBoardingController controller;

  AppOutBoarding(
      {required this.image,
      required this.title,
      required this.subTitle,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Image
        Container(
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          height: 0.6.sh,
          child: SvgPicture.asset(image),
        ),

        ///Next Page
        GetBuilder<OutBoardingController>(builder: (controller) {
          return Expanded(
            child: Container(
              decoration: BoxDecoration(color: AppColor.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(50), topRight: Radius.circular(50)).r),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  /// Title
                  Text(
                    title,
                    style: TextStyle(
                        color: AppColor.black,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.veryLarge),
                  ),
                  SizedBox(height: 15.h),

                  /// Subtitle
                  Text(
                    subTitle,
                    style: TextStyle(
                      color: AppColor.gray,
                      fontFamily: AppFont.fontFamily,
                      fontSize: AppFont.medium,
                    ),
                  ),
                  Spacer(),

                  /// Selected page
                  GetBuilder<OutBoardingController>(builder: (controller) {
                    return SizedBox(
                      height: 20.h,
                      child: ListView.separated(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CircleAvatar(
                            backgroundColor: controller.pageIndex == index
                                ? AppColor.blue
                                : AppColor.gray,
                            radius: 5.r,
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                        itemCount: controller.pages.length,
                      ),
                    );
                  }),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }
}
