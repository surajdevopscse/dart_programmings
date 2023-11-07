import 'package:get/get.dart';

import '../controllers/partners_controller.dart';

class PartnersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PartnersController>(
      () => PartnersController(),
    );
  }
}
