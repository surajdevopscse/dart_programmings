import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExtensionController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'EXTENSION IN DART';
  final String intro =
      'Extensions allow you to add new functionality to existing classes without modifying them. Use the extension keyword to define extensions on any type, including built-in types like String and int.';
  final String exampleTitle = 'Extension Example';
  final String exampleCode = '''extension StringExtensions on String {
  bool get isPalindrome => this == split('').reversed.join('');
  String get titleCase => split(' ')
      .map((w) => w.isEmpty ? w : w[0].toUpperCase() + w.substring(1))
      .join(' ');
  int get wordCount =>
      trim().isEmpty ? 0 : trim().split(RegExp(r'\\s+')).length;
}

extension IntExtensions on int {
  bool get isPrime {
    if (this < 2) return false;
    for (int i = 2; i * i <= this; i++) {
      if (this % i == 0) return false;
    }
    return true;
  }
}

void main() {
  print('racecar'.isPalindrome);
  print('hello world'.titleCase);
  print('Hello World Dart'.wordCount);
  print(7.isPrime);
  print(4.isPrime);
}''';
  final String exampleOutput = '''true
Hello World
3
true
false''';
  final List<String> tips = [
    'Extensions add methods to existing types without subclassing.',
    'You can extend any type including built-in types.',
    'Extension methods are resolved at compile time, not runtime.',
    'Use meaningful names for extensions to avoid conflicts.',
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
      child: SideNavBarChildEnum.extension,
    );
    Get.find<AppBarController>().appBarTitle = SK.extension;
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
