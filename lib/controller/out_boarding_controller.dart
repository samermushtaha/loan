import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OutBoardingController extends GetxController{
  late PageController pageController;
  @override
  void onInit() {
    super.onInit();
    pageController = PageController();
  }

  @override
  void onClose() {
    super.onClose();
    pageController.dispose();
  }
}