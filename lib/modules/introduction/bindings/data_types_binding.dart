import 'package:dart_programing/modules/introduction/controllers/data_types_controller.dart';
import 'package:get/get.dart';

class DataTypesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataTypesController>(
      () => DataTypesController(),
    );
  }
}
