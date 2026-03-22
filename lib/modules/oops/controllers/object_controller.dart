import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ObjectController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'OBJECT IN DART';
  final String intro = 'An object is an instance of a class. When you create an object, it gets its own copy of the class fields, and you can call its methods. Objects are created using the new keyword or just the class constructor.';
  final String exampleTitle = 'Creating Objects';
  final String exampleCode = '''class Person {
  String name;
  int age;
  Person(this.name, this.age);
  void greet() => print('Hi, I am \$name, \$age years old.');
}

void main() {
  // Creating objects
  Person p1 = Person('Alice', 30);
  Person p2 = Person('Bob', 25);

  p1.greet();
  p2.greet();

  // Accessing properties
  print('Name: \${p1.name}');
  print('Age: \${p2.age}');

  // Modifying properties
  p1.age = 31;
  p1.greet();
}''';
  final String exampleOutput = '''Hi, I am Alice, 30 years old.
Hi, I am Bob, 25 years old.
Name: Alice
Age: 25
Hi, I am Alice, 31 years old.''';
  final List<String> tips = [
    'Each object has its own copy of instance fields.',
    'Multiple objects can be created from the same class.',
    'Objects are reference types in Dart.',
    'Use var or the class type to declare object variables.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.objectInDart);
    Get.find<AppBarController>().appBarTitle = SK.objectInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
