import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/widget/app_error.dart';
import 'package:loan_app/widget/app_loading.dart';
import 'package:loan_app/widget/app_profile_item.dart';

import '../api/api_setting.dart';
import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../controller/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);

  ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          backgroundColor: context.theme.primaryColor,
          appBar: AppBar(
            title: Text(
              'profile'.tr,
              style: TextStyle(
                  color: context.theme.textTheme.headline2!.color,
                  fontFamily: AppFont.fontFamily,
                  fontSize: AppFont.veryLarge),
            ),
            toolbarHeight: 60.h,
            elevation: 0,
            backgroundColor: Colors.transparent,
            centerTitle: true,
            automaticallyImplyLeading: false,
          ),
          body: RefreshIndicator(
            onRefresh: (){return _controller.onRefreshing();},
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20).r,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(50),
                  topLeft: Radius.circular(50),
                ).r,
                color: context.theme.backgroundColor,
              ),
              child: Obx(
                () {
                  return _controller.apiState.isLoading.value ? AppLoading() : _controller.apiState.isError.value ? AppError(onClick: (){}) :
                  Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 0.3.sh,
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              CircleAvatar(
                                backgroundImage: SharedPreferencesController().currentUser.image != null ? NetworkImage(ApiSetting.BASE_URL + '/' + SharedPreferencesController().currentUser.image!) : AssetImage('images/img_person.png') as ImageProvider,
                                radius: 50.r,
                                backgroundColor: context.theme.backgroundColor,
                              ),
                              SizedBox(height: 5),
                              Text(
                                SharedPreferencesController().currentUser.firstName + ' ' + SharedPreferencesController().currentUser.lastName,
                                style: TextStyle(
                                  color: context.theme.textTheme.headline1!.color,
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
                            color: context.theme.backgroundColor,
                          );
                        },
                        itemCount: _controller.list.length,
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
        Obx(
          () {
            return ProfileController.logoutApiState.isLoading.value ? Container(color: Colors.black.withOpacity(0.5), width: 1.sw, height: 1.sh, child: Center(child: Container(padding: EdgeInsets.all(10).r, decoration: BoxDecoration(color: context.theme.backgroundColor, borderRadius: BorderRadius.circular(10)), child: CircularProgressIndicator(color: context.theme.primaryColor,)),),) : SizedBox();
          }
        )
      ],
    );
  }
}
