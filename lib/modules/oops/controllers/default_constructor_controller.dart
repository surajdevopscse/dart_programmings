import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'DEFAULT CONSTRUCTOR IN DART';
  final String intro = 'A default constructor has no parameters. Dart automatically provides one if you do not define any constructor. You can also explicitly define it to perform initialization.';
  final String exampleTitle = 'Default Constructor Example';
  final String exampleCode = '''class Rectangle {
  double width;
  double height;

  // Default constructor with initialization
  Rectangle() : width = 1.0, height = 1.0 {
    print('Rectangle created with default size 1x1');
  }

  double get area => width * height;
  double get perimeter => 2 * (width + height);
}

void main() {
  Rectangle r = Rectangle();
  print('Area: \${r.area}');
  print('Perimeter: \${r.perimeter}');
}''';
  final String exampleOutput = '''Rectangle created with default size 1x1
Area: 1.0
Perimeter: 4.0''';
  final List<String> tips = [
    'Dart provides a default no-arg constructor if none is defined.',
    'Once you define any constructor, the implicit default constructor is removed.',
    'Use initializer lists to set field values before the constructor body.',
    'Default constructors are useful for creating objects with sensible defaults.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.defaultConstructor);
    Get.find<AppBarController>().appBarTitle = SK.defaultConstructor;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
