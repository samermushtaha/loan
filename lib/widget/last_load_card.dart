import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/utils.dart';

import '../app_setting/app_color.dart';
import 'last_amount.dart';

class LastLoanCard extends StatelessWidget {
  const LastLoanCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30).r,
      decoration: BoxDecoration(
          color: context.theme.backgroundColor,
          borderRadius: BorderRadius.circular(20).r,
          border: Border.all(color: AppColor.white),
          boxShadow: [
            BoxShadow(
              color: context.theme.textTheme.subtitle1!.color!,
              spreadRadius: 2,
              blurRadius: 10,
            ),
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          LastAmount(
            who: 'dr',
            amount: '1200',
            date: '12.Nov',
          ),
          LastAmount(
            who: 'cr',
            amount: '1200',
            date: '12.Nov',
          ),
        ],
      ),
    );
  }
}
