import 'package:get/get.dart';

import '../controllers/add_leads_controller.dart';

class AddLeadsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddLeadsController>(
      () => AddLeadsController(),
    );
  }
}
