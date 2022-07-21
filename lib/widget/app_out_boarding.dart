import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
          width: double.infinity,
          height: 0.6.sh,
          child: Center(
            child: Image.asset(image),
          ),
        ),

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
                      ? AppColor.orange
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
        SizedBox(height: 50.h),

        /// Title
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Text(
            title,
            style: TextStyle(
                color: AppColor.black,
                fontFamily: AppFont.fontFamily,
                fontSize: AppFont.veryLarge),
          ),
        ),
        SizedBox(
          height: 5.h,
        ),

        /// Subtitle
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20).r,
          child: Text(
            subTitle,
            style: TextStyle(
              color: AppColor.gray,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.medium,
            ),
          ),
        ),

        ///Next Page
        GetBuilder<OutBoardingController>(builder: (controller) {
          return Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20).r,
              alignment: Alignment.bottomCenter,
              child: controller.pageIndex != controller.pages.length - 1
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {
                            controller.onSkipClick();
                          },
                          child: Text(
                            'skip',
                            style: TextStyle(
                                color: AppColor.orange,
                                fontSize: AppFont.medium,
                                fontFamily: AppFont.fontFamily),
                          ),
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            controller.onNextPageClick(controller.pageIndex);
                          },
                          icon: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColor.orange,
                            ),
                            child: Center(
                              child: Icon(
                                Icons.arrow_forward,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20).r,
                      child: AppButton(onClick: (){}, title: 'Get Start', color: AppColor.orange),
                    ),
            ),
          );
        }),
      ],
    );
  }
}
