import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MixinController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'MIXIN IN DART';
  final String intro = 'A mixin is a way to reuse code in multiple class hierarchies. Use the mixin keyword to define a mixin, and the with keyword to apply it. Mixins provide a way to add multiple behaviors to a class.';
  final String exampleTitle = 'Mixin Example';
  final String exampleCode = '''mixin Flyable {
  int altitude = 0;
  void fly() => print('\${toString()} is flying at \$altitude meters.');
  void land() { altitude = 0; print('\${toString()} has landed.'); }
}

mixin Swimmable {
  int depth = 0;
  void swim() => print('\${toString()} is swimming at \$depth meters deep.');
}

class Animal {
  String name;
  Animal(this.name);
  @override
  String toString() => name;
}

class Duck extends Animal with Flyable, Swimmable {
  Duck(String name) : super(name);
}

class Fish extends Animal with Swimmable {
  Fish(String name) : super(name);
}

void main() {
  Duck duck = Duck('Donald');
  duck.altitude = 100;
  duck.fly();
  duck.swim();
  duck.land();

  Fish fish = Fish('Nemo');
  fish.depth = 50;
  fish.swim();
}''';
  final String exampleOutput = '''Donald is flying at 100 meters.
Donald is swimming at 0 meters deep.
Donald has landed.
Nemo is swimming at 50 meters deep.''';
  final List<String> tips = [
    'Use mixins to share behavior across unrelated classes.',
    'Mixins cannot be instantiated directly.',
    'Use on keyword to restrict which classes can use a mixin.',
    'Mixins are applied in left-to-right order with the with keyword.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.mixinInDart);
    Get.find<AppBarController>().appBarTitle = SK.mixinInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
