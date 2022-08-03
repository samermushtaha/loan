import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import 'package:loan_app/app_setting/theme_controller.dart';
import 'package:loan_app/controller/setting_controller.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../model/radio_item.dart';
import '../widget/app_profile_item.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  SettingController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: Text(
          'setting'.tr,
          style: TextStyle(
              color: AppColor.textColor,
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
            color: AppColor.white,
          ),
        ),
      ),
      body: Container(
        height: 1.sh,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: context.theme.backgroundColor,
        ),
        child: Column(
          children: [
            AppProfileItem(
                icon: Icons.language,
                title: 'setting_item_1',
                onClick: () {
                  languageBottomSheet(context);
                }),
            SizedBox(height: 10.h),
            AppProfileItem(
                icon: Icons.dark_mode,
                title: 'setting_item_2',
                onClick: () {

                }),
          ],
        ),
      ),
    );
  }

  Future<void> themeBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25).r,
          topLeft: Radius.circular(25).r,
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<SettingController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20).r,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.themeList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    activeColor: AppColor.blue,
                    title: Text(
                      controller.themeList[index].title.tr,
                      style: TextStyle(
                        color: controller.selectedTheme ==
                                controller.themeList[index].value
                            ? AppColor.blue
                            : AppColor.black,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.large,
                      ),
                    ),
                    value: controller.themeList[index].value,
                    groupValue: controller.selectedTheme,
                    onChanged: (value) {
                      if(value == 'dark'){
                        ThemeController.to.setThemeMode(ThemeMode.dark);
                      }else if(value == 'light'){
                        ThemeController.to.setThemeMode(ThemeMode.light);
                      }else{
                        SharedPreferencesController().sharedPreferences.remove('appTheme');
                      }
                    },
                  );
                }),
          );
        });
      },
    );
  }

  Future<void> languageBottomSheet(BuildContext context) {
    return showModalBottomSheet<void>(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25).r,
          topLeft: Radius.circular(25).r,
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return GetBuilder<SettingController>(builder: (controller) {
          return Padding(
            padding: const EdgeInsets.all(20).r,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemCount: controller.languageList.length,
                itemBuilder: (context, index) {
                  return RadioListTile<String>(
                    activeColor: AppColor.blue,
                    title: Text(
                      controller.languageList[index].title.tr,
                      style: TextStyle(
                        color: controller.selectedLanguage ==
                                controller.languageList[index].value
                            ? AppColor.blue
                            : AppColor.black,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.large,
                      ),
                    ),
                    value: controller.languageList[index].value,
                    groupValue: controller.selectedLanguage,
                    onChanged: (value) {
                      SharedPreferencesController().setLanguage(value.toString());
                      Get.updateLocale(Locale(value.toString()));
                      controller.selectedLanguage = value.toString();
                      controller.update();
                    },
                  );
                }),
          );
        });
      },
    );
  }
}
