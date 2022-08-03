import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:loan_app/controller/main_controller.dart';
import '../app_setting/app_font.dart';

class AppNavigationBarItem extends StatelessWidget {
  late int index;
  late MainController controller;
  late Color color;

  AppNavigationBarItem({required this.controller, required this.index, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          controller.navigationBarList[index].icon,
          size: 24,
          color: color,
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            controller.navigationBarList[index].title.tr,
            maxLines: 1,
            style: TextStyle(
              color: color,
              fontFamily: AppFont.fontFamily,
            ),
          ),
        )
      ],
    );
  }
}
