import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConditionsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CONDITIONS IN DART';
  final String intro =
      'Conditions in Dart allow you to execute different blocks of code based on whether a condition is true or false. The most common conditional statements are if, else if, and else.';

  final String ifElseSyntaxTitle = 'If-Else Syntax';
  final String ifElseSyntaxDesc =
      'The if statement evaluates a boolean expression. If the expression is true, the block of code inside if executes. Otherwise, the else block executes.';
  final String ifElseCode = '''void main() {
  int age = 18;

  if (age >= 18) {
    print('You are an adult.');
  } else {
    print('You are a minor.');
  }
}''';
  final String ifElseOutput = '''You are an adult.''';

  final String elseIfTitle = 'Else If Ladder';
  final String elseIfDesc =
      'You can chain multiple conditions using else if to check several conditions in sequence.';
  final String elseIfCode = '''void main() {
  int score = 75;

  if (score >= 90) {
    print('Grade: A');
  } else if (score >= 75) {
    print('Grade: B');
  } else if (score >= 60) {
    print('Grade: C');
  } else {
    print('Grade: F');
  }
}''';
  final String elseIfOutput = '''Grade: B''';

  final String nestedIfTitle = 'Nested If Conditions';
  final String nestedIfDesc =
      'You can place an if statement inside another if statement to check multiple conditions.';
  final String nestedIfCode = '''void main() {
  int num = 15;

  if (num > 0) {
    if (num % 2 == 0) {
      print('\$num is positive and even.');
    } else {
      print('\$num is positive and odd.');
    }
  } else {
    print('\$num is not positive.');
  }
}''';
  final String nestedIfOutput = '''15 is positive and odd.''';

  final List<String> tips = [
    'Always use braces {} even for single-line if blocks for readability.',
    'Keep conditions simple and readable.',
    'Consider switch-case for multiple equality checks.',
    'Use ternary operator for simple if-else assignments.',
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
      child: SideNavBarChildEnum.conditions,
    );
    Get.find<AppBarController>().appBarTitle = SK.conditions;
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
