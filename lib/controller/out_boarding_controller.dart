import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_route.dart';
import '../app_setting/app_local_storage.dart';
import '../widget/app_out_boarding.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  late List<AppOutBoarding> pages;
  late int pageIndex;

  @override
  void onInit() {
    super.onInit();
    SharedPreferencesController().setFirsTime(false);
    pageIndex = 0;
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
    print('closed');
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
