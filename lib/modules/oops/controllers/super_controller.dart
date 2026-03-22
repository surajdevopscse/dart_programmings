import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperInDartController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'SUPER IN DART';
  final String intro = 'The super keyword refers to the parent class. It is used to call parent class constructors, access parent class fields, and invoke overridden parent methods from a subclass.';
  final String exampleTitle = 'Using Super';
  final String exampleCode = '''class Animal {
  String name;

  Animal(this.name) {
    print('Animal constructor called for \$name');
  }

  void makeSound() {
    print('\$name makes a generic sound.');
  }
}

class Dog extends Animal {
  String breed;

  Dog(String name, this.breed) : super(name) {
    print('Dog constructor called for \$name (\$breed)');
  }

  @override
  void makeSound() {
    super.makeSound(); // Call parent method
    print('\$name also barks!');
  }
}

void main() {
  Dog dog = Dog('Rex', 'Labrador');
  dog.makeSound();
}''';
  final String exampleOutput = '''Animal constructor called for Rex
Dog constructor called for Rex (Labrador)
Rex makes a generic sound.
Rex also barks!''';
  final List<String> tips = [
    'Use super() to call the parent constructor from the child constructor.',
    'super.methodName() calls the overridden parent method.',
    'The parent constructor must be called before the child body runs.',
    'super is especially useful when extending and extending functionality.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.superInDart);
    Get.find<AppBarController>().appBarTitle = SK.superInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
