import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/home_controller.dart';
import 'package:loan_app/model/response/all_user_response.dart';
import 'package:loan_app/widget/app_error.dart';
import 'package:loan_app/widget/last_amount.dart';
import 'package:loan_app/widget/last_load_card.dart';
import 'package:loan_app/widget/app_user_card.dart';

import '../widget/app_api_states.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  HomeController _controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'welcome'.tr +
              SharedPreferencesController().currentUser.firstName.toString(),
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
          IconButton(
              onPressed: () {
                Get.toNamed(Routes.notificationScreen);
              },
              icon: Icon(
                Icons.notifications_none,
                color: context.theme.textTheme.headline2!.color,
              ))
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () {return _controller.onRefreshing();},
        child: Stack(
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
                    SizedBox(height: 80.h),

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
                          onPressed: () {
                            Get.toNamed(Routes.allUserScreen);
                          },
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
                    GetX<HomeController>(builder: (controller) {
                      return Expanded(
                        child: AppApiStates(
                          apiState: controller.userApiState,
                          list: controller.allUsers,
                          loading: Container(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: context.theme.primaryColor,
                              ),
                            ),
                          ),
                          success: ListView.separated(
                            itemBuilder: (context, index) {
                              return AppUserCard(
                                  UserCard(
                                    phoneNumber: controller
                                                .allUsers[index].firstName ==
                                            null
                                        ? ''
                                        : controller.allUsers[index].phoneNumber,
                                    image: controller.allUsers[index].image,
                                    firstName: controller
                                                .allUsers[index].firstName ==
                                            null
                                        ? controller.allUsers[index].phoneNumber
                                        : controller.allUsers[index].firstName,
                                    lastName:
                                        controller.allUsers[index].lastName ==
                                                null
                                            ? ''
                                            : controller.allUsers[index].lastName,
                                  ), () {
                                Get.toNamed(Routes.loanDetailsScreen, arguments: [
                                  controller.allUsers[index].phoneNumber
                                ]);
                              });
                            },
                            separatorBuilder: (context, index) {
                              return SizedBox(
                                height: 10.h,
                              );
                            },
                            itemCount: controller.allUsers.length,
                          ),
                          empty: Container(
                            child: Center(
                              child: Text(
                                'Empty',
                                style: TextStyle(
                                  color: context.theme.textTheme.headline1!.color,
                                  fontFamily: AppFont.fontFamily,
                                  fontSize: AppFont.medium,
                                ),
                              ),
                            ),
                          ),
                          error: Container()
                        ),
                      );
                    })
                  ],
                ),
              ),
            ),

            /// Last Loan Cart
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40).r,
                child: LastLoanCard(controller: _controller)),
          ],
        ),
      ),
    );
  }
}
