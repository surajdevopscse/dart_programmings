import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypesOfFunctionsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'TYPES OF FUNCTIONS IN DART';
  final String intro =
      'Dart supports several types of functions. Understanding each type helps you write better, more expressive code for different situations.';

  final String voidFuncTitle = 'Void Functions';
  final String voidFuncDesc =
      'Void functions perform an action but do not return any value. They are used for side effects like printing or modifying state.';
  final String voidFuncCode = '''void printDivider() {
  print('------------------------');
}

void displayMessage(String msg) {
  print('Message: \$msg');
}

void main() {
  printDivider();
  displayMessage('Hello Dart!');
  printDivider();
}''';
  final String voidFuncOutput = '''------------------------
Message: Hello Dart!
------------------------''';

  final String returnFuncTitle = 'Return Type Functions';
  final String returnFuncDesc =
      'Functions that return a value must declare their return type. The returned value can be used in expressions.';
  final String returnFuncCode = '''int square(int n) {
  return n * n;
}

String repeat(String s, int times) {
  return s * times;
}

List<int> range(int start, int end) {
  return List.generate(end - start, (i) => start + i);
}

void main() {
  print(square(7));
  print(repeat('ab', 3));
  print(range(1, 6));
}''';
  final String returnFuncOutput = '''49
ababab
[1, 2, 3, 4, 5]''';

  final String recFuncTitle = 'Recursive Functions';
  final String recFuncDesc =
      'A recursive function calls itself to solve a problem by breaking it into smaller sub-problems.';
  final String recFuncCode = '''int factorial(int n) {
  if (n <= 1) return 1;
  return n * factorial(n - 1);
}

int fibonacci(int n) {
  if (n <= 1) return n;
  return fibonacci(n - 1) + fibonacci(n - 2);
}

void main() {
  print('5! = \${factorial(5)}');
  print('Fib(8) = \${fibonacci(8)}');
}''';
  final String recFuncOutput = '''5! = 120
Fib(8) = 21''';

  final List<String> tips = [
    'Use void for functions that only perform actions without returning data.',
    'Always specify the return type for functions that return values.',
    'Recursive functions must have a base case to prevent infinite recursion.',
    'Higher-order functions accept functions as parameters or return them.',
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
      parent: SideNavBarParentEnum.functions,
      child: SideNavBarChildEnum.typesOfFunctions,
    );
    Get.find<AppBarController>().appBarTitle = SK.typesOfFunctions;
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
