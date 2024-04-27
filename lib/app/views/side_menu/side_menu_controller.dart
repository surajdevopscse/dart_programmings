import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../enum/side_menu_enum.dart';

class SideMenuController extends GetxController {
  SideNavBarParentEnum selectedParent = SideNavBarParentEnum.home;
  SideNavBarChildEnum? selectedChild;
  bool isExpande = true;

  void navigate(
      {required SideNavBarParentEnum parent, SideNavBarChildEnum? child}) {
    final currentRoute = Get.currentRoute;

    if (parent.children.isEmpty) {
      if (currentRoute != parent.parentPath) {
        AppPages.router.go(parent.parentPath);
        selectedParent = parent;
        update();
      }

      return;
    } else {
      if (child != null && selectedChild!.childPath != currentRoute) {
        selectedChild = child;
        selectedParent = parent;
        if (selectedChild!.childPath == parent.parentPath) {
          AppPages.router.go(selectedParent.parentPath);
        } else {
          AppPages.router
              .go('${selectedParent.parentPath}/${selectedChild!.childPath!}');
        }

        update();
        return;
      } else {
        // on Parent Tab

        if (currentRoute != parent.parentPath) {
          AppPages.router.go(parent.parentPath);
          selectedChild = parent.children[0];
          selectedParent = parent;
          update();
        }
      }
    }
  }

  void selectPage({
    required SideNavBarParentEnum parent,
    SideNavBarChildEnum? child,
  }) {
    selectedParent = parent;
    selectedChild = child;

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      update();
    });
  }
}
