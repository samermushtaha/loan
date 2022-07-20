import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../widget/app_out_boarding.dart';

class OutBoardingController extends GetxController {
  late PageController pageController;
  late List<AppOutBoarding> outBoardingList;
  int pageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
    outBoardingList = [
      AppOutBoarding(
        controller: this,
        image: 'images/img_out_boarding_1.png',
        title: 'Get Access To Quick Loans',
        subTitle: 'Easily get access to loans using your phone',
      ),
      AppOutBoarding(
        controller: this,
        image: 'images/img_out_boarding_1.png',
        title: 'Get Access To Quick Loans',
        subTitle: 'Easily get access to loans using your phone',
      ),
      AppOutBoarding(
        controller: this,
        image: 'images/img_out_boarding_1.png',
        title: 'Get Access To Quick Loans',
        subTitle: 'Easily get access to loans using your phone',
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
    if(index == 2){
      // Go to Sign in
    }else{
      pageController.nextPage(duration: Duration(milliseconds: 500,), curve: Curves.easeInOut);
    }
  }

  void onSkipClick(){
    // Go to Sign in
  }
}
