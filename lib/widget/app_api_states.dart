import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../app_setting/app_font.dart';
import '../model/api_state.dart';

class AppApiStates extends StatelessWidget {
  late ApiState apiState;
  late Widget loading;
  late Widget success;
  late Widget empty;
  late Widget error;
  late List list;

  AppApiStates({
    required this.apiState,
    required this.loading,
    required this.success,
    required this.empty,
    required this.error,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() => apiState.isLoading.value ? loading : apiState.isError.value ? error : list.isNotEmpty ? success : empty);
  }
}
