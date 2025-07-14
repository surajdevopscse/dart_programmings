import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserInputController extends GetxController {
  final String title = 'USER INPUT IN DART';
  final String whyInputMatters = 'Why User Input Matters?';
  final String whyInputMattersDesc =
      "Instead of writing hard-coded values, you can give input to the computer. It will make your program more dynamic. You must import the package import 'dart:io'; for user input.";
  final String infoNote =
      "Note: You won’t be able to take input from users using dartpad. You need to run a program from your computer.";
  final String howToTakeInput = 'How to Take User Input in Dart?';
  final String howToTakeInputDesc =
      'To take input from the user in Dart (console applications), you need to use the dart:io library. The most common way is to use stdin.readLineSync() to read a line of text from the user.';
  final String exampleStringInput = 'Example: Reading a String from User';
  final String codeStringInput = '''import 'dart:io';

void main() {
  print('Enter your name:');
  String? name = stdin.readLineSync();
  print('Hello, \$name!');
}''';
  final String outputStringInput = '''Enter your name:
John
Hello, John!''';
  final String explanationStringInput =
      "1. import 'dart:io'; is required for input/output operations.\n2. stdin.readLineSync() reads a line of text from the user.\n3. The input is stored in a nullable String variable (String?).";
  final String readingNumbers = 'Reading Numbers from User';
  final String readingNumbersDesc =
      'To read numbers, you need to parse the input string to int or double:';
  final String codeNumberInput = '''import 'dart:io';

void main() {
  print('Enter a number:');
  String? input = stdin.readLineSync();
  int? number = int.tryParse(input ?? '');
  if (number != null) {
    print('You entered: \$number');
  } else {
    print('Invalid input!');
  }
}''';
  final String outputNumberInput = '''Enter a number:
42
You entered: 42''';
  final String tipsTitle = 'Tips for User Input in Dart';
  final List<String> tips = [
    'Always check for null when using stdin.readLineSync().',
    'Use int.tryParse or double.tryParse to safely convert input.',
    'For more complex input, consider writing helper functions.',
  ];
  final String exampleAddNumbers = 'Example: Adding Two Numbers from User Input';
  final String codeAddNumbers = '''import 'dart:io';

void main() {
  print('Enter first number:');
  int? num1 = int.tryParse(stdin.readLineSync() ?? '');
  print('Enter second number:');
  int? num2 = int.tryParse(stdin.readLineSync() ?? '');
  if (num1 != null && num2 != null) {
    print('Sum: \\{num1 + num2}');
  } else {
    print('Invalid input!');
  }
}''';
  final String outputAddNumbers = '''Enter first number:
10
Enter second number:
20
Sum: 30''';
  final String summaryTitle = 'Summary';
  final String summaryDesc =
      'User input makes your Dart programs interactive and dynamic. Remember to always validate and parse input properly to avoid errors.';



bool showBackToTopButton = false;
  late ScrollController scrollController;
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
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.oprators,
    );
    Get.find<AppBarController>().appBarTitle = SK.oprator;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
