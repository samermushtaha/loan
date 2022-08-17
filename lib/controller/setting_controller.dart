import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_local_storage.dart';
import '../model/radio_item.dart';

class SettingController extends GetxController {
  List<RadioItem> themeList = [
    RadioItem(title: 'system_default', value: ''),
    RadioItem(title: 'light', value: 'light'),
    RadioItem(title: 'dark', value: 'dark'),
  ];

  List<RadioItem> languageList = [
    RadioItem(title: 'arabic', value: 'ar'),
    RadioItem(title: 'english', value: 'en'),
  ];

  String selectedTheme = SharedPreferencesController().theme!;
  String selectedLanguage = SharedPreferencesController().language;
}
