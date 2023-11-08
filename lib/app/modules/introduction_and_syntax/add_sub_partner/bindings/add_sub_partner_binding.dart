import 'package:get/get.dart';

import '../controllers/add_sub_partner_controller.dart';

class AddSubPartnerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddSubPartnerController>(
      () => AddSubPartnerController(),
    );
  }
}
