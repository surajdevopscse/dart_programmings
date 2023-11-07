import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/images.dart';
import 'custom_expansion_panel.dart';
import 'nav_tile.dart';
import 'side_menu_controller.dart';
import '../enum/side_menu_enum.dart';

class SideMenuView extends GetView<SideMenuController> {
  const SideMenuView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuController>(builder: (_) {
      return Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
            border: Border(right: BorderSide(color: C.bluishGray50))),
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
                color: C.bluishGray50,
              ),
              CustomExpansionPanelList.radio(
                // animationDuration: const Duration(milliseconds: 600),
                dividerColor: Colors.white,
                headerMargin: const EdgeInsets.all(8),
                expandedHeaderMargin: const EdgeInsets.all(8),
                materialGapSize: 0,
                children: SideNavBarParentEnum.values.map(
                  (parent) {
                    final i = SideNavBarParentEnum.values.indexOf(parent);

                    return CustomExpansionPanelRadio(
                      canTapOnHeader: true,
                      value: SideNavBarParentEnum.values[i],
                      headerBuilder: (context, isExpanded) {
                        isExpanded = false;
                        bool isSelected = controller.selectedParent == parent;

                        return NavParentTile(
                            isExpended:
                                SideNavBarParentEnum.values[i].children.isEmpty
                                    ? false
                                    : isExpanded,
                            title: parent.title,
                            image: (isSelected || isExpanded)
                                ? parent.image.$1
                                : parent.image.$2,
                            isSelected: (isSelected || isExpanded));
                      },
                      body: Column(
                        children: parent.children.map((child) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: NavTileChild(
                                onTap: () {
                                  controller.navigate(
                                      parent: parent, child: child);
                                },
                                isSelected: controller.selectedChild == child,
                                title: child.title),
                          );
                        }).toList(),
                      ),
                    );
                  },
                ).toList(),
                expansionCallback: (panelIndex, isExpanded) {
                  final parent = SideNavBarParentEnum.values
                      .firstWhere((element) => element.index == panelIndex);

                  controller.navigate(parent: parent);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
