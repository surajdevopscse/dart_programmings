import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';

class CustomNavigatorObserver extends NavigatorObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    // print('Did Push');

    updateSideMenu();
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    // print('Did Pop');

    updateSideMenu();
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    super.didRemove(route, previousRoute);
    // print('Did Remove');

    updateSideMenu();
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    // print('Did Replace');
    updateSideMenu();
  }

  void updateSideMenu({bool withDelay = true}) async {
    if (withDelay) {
      await Future.delayed(const Duration(milliseconds: 300));
    }
    final sideMenuController = Get.find<SideMenuController>();
    final newParentVal = sideMenuController.getParentNavEnumByURL();
    // print("New Parent Value");
    // print(newParentVal);

    // print("Current Parent Value");
    // print(sideMenuController.selectedParent);

    if (newParentVal != sideMenuController.selectedParent) {
      sideMenuController.selectedParent = newParentVal;
      sideMenuController.update();
    }
  }
}
