import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loan_app/app_setting/app_route.dart';
import 'package:loan_app/model/navigation_bar_item.dart';

import '../screen/home_screen.dart';
import '../screen/profile_screen.dart';

class MainController extends GetxController{
  late List<NavigationBarItem> navigationBarList;
  late List<Widget> pages;
  int bottomNavIndex = 0;
  bool addClicked = false;

  @override
  void onInit() {
    navigationBarList = [
      NavigationBarItem(icon: Icons.home_outlined, title: 'home'),
      NavigationBarItem(icon: Icons.person_outline, title: 'profile'),
    ];
    pages = [
      HomeScreen(),
      ProfileScreen(),
    ];
    super.onInit();
  }

  void onPageChange(int index){
    bottomNavIndex = index;
    update();
  }

  void onAddClick(){
    addClicked = !addClicked;
    update();
  }
}