import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';
import 'package:loan_app/widget/app_button.dart';
import 'package:loan_app/widget/app_selected_page.dart';
import '../app_setting/app_font.dart';

class AppOutBoarding extends StatelessWidget {
  late String image;
  late String title;
  late String subTitle;

  AppOutBoarding({
    required this.image,
    required this.title,
    required this.subTitle,
  });

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

        ///Rounded Container
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: context.theme.backgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ).r,
            ),
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
                    color: context.theme.textTheme.headline1!.color,
                    fontFamily: AppFont.fontFamily,
                    fontSize: AppFont.veryLarge,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 15.h),

                /// Subtitle
                Text(
                  subTitle,
                  style: TextStyle(
                    color: context.theme.textTheme.subtitle1!.color,
                    fontFamily: AppFont.fontFamily,
                    fontSize: AppFont.medium,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),

                /// Selected page
                GetBuilder<OutBoardingController>(
                  id: 'outBoardingUpdate',
                  builder: (controller) {
                    return controller.pageIndex != controller.pages.length - 1
                        ? AppSelectedPage(controller: controller)
                        : AppButton(
                            onClick: () {
                              controller.onGetStartClick();
                            },
                            title: 'start'.tr,
                            color: context.theme.primaryColor,
                          );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
