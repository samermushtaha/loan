import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:intl/intl.dart';
import 'package:loan_app/app_setting/app_font.dart';

import '../app_setting/app_color.dart';
import '../controller/home_controller.dart';
import 'last_amount.dart';

class LastLoanCard extends StatelessWidget {
  late HomeController controller;

  LastLoanCard({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 1.sw,
        height: 0.17.sh,
        padding: EdgeInsets.all(30).r,
        decoration: BoxDecoration(
            color: context.theme.backgroundColor,
            borderRadius: BorderRadius.circular(20).r,
            boxShadow: [
              BoxShadow(
                color: context.theme.textTheme.subtitle1!.color!,
                spreadRadius: 2,
                blurRadius: 10,
              ),
            ]),
        child: Obx(() {
          return controller.loanApiState.isLoading.value
              ? Center(
                child: Text(
                    'Calculating...',
                    style: TextStyle(
                        color: context.theme.textTheme.headline1!.color,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.large),
                  ),
              ) : controller.loanApiState.isError.value ? Center(child: Text('Error', style: TextStyle(
              color: context.theme.textTheme.headline1!.color,
              fontFamily: AppFont.fontFamily,
              fontSize: AppFont.large),))
              : GetBuilder<HomeController>(builder: (controller) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      LastAmount(
                        who: 'dr',
                        amount: controller.nearLoan.nearDebitor != null
                            ? controller.nearLoan.nearDebitor!.amountDebt
                                .toString()
                            : '0',
                        date: '',
                        // date: DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.nearLoan.deadlineDebitor.toString())),
                      ),
                      LastAmount(
                        who: 'cr',
                        amount: controller.nearLoan.nearCreditor != null
                            ? controller.nearLoan.nearCreditor!.amountDebt
                                .toString()
                            : '0',
                        date: '',
                        // date: DateFormat('dd/MM/yyyy').format(DateTime.parse(controller.nearLoan.deadlineCreditor.toString())),
                      ),
                    ],
                  );
                });
        }));
  }
}
