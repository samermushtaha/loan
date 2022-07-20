import 'package:get_storage/get_storage.dart';

class AppLocalStorage{
  final storage = GetStorage();

  String get appLanguage => storage.read('appLanguage');


}