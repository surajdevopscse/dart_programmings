import 'package:get/get.dart';

import '../controllers/control_flow_controller.dart';

class ControlFlowBinding extends Bindings {
  ControlFlowBinding({this.shouldShowAddEmployeeDialog = false});

  final bool shouldShowAddEmployeeDialog;

  @override
  void dependencies() {
    Get.lazyPut<ControlFlowController>(
      () => ControlFlowController(),
    );
  }
}
