import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';

class LastAmount extends StatelessWidget {
  late String amount;
  late String date;
  late String who;
  late Color color;

  LastAmount({required this.amount, required this.date, required this.who});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          who.tr,
          style: TextStyle(
            color: who == 'dr' ? AppColor.red : AppColor.green,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.large,
          ),
        ),
        Text(
          amount + '\$',
          style: TextStyle(
            color: who == 'dr' ? AppColor.red : AppColor.green,
            fontFamily: AppFont.fontFamily,
            fontSize: 28,
            fontWeight: FontWeight.bold
          ),
        ),
        // Text(
        //   date,
        //   style: TextStyle(
        //     color: context.theme.textTheme.subtitle1!.color,
        //     fontFamily: AppFont.fontFamily,
        //     fontSize: AppFont.medium,
        //   ),
        // ),
      ],
    );
  }
}
