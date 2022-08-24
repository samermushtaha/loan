import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/all_user_controller.dart';
import 'package:loan_app/model/response/all_user_response.dart';
import 'package:loan_app/widget/app_api_states.dart';
import 'package:loan_app/widget/app_error.dart';
import 'package:loan_app/widget/app_text_filed.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../app_setting/app_route.dart';
import '../widget/app_user_card.dart';

class AllUserScreen extends StatelessWidget {
  AllUserScreen({Key? key}) : super(key: key);

  AllUserController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.primaryColor,
      appBar: AppBar(
        title: Text(
          'all_users'.tr,
          style: TextStyle(
              color: context.theme.textTheme.headline2!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.veryLarge),
        ),
        elevation: 0,
        toolbarHeight: 60.h,
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
        actions: [
          IconButton(
              onPressed: () {filterBottomSheet(context);},
              icon: Icon(
                Icons.filter_list,
                color: context.theme.textTheme.headline2!.color,
              )),
        ],
      ),
      body: Container(
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
            AppTextFiled(
              controller: _controller.search,
              title: '',
              hint: 'search',
              icon: Icons.search,
              onChange: (value){
                if(value.isNotEmpty){
                  if(value.length % 3 == 0){
                    _controller.searchUser();
                  }
                }else{
                  _controller.getAllUser();
                }
              },
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Required';
                }
              },
            ),
            GetX<AllUserController>(builder: (controller) {
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
                    controller: _controller.scrollController,
                    itemBuilder: (context, index) {
                      return AppUserCard(
                        UserCard(
                          phoneNumber: controller.allUsers[index].firstName == null ? '' : controller.allUsers[index].phoneNumber,
                          image: controller.allUsers[index].image,
                          firstName: controller.allUsers[index].firstName == null ? controller.allUsers[index].phoneNumber : controller.allUsers[index].firstName,
                          lastName: controller.allUsers[index].lastName == null ? '' : controller.allUsers[index].lastName,
                        ),
                              (){Get.toNamed(Routes.loanDetailsScreen, arguments: [controller.allUsers[index].phoneNumber]);}
                      );
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
                  error: AppError(onClick: (){_controller.getAllUser();},)
                ),
              );
            })
          ],
        ),
      ),
    );
  }

  Future<void> filterBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: context.theme.backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25).r,
          topLeft: Radius.circular(25).r,
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<AllUserController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20).r,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.filterList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    activeColor: context.theme.primaryColor,
                    title: Text(
                      controller.filterList[index].title.tr,
                      style: TextStyle(
                        color: controller.selectedType ==
                            controller.filterList[index].value
                            ? context.theme.primaryColor
                            : context.theme.textTheme.headline1!.color,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.large,
                      ),
                    ),
                    value: controller.filterList[index].value,
                    groupValue: controller.selectedType,
                    onChanged: (value) {
                      controller.selectedType = value!;
                      controller.update();
                      _controller.getAllUser();
                      Get.back();
                    },
                  );
                }),
          );
        });
      },
    );
  }
}
