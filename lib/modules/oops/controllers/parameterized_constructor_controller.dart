import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParameterizedConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'PARAMETERIZED CONSTRUCTOR IN DART';
  final String intro = 'A parameterized constructor accepts arguments to initialize fields. Dart provides a concise shorthand using this.fieldName directly in the parameter list.';
  final String exampleTitle = 'Parameterized Constructor';
  final String exampleCode = '''class Student {
  String name;
  int rollNo;
  double gpa;

  // Parameterized constructor with shorthand
  Student(this.name, this.rollNo, this.gpa);

  // Constructor with named parameters
  Student.named({required this.name, required this.rollNo, this.gpa = 0.0});

  void display() {
    print('Name: \$name, Roll: \$rollNo, GPA: \$gpa');
  }
}

void main() {
  Student s1 = Student('Alice', 101, 3.8);
  Student s2 = Student.named(name: 'Bob', rollNo: 102, gpa: 3.5);
  s1.display();
  s2.display();
}''';
  final String exampleOutput = '''Name: Alice, Roll: 101, GPA: 3.8
Name: Bob, Roll: 102, GPA: 3.5''';
  final List<String> tips = [
    'Use this.fieldName shorthand for concise constructors.',
    'Named parameters make constructors more readable at the call site.',
    'Provide default values for optional parameters using =.',
    'The required keyword enforces that named parameters must be provided.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.paramterizedConstructor);
    Get.find<AppBarController>().appBarTitle = SK.paramterizedConstructor;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
