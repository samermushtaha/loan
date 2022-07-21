import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/out_boarding_controller.dart';

class OutBoardingScreen extends StatelessWidget {
  OutBoardingScreen({Key? key}) : super(key: key);

  OutBoardingController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index){controller.onPageChange(index);},
        children: controller.pages,
      ),
    );
  }
}
