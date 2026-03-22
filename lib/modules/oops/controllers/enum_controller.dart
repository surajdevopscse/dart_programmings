import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnumController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ENUM IN DART';
  final String intro = 'An enum (enumeration) is a special type that represents a fixed set of constant values. Enums improve code readability by replacing magic numbers or strings with meaningful names.';
  final String exampleTitle = 'Enum Example';
  final String exampleCode = '''enum Direction { north, south, east, west }

enum TrafficLight {
  red(duration: 30),
  yellow(duration: 5),
  green(duration: 25);

  final int duration;
  const TrafficLight({required this.duration});
}

void move(Direction dir) {
  switch (dir) {
    case Direction.north:
      print('Moving north');
      break;
    case Direction.south:
      print('Moving south');
      break;
    case Direction.east:
      print('Moving east');
      break;
    case Direction.west:
      print('Moving west');
      break;
  }
}

void main() {
  move(Direction.north);
  move(Direction.east);

  TrafficLight light = TrafficLight.red;
  print('\${light.name}: \${light.duration} seconds');

  for (TrafficLight tl in TrafficLight.values) {
    print('\${tl.name}: \${tl.duration}s');
  }
}''';
  final String exampleOutput = '''Moving north
Moving east
red: 30 seconds
red: 30s
yellow: 5s
green: 25s''';
  final List<String> tips = [
    'Enums represent a fixed set of named values.',
    'Use enums instead of string or int constants for type safety.',
    'Enhanced enums (Dart 2.17+) can have fields, getters, and methods.',
    'The .values property returns all enum values as a list.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.enumInDart);
    Get.find<AppBarController>().appBarTitle = SK.enumInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
