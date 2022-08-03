import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/widget/app_button.dart';

import '../app_setting/app_color.dart';
import '../app_setting/app_font.dart';
import '../widget/app_transaction.dart';

class LoanDetailsScreen extends StatelessWidget {
  const LoanDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blue,
      appBar: AppBar(
        title: ListTile(
          onTap: (){Get.toNamed(Routes.userInfoScreen);},
          leading: CircleAvatar(
            child: Image.asset('images/img_person.png'),
            backgroundColor: AppColor.white,
          ),
          title: Text(
            'Samer Mushtaha',
            style: TextStyle(
              color: AppColor.textColor,
              fontSize: AppFont.medium,
              fontFamily: AppFont.fontFamily,
            ),
          ),
          subtitle: Text(
            '+970592121665',
            style: TextStyle(
              color: AppColor.gray,
              fontSize: AppFont.small,
              fontFamily: AppFont.fontFamily,
            ),
          ),
        ),
        titleSpacing: -10,
        elevation: 0,
        toolbarHeight: 70.h,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: IconButton(onPressed: (){Get.back();}, icon: Icon(Icons.arrow_back, color: AppColor.white,),),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20).r,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(50),
            topLeft: Radius.circular(50),
          ).r,
          color: AppColor.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 0.25.sh,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '2000\$',
                      style: TextStyle(
                          color: AppColor.green,
                          fontFamily: AppFont.fontFamily,
                          fontSize: 32.sp,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '13.Nov 2022',
                      style: TextStyle(
                        color: AppColor.gray,
                        fontFamily: AppFont.fontFamily,
                        fontSize: AppFont.veryLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Header List
            Text(
              'transaction'.tr,
              style: TextStyle(
                color: AppColor.black,
                fontFamily: AppFont.fontFamily,
                fontSize: AppFont.large,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return AppTransaction(
                    who: 'cr',
                    amount: '100',
                    date: '12/13/2022',
                  );
                },
                itemCount: 6,
              ),
            ),
            SizedBox(height: 20.h),
            AppButton(
              onClick: () {Get.toNamed(Routes.addLoanScreen);},
              title: 'pay',
              color: AppColor.blue,
            ),
            SizedBox(height: 15.h),
          ],
        ),
      ),
    );
  }
}
