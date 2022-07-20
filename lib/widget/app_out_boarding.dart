import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class AppOutBoarding extends StatelessWidget {

  late String image;
  late String title;
  late String subTitle;
  late OutBoardingController controller;
  AppOutBoarding({required this.image, required this.title, required this.subTitle, required this.controller});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Container(
          width: double.infinity,
          height: 0.6.sh,
          child: Center(
            child: Image.asset(image),
          ),
        ),
        SizedBox(
          height: 20.h,
          child: ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return CircleAvatar(
                backgroundColor: controller.pageIndex == index ? AppColor.orange : AppColor.gray,
                radius: 5.r,
              );
            },
            separatorBuilder: (context, index) {
              return SizedBox(
                width: 10.w,
              );
            },
            itemCount: controller.outBoardingList.length,
          ),
        ),
        SizedBox(height: 50.h),
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
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20).r,
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextButton(
                  onPressed: () {controller.onSkipClick();},
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
                  onPressed: () {controller.onNextPageClick(controller.pageIndex);},
                  icon: Container(
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Icon(
                      Icons.arrow_forward,
                      color: AppColor.orange,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
