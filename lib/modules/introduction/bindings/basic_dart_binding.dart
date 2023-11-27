import 'package:dart_programing/modules/introduction/controllers/basic_dart_controller.dart';
import 'package:get/get.dart';

class BasicDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BasicDartController>(
      () => BasicDartController(),
    );
  }
}
