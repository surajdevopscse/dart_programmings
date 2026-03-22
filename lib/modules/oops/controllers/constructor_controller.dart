import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CONSTRUCTOR IN DART';
  final String intro = 'A constructor is a special method that is called automatically when an object is created. It is used to initialize the object fields. Dart supports default, parameterized, named, and factory constructors.';
  final String exampleTitle = 'Types of Constructors';
  final String exampleCode = '''class Point {
  double x;
  double y;

  // Default constructor
  Point() : x = 0, y = 0;

  // Parameterized constructor
  Point.withCoords(this.x, this.y);

  // Named constructor
  Point.origin() : x = 0, y = 0;

  double distanceTo(Point other) {
    return ((x - other.x) * (x - other.x) + (y - other.y) * (y - other.y));
  }

  @override
  String toString() => 'Point(\$x, \$y)';
}

void main() {
  Point p1 = Point();
  Point p2 = Point.withCoords(3, 4);
  Point origin = Point.origin();
  print(p1);
  print(p2);
  print('Origin: \$origin');
}''';
  final String exampleOutput = '''Point(0.0, 0.0)
Point(3.0, 4.0)
Origin: Point(0.0, 0.0)''';
  final List<String> tips = [
    'If no constructor is defined, Dart provides a default no-arg constructor.',
    'Use initializer lists (: field = value) before the constructor body.',
    'Named constructors provide alternative ways to create objects.',
    'Use this.field shorthand for assigning parameters to fields.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.constructor);
    Get.find<AppBarController>().appBarTitle = SK.constructor;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
