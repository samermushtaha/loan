import 'package:flutter/cupertino.dart';

class ProfileItem{
  late String title;
  late IconData icon;
  late Function() onClick;

  ProfileItem({required this.icon, required this.title, required this.onClick});
}