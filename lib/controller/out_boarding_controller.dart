import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
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
        controller: this,
        image: 'images/img_out_boarding_1.svg',
        title: 'outBoardingTitle1'.tr,
        subTitle: 'outBoardingSubTitle1'.tr,
      ),
      AppOutBoarding(
        controller: this,
        image: 'images/img_out_boarding_2.svg',
        title: 'outBoardingTitle2'.tr,
        subTitle: 'outBoardingSubTitle2'.tr,
      ),
      AppOutBoarding(
        controller: this,
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
    update();
  }

  void onNextPageClick(int index){
    if(index == pages.length - 1){
      // Go to Sign in
    }else{
      pageController.nextPage(duration: Duration(milliseconds: 500,), curve: Curves.easeInOut);
    }
  }

  void onSkipClick(){
    // Go to Sign in
  }

  void onGetStartClick(){
    // Go to Sign in
  }
}
