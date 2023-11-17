import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AppLightTheme {
  static final ThemeData data = ThemeData.light();
}

ThemeData get theme => Theme.of(Get.context!);
