import 'package:dart_programing/modules/introduction/controllers/install_dart_controller.dart';
import 'package:get/get.dart';

class InstallDartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InstallDartController>(
      () => InstallDartController(),
    );
  }
}
