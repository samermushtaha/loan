import 'package:clipboard/clipboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController{

  List<TextEditingController> list = [];

  @override
  void onInit() {
    for(int i = 0; i < 4; i++){
      list.add(TextEditingController());
    }
    super.onInit();
  }

  @override
  void onClose() {
    for(TextEditingController controller in list){
      controller.dispose();
    }
    super.onClose();
  }

  void pastVerificationCode(){
    FlutterClipboard.paste().then((value) {
      if (value.length == 4) {
        int j = 1;
        for(int i = 0; i < list.length; i++){
          list[i].text = value.substring(i, j);
          j++;
        }
      }
    });
  }

  void onChange(BuildContext context, int index){
    if(list[index].text.length == 1){
      FocusScope.of(context).nextFocus();
    }else{
      FocusScope.of(context).previousFocus();
    }
  }

}