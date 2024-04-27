import 'package:dart_programing/app/views/side_menu/custom_expansion_panel.dart';
import 'package:dart_programing/app/views/side_menu/nav_tile.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'side_menu_controller.dart';
import '../enum/side_menu_enum.dart';

class SideMenuView extends GetView<SideMenuController> {
  const SideMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SideMenuController>(builder: (_) {
        return SizedBox(
          height: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Image.asset(I.leanrnDartLogo),
                ),
                const Divider(
                  indent: 16,
                  endIndent: 16,
                  color: Colors.grey,
                ),
                CustomExpansionPanelList(
                  dividerColor: Colors.white,
                  headerMargin: const EdgeInsets.all(8),
                  expandedHeaderMargin: const EdgeInsets.all(8),
                  materialGapSize: 0,
                  children: SideNavBarParentEnum.values.map(
                    (parent) {
                      final isSelected = controller.selectedParent == parent;
                      return CustomExpansionPanel(
                        canTapOnHeader: true,
                        isExpanded: (isSelected && controller.isExpande),
                        headerBuilder: (context, isExpanded) {
                          return NavParentTile(
                            title: parent.title,
                            image:
                                isSelected ? parent.image.$1 : parent.image.$2,
                            isSelected: isSelected,
                          );
                        },
                        body: Column(
                          children: parent.children.map((child) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: NavTileChild(
                                onTap: () {
                                  controller.navigate(
                                      parent: parent, child: child);
                                },
                                isSelected: controller.selectedChild == child,
                                title: child.title,
                              ),
                            );
                          }).toList(),
                        ),
                      );
                    },
                  ).toList(),
                  expansionCallback: (panelIndex, isExpanded) {
                    final parent = SideNavBarParentEnum.values
                        .firstWhere((element) => element.index == panelIndex);

                    if (controller.selectedParent != parent) {
                      controller.isExpande = isExpanded;
                      controller.navigate(parent: parent);
                    } else {
                      controller.isExpande = isExpanded;
                      controller.update();
                    }
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
