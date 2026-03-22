import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetterController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'SETTER IN DART';
  final String intro = 'A setter is a special method that writes to a property with validation. Use the set keyword. Setters allow you to validate or transform values before assigning them to fields.';
  final String exampleTitle = 'Setter Example';
  final String exampleCode = '''class Temperature {
  double _celsius;

  Temperature(this._celsius);

  double get celsius => _celsius;

  set celsius(double value) {
    if (value < -273.15) {
      print('Temperature cannot be below absolute zero!');
    } else {
      _celsius = value;
    }
  }

  double get fahrenheit => (_celsius * 9 / 5) + 32;

  set fahrenheit(double value) {
    _celsius = (value - 32) * 5 / 9;
  }
}

void main() {
  Temperature t = Temperature(25);
  print('Celsius: \${t.celsius}');
  print('Fahrenheit: \${t.fahrenheit}');

  t.fahrenheit = 98.6;
  print('After set (98.6F): \${t.celsius.toStringAsFixed(1)}C');

  t.celsius = -300; // Invalid
}''';
  final String exampleOutput = '''Celsius: 25.0
Fahrenheit: 77.0
After set (98.6F): 37.0C
Temperature cannot be below absolute zero!''';
  final List<String> tips = [
    'Setters use the set keyword and take exactly one parameter.',
    'Use setters to validate input before modifying private fields.',
    'Setters look like property assignments to the caller.',
    'Combine getters and setters for complete property control.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.setter);
    Get.find<AppBarController>().appBarTitle = SK.setter;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
