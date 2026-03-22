import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ArrowFunctionsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ARROW FUNCTIONS IN DART';
  final String intro =
      'Arrow functions (fat arrow functions) use the => syntax to define a function body with a single expression. They are a concise way to write functions that return a single value.';

  final String syntaxTitle = 'Arrow Function Syntax';
  final String syntaxDesc =
      'Replace the function body {} with => expression. The expression after => is automatically returned.';
  final String syntaxCode = '''// Regular function
int addRegular(int a, int b) {
  return a + b;
}

// Arrow function
int addArrow(int a, int b) => a + b;

// Void arrow function
void printDouble(int n) => print(n * 2);

void main() {
  print(addRegular(3, 4));
  print(addArrow(3, 4));
  printDouble(5);
}''';
  final String syntaxOutput = '''7
7
10''';

  final String withCollectionsTitle = 'Arrow Functions with Collections';
  final String withCollectionsDesc =
      'Arrow functions shine when used with collection operations like map, where, and reduce.';
  final String withCollectionsCode = '''void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // map with arrow function
  var squares = numbers.map((n) => n * n).toList();
  print('Squares: \$squares');

  // where with arrow function
  var odds = numbers.where((n) => n % 2 != 0).toList();
  print('Odds: \$odds');

  // reduce with arrow function
  var sum = numbers.reduce((a, b) => a + b);
  print('Sum: \$sum');
}''';
  final String withCollectionsOutput = '''Squares: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
Odds: [1, 3, 5, 7, 9]
Sum: 55''';

  final String classArrowTitle = 'Arrow Functions in Classes';
  final String classArrowDesc =
      'Arrow functions are commonly used for simple getter methods and one-liner methods in classes.';
  final String classArrowCode = '''class Circle {
  final double radius;
  Circle(this.radius);

  double get area => 3.14159 * radius * radius;
  double get circumference => 2 * 3.14159 * radius;
  String describe() => 'Circle with radius \$radius';
}

void main() {
  var c = Circle(5.0);
  print('Area: \${c.area.toStringAsFixed(2)}');
  print('Circumference: \${c.circumference.toStringAsFixed(2)}');
  print(c.describe());
}''';
  final String classArrowOutput = '''Area: 78.54
Circumference: 31.42
Circle with radius 5.0''';

  final List<String> tips = [
    'Use => only for functions with a single expression.',
    'Arrow functions cannot contain multiple statements or if-else blocks.',
    'They make collection operations like map and where more readable.',
    'Arrow functions work well as class getters and simple methods.',
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
      child: SideNavBarChildEnum.arrowFunctions,
    );
    Get.find<AppBarController>().appBarTitle = SK.arrowFunctions;
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
