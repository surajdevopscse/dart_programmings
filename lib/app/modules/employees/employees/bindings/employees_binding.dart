import 'package:get/get.dart';

import '../controllers/employees_controller.dart';

class EmployeesBinding extends Bindings {
  EmployeesBinding({this.shouldShowAddEmployeeDialog = false});

  final bool shouldShowAddEmployeeDialog;

  @override
  void dependencies() {
    Get.lazyPut<EmployeesController>(
      () => EmployeesController(),
    );
  }
}
