import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyAppBar extends GetView<AppBarController>
    implements PreferredSizeWidget {
  const MyAppBar({super.key});
  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AppBarController>(builder: (_) {
      return AppBar(
        backgroundColor: C.primary50,
        title: Text(
          controller.appBarTitle,
        ),
      );
    });
  }
}
