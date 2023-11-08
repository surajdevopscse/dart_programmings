import 'package:get/get.dart';
import '../../modules/control_flow/employees/dialogs/add_employee_dialog.dart';
import '../../modules/licence/licence/dialogs/request_licence_key_dialog.dart';
import '../../modules/licence/licence/dialogs/transfer_licence_key_dialog.dart';
import '../enum/side_menu_enum.dart';

class SideMenuController extends GetxController {
  late SideNavBarParentEnum selectedParent = getParentNavEnumByURL();
  SideNavBarChildEnum? selectedChild;
  late Map<int, bool> expansionList;

  @override
  void onInit() {
    expansionList =
        SideNavBarParentEnum.values.asMap().map((i, v) => MapEntry(i, false));
    super.onInit();
  }

  SideNavBarParentEnum getParentNavEnumByURL() {
    String currentRoute = Uri.base.toString().replaceAll(Uri.base.origin, '');
    if (currentRoute.startsWith('/#/')) {
      currentRoute = currentRoute.replaceRange(0, 2, '');
    } else if (currentRoute.startsWith('#')) {
      currentRoute = currentRoute.replaceRange(0, 1, '');
    }
    return SideNavBarParentEnum.values.firstWhereOrNull((e) {
          return currentRoute.startsWith(e.parentPath);
        }) ??
        SideNavBarParentEnum.home;
  }

  void navigate({
    required SideNavBarParentEnum parent,
    SideNavBarChildEnum? child,
  }) {
    final currentRoute = Get.currentRoute;

    if ((selectedParent == parent) && (selectedChild == child)) {
      return;
    } else {
      selectedParent = parent;
      // when parent have not children
      if (parent.children.isEmpty) {
        if (selectedParent.parentPath != currentRoute) {
          Get.toNamed(selectedParent.parentPath);
          selectedChild = child;
        }

        // update()
        return;
        // when tab on parent
      } else if (child == null) {
        // Don't Navigate on collapse
        if (parent.children.contains(selectedChild)) {
          return;
        }
        selectedChild = parent.children[0];
        // when tab on child
      } else {
        // Open Dialog
        if (child.childPath == null) {
          openDialog(child);
          return;
        }

        selectedChild = child;
      }
      if ((selectedChild!.childPath!) != currentRoute) {
        Get.toNamed(selectedChild!.childPath!);
        update();
      }
    }
  }

  void openDialog(SideNavBarChildEnum childDialog) {
    switch (childDialog) {
      case SideNavBarChildEnum.conditions:
        addEmployeeDialog(Get.context!);
        break;
      case SideNavBarChildEnum.transferLicenseKey:
        transferLicenseKeyDialog(Get.context!);
        break;
      case SideNavBarChildEnum.requestLicenseKey:
        requestLicenseKeyDialog(Get.context!);
        break;
      default:
        break;
    }
  }
}
