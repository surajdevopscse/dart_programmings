import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssertController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ASSERT IN DART';
  final String intro =
      'The assert statement in Dart is used during development to check that a condition is true. If the condition is false, Dart throws an AssertionError. Assert statements are only active in debug mode and are ignored in production.';

  final String syntaxTitle = 'Assert Syntax';
  final String syntaxDesc =
      'The assert statement takes a boolean expression and an optional message. If the expression evaluates to false, an AssertionError is thrown.';
  final String syntaxCode = '''// assert(condition);
// assert(condition, message);

void main() {
  int age = 20;
  assert(age >= 0, 'Age cannot be negative');
  print('Age is valid: \$age');
}''';
  final String syntaxOutput = '''Age is valid: 20''';

  final String withMessageTitle = 'Assert with Custom Message';
  final String withMessageDesc =
      'You can provide a custom error message to help identify what went wrong when an assertion fails.';
  final String withMessageCode = '''void divide(int a, int b) {
  assert(b != 0, 'Divisor cannot be zero!');
  print('\$a / \$b = \${a / b}');
}

void main() {
  divide(10, 2);
  // divide(10, 0); // This would throw AssertionError in debug mode
}''';
  final String withMessageOutput = '''10 / 2 = 5.0''';

  final String functionAssertTitle = 'Assert in Functions';
  final String functionAssertDesc =
      'Assert is commonly used to validate function parameters and ensure correct usage.';
  final String functionAssertCode = '''void setUsername(String username) {
  assert(username.isNotEmpty, 'Username cannot be empty');
  assert(username.length >= 3, 'Username must be at least 3 characters');
  print('Username set to: \$username');
}

void main() {
  setUsername('Alice');
  setUsername('Bob');
}''';
  final String functionAssertOutput = '''Username set to: Alice
Username set to: Bob''';

  final List<String> tips = [
    'Assert is only active in debug mode (flutter run or dart run).',
    'Use assert to catch programming errors, not user errors.',
    'Always add meaningful messages to assert statements.',
    'Do not use assert for input validation in production code.',
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
      child: SideNavBarChildEnum.assertInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.assertInDart;
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
