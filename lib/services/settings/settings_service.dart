import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SettingsService extends GetxService {
  Future<SettingsService> init() async {
    debugPrint('$runtimeType delays 2 sec');
    await 2.delay();
    debugPrint('$runtimeType ready!');
    return this;
  }
}
