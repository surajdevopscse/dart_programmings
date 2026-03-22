import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BreakContinueController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'BREAK AND CONTINUE IN DART';
  final String intro =
      'Dart provides two special statements to control loop execution: break and continue. The break statement exits the loop immediately, while continue skips the current iteration and moves to the next one.';

  final String breakTitle = 'Break Statement';
  final String breakDesc =
      'The break statement terminates the nearest enclosing loop or switch statement immediately.';
  final String breakCode = '''void main() {
  for (int i = 1; i <= 10; i++) {
    if (i == 6) {
      print('Breaking at \$i');
      break;
    }
    print('i = \$i');
  }
  print('Loop ended');
}''';
  final String breakOutput = '''i = 1
i = 2
i = 3
i = 4
i = 5
Breaking at 6
Loop ended''';

  final String continueTitle = 'Continue Statement';
  final String continueDesc =
      'The continue statement skips the rest of the current iteration and moves to the next iteration of the loop.';
  final String continueCode = '''void main() {
  for (int i = 1; i <= 10; i++) {
    if (i % 2 == 0) {
      continue; // Skip even numbers
    }
    print('Odd: \$i');
  }
}''';
  final String continueOutput = '''Odd: 1
Odd: 3
Odd: 5
Odd: 7
Odd: 9''';

  final String searchTitle = 'Break in Search Example';
  final String searchDesc =
      'Break is commonly used to exit a loop once a search target is found.';
  final String searchCode = '''void main() {
  List<String> names = ['Alice', 'Bob', 'Charlie', 'Diana', 'Eve'];
  String target = 'Charlie';
  bool found = false;

  for (String name in names) {
    if (name == target) {
      found = true;
      print('Found: \$name');
      break;
    }
    print('Checking: \$name');
  }

  if (!found) {
    print('\$target not found');
  }
}''';
  final String searchOutput = '''Checking: Alice
Checking: Bob
Found: Charlie''';

  final List<String> tips = [
    'break exits the current loop entirely.',
    'continue skips only the current iteration, not the whole loop.',
    'Both break and continue work in for, while, and do-while loops.',
    'Use labeled breaks (label:) to break out of nested loops.',
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
      child: SideNavBarChildEnum.breakContinue,
    );
    Get.find<AppBarController>().appBarTitle = SK.breakAnndContinue;
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
