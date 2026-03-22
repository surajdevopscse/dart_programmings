import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PolymorphismController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'POLYMORPHISM IN DART';
  final String intro = 'Polymorphism means "many forms". In OOP, it allows objects of different classes to be treated as objects of a common superclass. The method called is determined at runtime based on the actual object type.';
  final String exampleTitle = 'Polymorphism Example';
  final String exampleCode = '''abstract class Shape {
  double get area;
  void printArea() => print('\${runtimeType}: area = \${area.toStringAsFixed(2)}');
}

class Circle extends Shape {
  double radius;
  Circle(this.radius);
  @override
  double get area => 3.14159 * radius * radius;
}

class Rectangle extends Shape {
  double width, height;
  Rectangle(this.width, this.height);
  @override
  double get area => width * height;
}

class Triangle extends Shape {
  double base, height;
  Triangle(this.base, this.height);
  @override
  double get area => 0.5 * base * height;
}

void main() {
  List<Shape> shapes = [
    Circle(5),
    Rectangle(4, 6),
    Triangle(3, 8),
  ];

  for (Shape s in shapes) {
    s.printArea();
  }
}''';
  final String exampleOutput = '''Circle: area = 78.54
Rectangle: area = 24.00
Triangle: area = 12.00''';
  final List<String> tips = [
    'Polymorphism enables writing code that works with objects of multiple types.',
    'Method overriding is the key mechanism for runtime polymorphism.',
    'Use abstract classes or interfaces to define common behavior.',
    'The runtimeType property returns the actual type of an object.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.polymorphism);
    Get.find<AppBarController>().appBarTitle = SK.polymorphism;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
