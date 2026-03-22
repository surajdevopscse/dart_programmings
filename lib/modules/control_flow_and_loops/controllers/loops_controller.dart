import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoopsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'LOOPS IN DART';
  final String intro =
      'Loops in Dart allow you to execute a block of code repeatedly. Dart supports several types of loops: for, for-in, while, and do-while. Each loop type is suitable for different situations.';

  final String whyLoopsTitle = 'Why Use Loops?';
  final String whyLoopsDesc =
      'Loops eliminate code repetition. Instead of writing the same code multiple times, a loop lets you execute it as many times as needed with a single block of code.';

  final String loopTypesTitle = 'Types of Loops in Dart';
  final List<String> loopTypes = [
    'for loop — repeats a block a specific number of times',
    'for-in loop — iterates over elements in a collection',
    'forEach loop — calls a function for each element',
    'while loop — repeats while a condition is true',
    'do-while loop — executes at least once before checking the condition',
  ];

  final String overviewCode = '''void main() {
  // for loop
  for (int i = 1; i <= 3; i++) {
    print('for: \$i');
  }

  // for-in loop
  List<String> fruits = ['Apple', 'Banana', 'Cherry'];
  for (String fruit in fruits) {
    print('for-in: \$fruit');
  }

  // while loop
  int count = 0;
  while (count < 3) {
    print('while: \$count');
    count++;
  }

  // do-while loop
  int n = 0;
  do {
    print('do-while: \$n');
    n++;
  } while (n < 3);
}''';
  final String overviewOutput = '''for: 1
for: 2
for: 3
for-in: Apple
for-in: Banana
for-in: Cherry
while: 0
while: 1
while: 2
do-while: 0
do-while: 1
do-while: 2''';

  final List<String> tips = [
    'Use for loop when the number of iterations is known.',
    'Use for-in or forEach when iterating over a collection.',
    'Use while loop when the condition is checked before each iteration.',
    'Use do-while when the loop body must execute at least once.',
    'Always ensure loop conditions will eventually become false to avoid infinite loops.',
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
      parent: SideNavBarParentEnum.controlFlowAndLoop,
      child: SideNavBarChildEnum.loops,
    );
    Get.find<AppBarController>().appBarTitle = SK.loops;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
