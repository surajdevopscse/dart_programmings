import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/services/ads/ad_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../enum/side_menu_enum.dart';

class SideMenuController extends GetxController {
  SideNavBarParentEnum selectedParent = SideNavBarParentEnum.home;
  SideNavBarChildEnum? selectedChild;
  bool isExpande = true;

  // Counts completed navigations; every 5th navigation triggers an interstitial.
  int _navCount = 0;

  void navigate(
      {required SideNavBarParentEnum parent, SideNavBarChildEnum? child}) {
    final currentRoute = Get.currentRoute;

    if (parent.children.isEmpty) {
      if (currentRoute != parent.parentPath) {
        AppPages.router.go(parent.parentPath);
        selectedParent = parent;
        _onNavigated();
        update();
      }

      return;
    } else {
      if (child != null && selectedChild?.childPath != currentRoute) {
        selectedChild = child;
        selectedParent = parent;
        if (selectedChild!.childPath == parent.parentPath) {
          AppPages.router.go(selectedParent.parentPath);
        } else {
          final childPath = selectedChild!.childPath!;
          AppPages.router.go(
            childPath.startsWith('/')
                ? childPath
                : '${selectedParent.parentPath}/$childPath',
          );
        }

        _onNavigated();
        update();
        return;
      } else {
        // on Parent Tab
        if (currentRoute != parent.parentPath) {
          AppPages.router.go(parent.parentPath);
          selectedChild = parent.children[0];
          selectedParent = parent;
          _onNavigated();
          update();
        }
      }
    }
  }

  /// Increments the navigation counter and shows an interstitial every 5 navigations.
  /// The AdService stub on web/desktop makes showInterstitialAd() a safe no-op.
  void _onNavigated() {
    _navCount++;
    if (_navCount % 5 == 0) {
      Get.find<AdService>().showInterstitialAd();
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
