import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CLASS IN DART';
  final String intro = 'A class is a blueprint for creating objects. It defines the properties (fields) and behaviors (methods) that the objects will have. In Dart, use the class keyword to define a class.';
  final String exampleTitle = 'Defining a Class';
  final String exampleCode = '''class Car {
  String brand;
  String model;
  int year;

  Car(this.brand, this.model, this.year);

  void displayInfo() {
    print('\$year \$brand \$model');
  }

  bool isVintage() => year < 1980;
}

void main() {
  Car car1 = Car('Toyota', 'Camry', 2022);
  Car car2 = Car('Ford', 'Mustang', 1969);
  car1.displayInfo();
  car2.displayInfo();
  print('Is vintage: \${car2.isVintage()}');
}''';
  final String exampleOutput = '''2022 Toyota Camry
1969 Ford Mustang
Is vintage: true''';
  final List<String> tips = [
    'Class names use PascalCase by convention.',
    'Fields are declared inside the class body.',
    'Methods define the behavior of the class.',
    'Use the class keyword followed by the class name.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.classInDart);
    Get.find<AppBarController>().appBarTitle = SK.classInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
