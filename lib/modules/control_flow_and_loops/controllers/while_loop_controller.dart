import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhileLoopController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'WHILE LOOP IN DART';
  final String intro =
      'The while loop in Dart repeatedly executes a block of code as long as the given condition is true. The condition is checked before each iteration, so if the condition is false initially, the loop body never executes.';

  final String basicWhileTitle = 'Basic While Loop';
  final String basicWhileDesc =
      'The while loop checks its condition before executing the body. It continues as long as the condition remains true.';
  final String basicWhileCode = '''void main() {
  int i = 1;
  while (i <= 5) {
    print('Iteration: \$i');
    i++;
  }
  print('Loop finished!');
}''';
  final String basicWhileOutput = '''Iteration: 1
Iteration: 2
Iteration: 3
Iteration: 4
Iteration: 5
Loop finished!''';

  final String countdownTitle = 'Countdown Using While Loop';
  final String countdownDesc =
      'While loops are great for countdown operations.';
  final String countdownCode = '''void main() {
  int count = 10;
  while (count > 0) {
    print(count);
    count -= 2;
  }
  print('Done!');
}''';
  final String countdownOutput = '''10
8
6
4
2
Done!''';

  final String userInputTitle = 'While Loop for Validation';
  final String userInputDesc =
      'While loops are commonly used to keep asking for input until a valid value is provided.';
  final String userInputCode = '''void main() {
  // Simulating input validation
  List<int> inputs = [-1, 0, -5, 10]; // Simulated inputs
  int index = 0;
  int number = inputs[index];

  while (number <= 0) {
    print('Invalid: \$number. Must be positive.');
    index++;
    number = inputs[index];
  }
  print('Valid number: \$number');
}''';
  final String userInputOutput = '''Invalid: -1. Must be positive.
Invalid: 0. Must be positive.
Invalid: -5. Must be positive.
Valid number: 10''';

  final List<String> tips = [
    'Always ensure the condition will eventually become false.',
    'An infinite while loop can freeze your application.',
    'The while loop body may never execute if the condition starts as false.',
    'Use a counter variable and increment/decrement it inside the loop.',
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
      child: SideNavBarChildEnum.whileLoop,
    );
    Get.find<AppBarController>().appBarTitle = SK.whileLoop;
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
