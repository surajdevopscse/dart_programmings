import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForLoopController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FOR LOOP IN DART';
  final String intro =
      'The for loop in Dart is used to repeat a block of code a specific number of times. It consists of an initializer, a condition, and an increment/decrement expression.';

  final String syntaxTitle = 'For Loop Syntax';
  final String syntaxDesc =
      'The for loop has three parts: initialization (runs once), condition (checked before each iteration), and update (runs after each iteration).';
  final String basicCode = '''void main() {
  for (int i = 1; i <= 5; i++) {
    print('Count: \$i');
  }
}''';
  final String basicOutput = '''Count: 1
Count: 2
Count: 3
Count: 4
Count: 5''';

  final String sumTitle = 'Sum Using For Loop';
  final String sumDesc =
      'A common use case for for loops is calculating cumulative values like sums.';
  final String sumCode = '''void main() {
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print('Sum of 1 to 10: \$sum');
}''';
  final String sumOutput = '''Sum of 1 to 10: 55''';

  final String reverseTitle = 'Reverse For Loop';
  final String reverseDesc =
      'You can loop backwards by decrementing the counter.';
  final String reverseCode = '''void main() {
  for (int i = 5; i >= 1; i--) {
    print('Countdown: \$i');
  }
  print('Go!');
}''';
  final String reverseOutput = '''Countdown: 5
Countdown: 4
Countdown: 3
Countdown: 2
Countdown: 1
Go!''';

  final String listLoopTitle = 'Iterating Over a List';
  final String listLoopDesc =
      'Use the index to iterate over a list with a for loop.';
  final String listLoopCode = '''void main() {
  List<String> colors = ['Red', 'Green', 'Blue'];

  for (int i = 0; i < colors.length; i++) {
    print('Color \${i + 1}: \${colors[i]}');
  }
}''';
  final String listLoopOutput = '''Color 1: Red
Color 2: Green
Color 3: Blue''';

  final List<String> tips = [
    'Use i++ for incrementing and i-- for decrementing.',
    'The loop runs while the condition is true.',
    'You can use any variable as the loop counter, not just i.',
    'Avoid modifying the counter variable inside the loop body.',
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
      child: SideNavBarChildEnum.forLoop,
    );
    Get.find<AppBarController>().appBarTitle = SK.forLoop;
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
