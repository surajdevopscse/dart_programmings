import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OopsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'OOP IN DART';
  final String intro =
      'Object-Oriented Programming (OOP) is a programming paradigm that organizes code into objects. Dart is a fully object-oriented language that supports classes, objects, inheritance, polymorphism, encapsulation, and abstraction.';

  final String principlesTitle = 'Four Pillars of OOP';
  final List<String> principles = [
    'Encapsulation — bundling data and methods that operate on the data within a class',
    'Inheritance — a class can inherit properties and methods from another class',
    'Polymorphism — objects of different classes can be treated as objects of a common superclass',
    'Abstraction — hiding implementation details and exposing only necessary functionality',
  ];

  final String exampleTitle = 'Simple OOP Example in Dart';
  final String exampleCode = '''class Animal {
  String name;
  int age;

  Animal(this.name, this.age);

  void speak() {
    print('\$name makes a sound.');
  }

  void describe() {
    print('\$name is \$age years old.');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, int age, this.breed) : super(name, age);

  @override
  void speak() {
    print('\$name barks!');
  }
}

void main() {
  Animal cat = Animal('Whiskers', 3);
  cat.speak();
  cat.describe();

  Dog dog = Dog('Rex', 5, 'German Shepherd');
  dog.speak();
  dog.describe();
}''';
  final String exampleOutput = '''Whiskers makes a sound.
Whiskers is 3 years old.
Rex barks!
Rex is 5 years old.''';

  final List<String> tips = [
    'OOP makes code more organized, reusable, and maintainable.',
    'Everything in Dart is an object — even numbers and functions.',
    'Use classes to model real-world entities in your programs.',
    'Follow SOLID principles for well-designed OOP code.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTopButton = true;
        } else {
          showBackToTopButton = false;
        }
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.oppsInDart,
      child: SideNavBarChildEnum.oopsInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.oopsInDart;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
