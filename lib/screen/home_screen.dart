import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/widget/last_amount.dart';
import 'package:loan_app/widget/last_load_card.dart';
import 'package:loan_app/widget/user_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'welcome'.tr + SharedPreferencesController().firstName,
          style: TextStyle(
            color: context.theme.textTheme.headline2!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.large,
          ),
        ),
        toolbarHeight: 80.h,
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: context.theme.appBarTheme.backgroundColor,
        actions: [
          IconButton(onPressed: () {Get.toNamed(Routes.notificationScreen);}, icon: Icon(Icons.notifications_none, color: context.theme.textTheme.headline2!.color,))
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70).r,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ).r,
                color: context.theme.backgroundColor,
              ),
              child: Column(
                children: [
                  SizedBox(height: 100.h),

                  /// Header List
                  Row(
                    children: [
                      Text(
                        'users'.tr,
                        style: TextStyle(
                          color: context.theme.textTheme.headline1!.color,
                          fontFamily: AppFont.fontFamily,
                          fontSize: AppFont.large,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      TextButton(
                        onPressed: () {Get.toNamed(Routes.allUserScreen);},
                        child: Text(
                          'view_all'.tr,
                          style: TextStyle(
                            color: context.theme.primaryColor,
                            fontFamily: AppFont.fontFamily,
                            fontSize: AppFont.small,
                          ),
                        ),
                      )
                    ],
                  ),

                  /// User List
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
          ),

          /// Last Loan Cart
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40).r,
            child: LastLoanCard()
          ),
        ],
      ),
    );
  }
}
