import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../app_setting/app_font.dart';

class AppEmpty extends StatelessWidget {
  const AppEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Empty',
          style: TextStyle(
            color: context.theme.textTheme.headline1!.color,
            fontFamily: AppFont.fontFamily,
            fontSize: AppFont.medium,
          ),
        ),
      ),
    );
  }
}
