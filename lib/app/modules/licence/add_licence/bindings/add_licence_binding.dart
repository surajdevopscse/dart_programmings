import 'package:get/get.dart';

import '../controllers/add_licence_controller.dart';

class AddLicenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLicenceController>(
      () => AddLicenceController(),
    );
  }
}
