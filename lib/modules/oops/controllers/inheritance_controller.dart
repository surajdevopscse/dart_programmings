import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InheritanceController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'INHERITANCE IN DART';
  final String intro = 'Inheritance allows a class (child/subclass) to inherit properties and methods from another class (parent/superclass). Use the extends keyword. Dart supports single inheritance.';
  final String exampleTitle = 'Inheritance Example';
  final String exampleCode = '''class Vehicle {
  String brand;
  int speed;

  Vehicle(this.brand, this.speed);

  void describe() {
    print('\$brand with max speed \$speed km/h');
  }

  void accelerate() {
    print('\$brand is accelerating...');
  }
}

class ElectricCar extends Vehicle {
  int batteryCapacity;

  ElectricCar(String brand, int speed, this.batteryCapacity)
      : super(brand, speed);

  @override
  void describe() {
    super.describe();
    print('Battery: \$batteryCapacity kWh');
  }
}

void main() {
  Vehicle v = Vehicle('Toyota', 180);
  v.describe();
  v.accelerate();

  ElectricCar ec = ElectricCar('Tesla', 250, 100);
  ec.describe();
  ec.accelerate();
}''';
  final String exampleOutput = '''Toyota with max speed 180 km/h
Toyota is accelerating...
Tesla with max speed 250 km/h
Battery: 100 kWh
Tesla is accelerating...''';
  final List<String> tips = [
    'Dart supports single inheritance — a class can extend only one parent.',
    'Use super to call parent class constructors and methods.',
    'Override methods using the @override annotation.',
    'All Dart classes implicitly extend Object.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.inheritence);
    Get.find<AppBarController>().appBarTitle = SK.inheritence;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
