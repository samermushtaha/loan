import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/loan_details_controller.dart';
import 'package:loan_app/widget/app_button.dart';

import '../api/api_setting.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../widget/app_api_states.dart';
import '../widget/app_error.dart';
import '../widget/app_transaction.dart';

class LoanDetailsScreen extends StatelessWidget {
  LoanDetailsScreen({Key? key}) : super(key: key);

  LoanDetailsController _controller = Get.put(LoanDetailsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => _controller.userApiState.isLoading.value
        ? Scaffold(
            body: Container(
              width: 1.sw,
              height: 1.sh,
              child: Center(
                child: CircularProgressIndicator(
                  color: context.theme.primaryColor,
                ),
              ),
            ),
          )
        : !(_controller.userApiState.isError.value)
            ? Scaffold(
                backgroundColor: context.theme.primaryColor,
                appBar: AppBar(
                  title:
                      GetBuilder<LoanDetailsController>(builder: (controller) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: controller.selectedUser.user!.image !=
                                null
                            ? NetworkImage(ApiSetting.BASE_URL +
                                '/' +
                                controller.selectedUser.user!.image!)
                            : AssetImage('images/img_person.png')
                                as ImageProvider,
                        backgroundColor: context.theme.backgroundColor,
                      ),
                      title: Text(
                        controller.selectedUser.user!.firstName == null
                            ? controller.selectedUser.user!.phoneNumber
                                .toString()
                            : controller.selectedUser.user!.firstName
                                    .toString() +
                                ' ' +
                                controller.selectedUser.user!.lastName
                                    .toString(),
                        style: TextStyle(
                          color: context.theme.textTheme.headline2!.color,
                          fontSize: AppFont.medium,
                          fontFamily: AppFont.fontFamily,
                        ),
                      ),
                      subtitle: Text(
                        controller.selectedUser.user!.firstName == null
                            ? ' '
                            : controller.selectedUser.user!.phoneNumber
                                .toString(),
                        style: TextStyle(
                          color: AppColor.gray,
                          fontSize: AppFont.small,
                          fontFamily: AppFont.fontFamily,
                        ),
                      ),
                    );
                  }),
                  titleSpacing: -10,
                  elevation: 0,
                  toolbarHeight: 70.h,
                  backgroundColor: Colors.transparent,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: context.theme.textTheme.headline2!.color,
                    ),
                  ),
                ),
                body: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 20).r,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      topLeft: Radius.circular(50),
                    ).r,
                    color: context.theme.backgroundColor,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GetBuilder<LoanDetailsController>(builder: (controller) {
                        return Container(
                          width: double.infinity,
                          height: 0.25.sh,
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  controller.selectedUser.amount! > 0
                                      ? controller.selectedUser.amount!
                                          .toString()
                                      : controller.selectedUser.amount!
                                          .toString()
                                          .substring(1),
                                  style: TextStyle(
                                      color: controller.selectedUser.amount! > 0
                                          ? AppColor.green
                                          : AppColor.red,
                                      fontFamily: AppFont.fontFamily,
                                      fontSize: 32.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  DateFormat('yyyy-MM-dd').format(DateTime.parse(
                                              controller.selectedUser.deadline
                                                  .toString())) ==
                                          DateFormat('yyyy-MM-dd')
                                              .format(DateTime.now())
                                      ? 'Today at ' +
                                          DateFormat('HH:mm').format(
                                              DateTime.parse(controller
                                                  .selectedUser.deadline
                                                  .toString()))
                                      : DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(
                                              controller.selectedUser.deadline.toString())),
                                  style: TextStyle(
                                    color: AppColor.gray,
                                    fontFamily: AppFont.fontFamily,
                                    fontSize: AppFont.veryLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),

                      /// Header List
                      Text(
                        'transaction'.tr,
                        style: TextStyle(
                          color: context.theme.textTheme.headline1!.color,
                          fontFamily: AppFont.fontFamily,
                          fontSize: AppFont.large,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      GetX<LoanDetailsController>(builder: (controller) {
                        return Expanded(
                          child: AppApiStates(
                            apiState: controller.loanApiState,
                            list: controller.list,
                            loading: Container(
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: context.theme.primaryColor,
                                ),
                              ),
                            ),
                            error: AppError(
                              onClick: () {
                                _controller.getUserLoan();
                              },
                            ),
                            success: ListView.builder(
                              controller: _controller.scrollController,
                              itemBuilder: (context, index) {
                                if (index != controller.list.length - 1) {
                                  print(DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(controller
                                              .list[index].createdAt
                                              .toString())) +
                                      ' ------> ' +
                                      DateFormat('yyyy-MM-dd').format(
                                          DateTime.parse(controller
                                              .list[index + 1].createdAt
                                              .toString())));
                                  if (DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(controller
                                                  .list[index].createdAt
                                                  .toString())) ==
                                          DateFormat('yyyy-MM-dd').format(
                                              DateTime.parse(controller
                                                  .list[index + 1].createdAt
                                                  .toString())) &&
                                      index != 0) {
                                    print(SharedPreferencesController()
                                        .currentUser
                                        .phoneNumber);
                                    print(controller.list[index].payerPhone);
                                    return AppTransaction(
                                      who: controller.list[index].payerPhone ==
                                              SharedPreferencesController()
                                                  .currentUser
                                                  .phoneNumber
                                          ? 'dr'
                                          : 'cr',
                                      amount: controller.list[index].amount
                                          .toString(),
                                      date: DateFormat('HH:mm').format(
                                          DateTime.parse(controller
                                              .list[index].createdAt
                                              .toString())),
                                    );
                                  } else {
                                    return Column(
                                      children: [
                                        Container(
                                          child: Text(
                                            DateFormat('yyyy-MM-dd').format(
                                                DateTime.parse(controller
                                                    .list[index].createdAt
                                                    .toString())),
                                            style: TextStyle(
                                                color: context
                                                    .theme.iconTheme.color,
                                                fontFamily: AppFont.fontFamily,
                                                fontSize: AppFont.small),
                                          ),
                                          decoration: BoxDecoration(
                                              color: context.theme.textTheme
                                                  .headline3!.color,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                          padding: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 2)
                                              .r,
                                        ),
                                        AppTransaction(
                                          who: controller
                                                      .list[index].payerPhone ==
                                                  controller.phoneNumber
                                              ? 'dr'
                                              : 'cr',
                                          amount: controller.list[index].amount
                                              .toString(),
                                          date: DateFormat('HH:mm').format(
                                              DateTime.parse(controller
                                                  .list[index].createdAt
                                                  .toString())),
                                        ),
                                      ],
                                    );
                                  }
                                } else {
                                  print(DateFormat('yyyy-MM-dd').format(
                                      DateTime.parse(controller
                                          .list[index].createdAt
                                          .toString())));
                                  return Column(
                                    children: [
                                      AppTransaction(
                                        who:
                                            controller.list[index].payerPhone ==
                                                    controller.phoneNumber
                                                ? 'cr'
                                                : 'dr',
                                        amount: controller.list[index].amount
                                            .toString(),
                                        date: DateFormat('HH:mm').format(
                                            DateTime.parse(controller
                                                .list[index].createdAt
                                                .toString())),
                                      ),
                                    ],
                                  );
                                }
                              },
                              itemCount: controller.list.length,
                            ),
                            empty: Container(
                              child: Center(
                                child: Text(
                                  'Empty',
                                  style: TextStyle(
                                    color: context
                                        .theme.textTheme.headline1!.color,
                                    fontFamily: AppFont.fontFamily,
                                    fontSize: AppFont.medium,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                      Obx(() => _controller.pagenationApiState.isLoading.value
                          ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircularProgressIndicator(
                                  color: context.theme.primaryColor,
                                ),
                              SizedBox(width: 15.w,),
                              Text('Loading...', style: TextStyle(color: context.theme.textTheme.headline1!.color, fontFamily: AppFont.fontFamily, fontSize: AppFont.medium),)
                            ],
                          )
                          : SizedBox()),
                      SizedBox(height: 20.h),
                      AppButton(
                        onClick: () {
                          Get.toNamed(Routes.addLoanScreen,
                              arguments: ['pay', _controller.phoneNumber]);
                        },
                        title: 'pay',
                        color: context.theme.primaryColor,
                      ),
                      SizedBox(height: 15.h),
                    ],
                  ),
                ),
              )
            : Scaffold(
                body: AppError(
                  onClick: () {
                    _controller.getUserDetails();
                  },
                ),
              ));
  }
}
