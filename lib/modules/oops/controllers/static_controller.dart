import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaticController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'STATIC IN DART';
  final String intro = 'Static members belong to the class itself, not to any individual object. Use the static keyword for fields and methods that should be shared across all instances. Access them using the class name.';
  final String exampleTitle = 'Static Members Example';
  final String exampleCode = '''class Counter {
  static int count = 0;
  String name;

  Counter(this.name) {
    count++;
    print('\$name created. Total count: \$count');
  }

  static void resetCount() {
    count = 0;
    print('Counter reset to 0');
  }

  static int getCount() => count;
}

void main() {
  Counter c1 = Counter('First');
  Counter c2 = Counter('Second');
  Counter c3 = Counter('Third');

  print('Total objects: \${Counter.getCount()}');
  Counter.resetCount();
  print('After reset: \${Counter.count}');
}''';
  final String exampleOutput = '''First created. Total count: 1
Second created. Total count: 2
Third created. Total count: 3
Total objects: 3
Counter reset to 0
After reset: 0''';
  final List<String> tips = [
    'Access static members using ClassName.memberName, not through objects.',
    'Static fields are shared across all instances of the class.',
    'Use static for utility methods and constants.',
    'Static methods cannot access instance (non-static) members.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.static);
    Get.find<AppBarController>().appBarTitle = SK.static;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
