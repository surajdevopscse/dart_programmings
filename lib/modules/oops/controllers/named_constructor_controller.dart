import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NamedConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'NAMED CONSTRUCTOR IN DART';
  final String intro = 'Named constructors allow you to define multiple constructors for a class, each with a different name. They provide alternative ways to create objects with different initialization logic.';
  final String exampleTitle = 'Named Constructor Example';
  final String exampleCode = '''class Color {
  int red, green, blue;

  Color(this.red, this.green, this.blue);

  Color.red() : red = 255, green = 0, blue = 0;
  Color.green() : red = 0, green = 255, blue = 0;
  Color.blue() : red = 0, green = 0, blue = 255;
  Color.fromHex(int hex)
      : red = (hex >> 16) & 0xFF,
        green = (hex >> 8) & 0xFF,
        blue = hex & 0xFF;

  @override
  String toString() => 'Color(R:\$red, G:\$green, B:\$blue)';
}

void main() {
  print(Color.red());
  print(Color.green());
  print(Color.blue());
  print(Color.fromHex(0xFF8C00));
}''';
  final String exampleOutput = '''Color(R:255, G:0, B:0)
Color(R:0, G:255, B:0)
Color(R:0, G:0, B:255)
Color(R:255, G:140, B:0)''';
  final List<String> tips = [
    'Named constructors use the ClassName.name() syntax.',
    'They are great for providing factory-like creation patterns.',
    'Named constructors are especially useful when creating objects from different formats.',
    'Use them to improve code readability at object creation sites.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.namedConstructor);
    Get.find<AppBarController>().appBarTitle = SK.namedConstructor;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
