import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_color.dart';
import 'package:loan_app/app_setting/app_font.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/controller/connection_controller.dart';
import 'package:loan_app/controller/main_controller.dart';
import 'package:loan_app/widget/app_icon_button.dart';
import 'package:loan_app/widget/app_navigation_bar_item.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  MainController _controller = Get.find();
  ConnectionManagerController _managerController = Get.put(ConnectionManagerController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return _managerController.connectionType != ConnectionType.none ?
         GetBuilder<MainController>(
            builder: (controller) {
              return Scaffold(
                backgroundColor: context.theme.backgroundColor,
                body: Stack(
                  children: [
                    _controller.pages[controller.bottomNavIndex],
                    controller.addClicked ? GestureDetector(
                      onTap: (){controller.addClicked = false;},
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        width: 1.sw,
                        height: 1.sh,
                      ),
                    ) : SizedBox(),
                    controller.addClicked ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50).r,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            AppIconButton(
                              onClick: (){
                                WidgetsBinding.instance.addPostFrameCallback((_){
                                  controller.addClicked = false;
                                  controller.update();
                                  Get.toNamed(Routes.addLoanScreen, arguments: ['cr']);
                                });
                              },
                              icon: Icon(
                                Icons.arrow_upward_rounded,
                                color: AppColor.green,
                              ),
                            ),
                            AppIconButton(
                              onClick: (){
                                WidgetsBinding.instance.addPostFrameCallback((_){
                                  controller.addClicked = false;
                                  controller.update();
                                  Get.toNamed(Routes.addLoanScreen, arguments: ['dr']);
                                });
                              },
                              icon: Icon(
                                Icons.arrow_downward_rounded,
                                color: AppColor.red,
                              ),
                            )
                          ],
                        ),
                      ),
                    ) : SizedBox()
                  ],
                ),
                floatingActionButton: FloatingActionButton(
                  onPressed: () {
                    _controller.onAddClick();
                  },
                  child:  controller.addClicked ? Icon(Icons.close, color: context.theme.textTheme.headline2!.color,) : Icon(Icons.add, color: context.theme.textTheme.headline2!.color,),
                  backgroundColor: context.theme.primaryColor,
                ),
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                bottomNavigationBar: Stack(
                  children: [
                    AnimatedBottomNavigationBar.builder(
                      backgroundColor: context.theme.backgroundColor,
                      itemCount: _controller.navigationBarList.length,
                      tabBuilder: (int index, bool isActive) {
                        final color = isActive ? context.theme.primaryColor : context.theme.textTheme.subtitle1!.color;
                        return AppNavigationBarItem(
                          controller: controller,
                          index: index,
                          color: color!,
                        );
                      },
                      onTap: (index) {
                        _controller.onPageChange(index);
                      },
                      height: 60.h,
                      activeIndex: controller.bottomNavIndex,
                      gapLocation: GapLocation.center,
                      shadow: BoxShadow(
                        color: context.theme.textTheme.subtitle1!.color!,
                        blurRadius: 5,
                      ),
                    ),
                    controller.addClicked ? Container(
                      width: double.infinity,
                      height: 60,
                      color: Colors.black.withOpacity(0.5),
                    ) : SizedBox(),
                  ],
                ),
              );
            }) : Scaffold(body: Center(child: Container(child: Center(child: Column(mainAxisSize: MainAxisSize.min, children: [Icon(Icons.wifi, size: 100.r,), Text('No Internet Connection', style: TextStyle(color: context.theme.textTheme.headline1!.color, fontFamily: AppFont.fontFamily, fontSize: AppFont.medium),),],),),),),);
      }
    );
  }
}
