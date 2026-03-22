import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FunctionsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FUNCTIONS IN DART';
  final String intro =
      'A function is a reusable block of code that performs a specific task. Functions help organize code, reduce repetition, and make programs easier to read and maintain.';

  final String syntaxTitle = 'Function Syntax';
  final String syntaxDesc =
      'A function in Dart has a return type, name, optional parameters, and a body. Use void when the function does not return a value.';
  final String syntaxCode = '''// returnType functionName(parameters) {
//   // function body
//   return value;
// }

void greet(String name) {
  print('Hello, \$name!');
}

int add(int a, int b) {
  return a + b;
}

void main() {
  greet('Alice');
  int result = add(5, 3);
  print('5 + 3 = \$result');
}''';
  final String syntaxOutput = '''Hello, Alice!
5 + 3 = 8''';

  final String returnTypesTitle = 'Function Return Types';
  final String returnTypesDesc =
      'Functions can return any type including int, String, List, or custom objects. Use void when nothing is returned.';
  final String returnTypesCode = '''String getFullName(String first, String last) {
  return '\$first \$last';
}

double calculateArea(double radius) {
  return 3.14159 * radius * radius;
}

bool isEven(int number) {
  return number % 2 == 0;
}

void main() {
  print(getFullName('John', 'Doe'));
  print('Area: \${calculateArea(5.0).toStringAsFixed(2)}');
  print('Is 4 even? \${isEven(4)}');
}''';
  final String returnTypesOutput = '''John Doe
Area: 78.54
Is 4 even? true''';

  final List<String> tips = [
    'Functions should do one thing and do it well.',
    'Name functions with verbs that describe the action (e.g., calculateTotal, printReport).',
    'Keep functions short and focused for better readability.',
    'Use return types to make code self-documenting.',
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
      child: SideNavBarChildEnum.functions,
    );
    Get.find<AppBarController>().appBarTitle = SK.functions;
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
