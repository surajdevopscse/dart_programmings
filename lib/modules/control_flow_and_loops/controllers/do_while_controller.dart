import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoWhileController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'DO WHILE LOOP IN DART';
  final String intro =
      'The do-while loop is similar to the while loop, but with one key difference: the loop body executes at least once before the condition is checked. This guarantees one execution regardless of the condition.';

  final String basicDoWhileTitle = 'Basic Do-While Loop';
  final String basicDoWhileDesc =
      'The do block executes first, then the while condition is evaluated. If true, the loop continues; if false, it stops.';
  final String basicDoWhileCode = '''void main() {
  int i = 1;
  do {
    print('Value: \$i');
    i++;
  } while (i <= 5);
  print('Loop complete!');
}''';
  final String basicDoWhileOutput = '''Value: 1
Value: 2
Value: 3
Value: 4
Value: 5
Loop complete!''';

  final String conditionFalseTitle = 'Do-While When Condition Is False';
  final String conditionFalseDesc =
      'Even when the condition is initially false, do-while still executes the body once.';
  final String conditionFalseCode = '''void main() {
  int x = 100;

  // while loop - body never executes
  while (x < 10) {
    print('while: \$x');
  }

  // do-while - body executes once even though x >= 10
  do {
    print('do-while: \$x');
    x++;
  } while (x < 10);
}''';
  final String conditionFalseOutput = '''do-while: 100''';

  final String menuTitle = 'Menu Loop Example';
  final String menuDesc =
      'Do-while is perfect for menu-driven programs where you want to show the menu at least once.';
  final String menuCode = '''void main() {
  int choice;
  int attempts = 0;
  List<int> userChoices = [5, 3, 1]; // Simulated user input

  do {
    print('--- Menu ---');
    print('1. Start');
    print('2. Settings');
    print('3. Exit');
    choice = userChoices[attempts];
    print('You chose: \$choice');
    attempts++;
  } while (choice != 3 && attempts < userChoices.length);

  print('Goodbye!');
}''';
  final String menuOutput = '''--- Menu ---
1. Start
2. Settings
3. Exit
You chose: 5
--- Menu ---
1. Start
2. Settings
3. Exit
You chose: 3
--- Menu ---
1. Start
2. Settings
3. Exit
You chose: 1
Goodbye!''';

  final List<String> tips = [
    'Do-while guarantees at least one execution of the loop body.',
    'Use do-while when you need to execute first and check later.',
    'Common use case is menu-driven programs and input validation.',
    'Remember to update the condition variable inside the loop body.',
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
      child: SideNavBarChildEnum.doWhileLoop,
    );
    Get.find<AppBarController>().appBarTitle = SK.doWhile;
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
