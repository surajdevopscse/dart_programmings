import 'package:dart_programing/modules/introduction/controllers/variables_coontroller.dart';
import 'package:get/get.dart';

class VaribalesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<VaribalesController>(
      () => VaribalesController(),
    );
  }
}
