import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_route.dart';
import '../widget/app_out_boarding.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  late List<AppOutBoarding> pages;
  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    pages = [
      AppOutBoarding(
        image: 'images/img_out_boarding_1.svg',
        title: 'outBoardingTitle1'.tr,
        subTitle: 'outBoardingSubTitle1'.tr,
      ),
      AppOutBoarding(
        image: 'images/img_out_boarding_2.svg',
        title: 'outBoardingTitle2'.tr,
        subTitle: 'outBoardingSubTitle2'.tr,
      ),
      AppOutBoarding(
        image: 'images/img_out_boarding_3.svg',
        title: 'outBoardingTitle3'.tr,
        subTitle: 'outBoardingSubTitle3'.tr,
      ),
    ];
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }

  void onPageChange(int index){
    pageIndex = index;
    update(['outBoardingUpdate']);
  }

  void onNextPageClick(int index){
    pageController.nextPage(duration: Duration(milliseconds: 500,), curve: Curves.easeInOut);
  }

  void onSkipClick(){
    Get.toNamed(Routes.signInScreen);
  }

  void onGetStartClick(){
    Get.toNamed(Routes.signInScreen);
  }
}
