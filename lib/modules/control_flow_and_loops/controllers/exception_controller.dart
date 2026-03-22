import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExceptionController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'EXCEPTION HANDLING IN DART';
  final String intro =
      'Exception handling in Dart allows you to gracefully handle runtime errors. Dart uses try, catch, on, finally, and throw keywords to manage exceptions and prevent application crashes.';

  final String tryCatchTitle = 'Try-Catch Block';
  final String tryCatchDesc =
      'Wrap code that might throw an error in a try block. If an error occurs, the catch block handles it.';
  final String tryCatchCode = '''void main() {
  try {
    int result = 10 ~/ 0; // Integer division by zero
    print('Result: \$result');
  } catch (e) {
    print('Error caught: \$e');
  }
  print('Program continues...');
}''';
  final String tryCatchOutput = '''Error caught: IntegerDivisionByZeroException
Program continues...''';

  final String onKeywordTitle = 'Using "on" for Specific Exceptions';
  final String onKeywordDesc =
      'Use the on keyword to catch specific exception types.';
  final String onKeywordCode = '''void main() {
  try {
    List<int> numbers = [1, 2, 3];
    print(numbers[10]); // Index out of range
  } on RangeError catch (e) {
    print('Range error: \${e.message}');
  } on FormatException catch (e) {
    print('Format error: \${e.message}');
  } catch (e) {
    print('Unknown error: \$e');
  }
}''';
  final String onKeywordOutput = '''Range error: Index out of range''';

  final String finallyTitle = 'Finally Block';
  final String finallyDesc =
      'The finally block always executes regardless of whether an exception occurred. It is used for cleanup operations.';
  final String finallyCode = '''void main() {
  try {
    print('Trying to parse...');
    int value = int.parse('not_a_number');
    print('Parsed: \$value');
  } catch (e) {
    print('Error: \$e');
  } finally {
    print('This always runs.');
  }
}''';
  final String finallyOutput = '''Trying to parse...
Error: FormatException: Invalid radix-10 number (at character 1)
This always runs.''';

  final String customExceptionTitle = 'Custom Exception';
  final String customExceptionDesc =
      'You can create your own exception classes by implementing the Exception interface.';
  final String customExceptionCode = '''class InsufficientFundsException implements Exception {
  final double amount;
  InsufficientFundsException(this.amount);

  @override
  String toString() => 'Insufficient funds: need \$amount more';
}

void withdraw(double balance, double amount) {
  if (amount > balance) {
    throw InsufficientFundsException(amount - balance);
  }
  print('Withdrew \$amount. Remaining: \${balance - amount}');
}

void main() {
  try {
    withdraw(100.0, 150.0);
  } on InsufficientFundsException catch (e) {
    print(e);
  }
}''';
  final String customExceptionOutput = '''Insufficient funds: need 50.0 more''';

  final List<String> tips = [
    'Use try-catch to handle exceptions gracefully.',
    'Use on to catch specific exception types.',
    'The finally block always runs — use it for resource cleanup.',
    'Create custom exceptions for domain-specific errors.',
    'Use throw to manually raise exceptions.',
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
      child: SideNavBarChildEnum.exception,
    );
    Get.find<AppBarController>().appBarTitle = SK.exception;
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
