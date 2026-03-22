import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TernaryController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'TERNARY OPERATOR IN DART';
  final String intro =
      'The ternary operator is a shorthand for an if-else statement. It evaluates a condition and returns one of two values. It is a concise way to assign values based on a condition.';

  final String syntaxTitle = 'Ternary Operator Syntax';
  final String syntaxDesc =
      'The syntax is: condition ? valueIfTrue : valueIfFalse. If the condition is true, it returns valueIfTrue; otherwise, it returns valueIfFalse.';
  final String syntaxCode = '''void main() {
  int age = 20;
  String result = age >= 18 ? 'Adult' : 'Minor';
  print(result);
}''';
  final String syntaxOutput = '''Adult''';

  final String comparisonTitle = 'Ternary vs If-Else';
  final String comparisonDesc =
      'The ternary operator produces the same result as an if-else block but in fewer lines.';
  final String comparisonCode = '''void main() {
  int num = -5;

  // Using if-else
  String sign1;
  if (num >= 0) {
    sign1 = 'positive';
  } else {
    sign1 = 'negative';
  }

  // Using ternary operator
  String sign2 = num >= 0 ? 'positive' : 'negative';

  print('if-else: \$sign1');
  print('ternary: \$sign2');
}''';
  final String comparisonOutput = '''if-else: negative
ternary: negative''';

  final String nestedTitle = 'Nested Ternary';
  final String nestedDesc =
      'You can nest ternary operators, but use them sparingly as they can reduce readability.';
  final String nestedCode = '''void main() {
  int score = 85;
  String grade = score >= 90
      ? 'A'
      : score >= 80
          ? 'B'
          : score >= 70
              ? 'C'
              : 'F';
  print('Grade: \$grade');
}''';
  final String nestedOutput = '''Grade: B''';

  final String nullCoalescingTitle = 'Null-Aware Operators';
  final String nullCoalescingDesc =
      'Dart also has the null-coalescing operator (??) which returns the right side if the left is null.';
  final String nullCoalescingCode = '''void main() {
  String? name;
  String displayName = name ?? 'Guest';
  print('Hello, \$displayName!');

  name = 'Alice';
  displayName = name ?? 'Guest';
  print('Hello, \$displayName!');
}''';
  final String nullCoalescingOutput = '''Hello, Guest!
Hello, Alice!''';

  final List<String> tips = [
    'Use ternary for simple conditions to keep code concise.',
    'Avoid deeply nested ternary operators — use if-else instead.',
    'The ?? operator is great for providing default values for nullable types.',
    'Ternary operators can be used inline in string interpolation.',
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
      child: SideNavBarChildEnum.ternery,
    );
    Get.find<AppBarController>().appBarTitle = SK.terneryOprator;
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
