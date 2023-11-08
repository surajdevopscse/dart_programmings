import 'package:get/get.dart';

import '../controllers/employee_profile_controller.dart';

class EmployeeProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeProfileController>(
      () => EmployeeProfileController(),
    );
  }
}
