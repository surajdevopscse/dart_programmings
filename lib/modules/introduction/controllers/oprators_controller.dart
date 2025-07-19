import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OpratorsController extends GetxController {
  final String title = 'OPERATORS IN DART';
  final String intro =
      'Operators are used to perform mathematical and logical operations on variables. Each operation in Dart uses a symbol called the operator to denote the type of operation it performs.';
  final String beforeLearning =
      'Before learning operators in Dart, you must understand the following:';
  final String operands =
      'Operands: The data on which operations are performed. For example, in 5 + 3, 5 and 3 are operands.';
  final String operatorText =
      'Operator: The symbol that tells what operation to perform. In 5 + 3, "+" is the operator.';
  final String typesOfOperators = 'Types of Operators in Dart:';
  final String typesList =
      '1. Arithmetic Operators\n2. Assignment Operators\n3. Relational Operators\n4. Logical Operators\n5. Type Test Operators\n6. Bitwise Operators\n7. Conditional Operators';

  // Arithmetic Operators
  final String arithmeticTitle = '1. Arithmetic Operators';
  final String arithmeticDesc =
      'These are used to perform mathematical operations like addition, subtraction, multiplication, etc.';
  final String arithmeticExample = '''
void main() {
  int a = 10;
  int b = 3;
  print(a + b); // 13 (Addition)
  print(a - b); // 7  (Subtraction)
  print(a * b); // 30 (Multiplication)
  print(a / b); // 3.333... (Division)
  print(a % b); // 1  (Modulus)
  print(a ~/ b); // 3 (Integer Division)
}
''';

  // Assignment Operators
  final String assignmentTitle = '2. Assignment Operators';
  final String assignmentDesc =
      'Used to assign values to variables. Example: =, +=, -=, *=, /=, %=';
  final String assignmentExample = '''
void main() {
  int a = 5;
  a += 3; // a = a + 3 => 8
  a -= 2; // a = a - 2 => 6
  a *= 2; // a = a * 2 => 12
  a ~/= 3; // a = a ~/ 3 => 4
  print(a);
}
''';

  // Relational Operators
  final String relationalTitle = '3. Relational Operators';
  final String relationalDesc =
      'Used to compare two values. Example: ==, !=, >, <, >=, <=';
  final String relationalExample = '''
void main() {
  int x = 10;
  int y = 20;
  print(x == y); // false
  print(x != y); // true
  print(x > y);  // false
  print(x < y);  // true
  print(x >= y); // false
  print(x <= y); // true
}
''';

  // Logical Operators
  final String logicalTitle = '4. Logical Operators';
  final String logicalDesc =
      'Used to combine two or more conditions. Example: && (AND), || (OR), ! (NOT)';
  final String logicalExample = '''
void main() {
  bool a = true;
  bool b = false;
  print(a && b); // false
  print(a || b); // true
  print(!a);     // false
}
''';

  // Type Test Operators
  final String typeTestTitle = '5. Type Test Operators';
  final String typeTestDesc =
      'Used to check the type of an object. Example: is, is!';
  final String typeTestExample = '''
void main() {
  var name = 'Dart';
  print(name is String); // true
  print(name is! int);  // true
}
''';

  // Bitwise Operators
  final String bitwiseTitle = '6. Bitwise Operators';
  final String bitwiseDesc =
      'Used to perform bit-level operations. Example: &, |, ^, ~, <<, >>';
  final String bitwiseExample = '''
void main() {
  int a = 5; // 0101
  int b = 3; // 0011
  print(a & b); // 1 (0001)
  print(a | b); // 7 (0111)
  print(a ^ b); // 6 (0110)
  print(~a);    // -6 (inverts bits)
  print(a << 1); // 10 (1010)
  print(a >> 1); // 2 (0010)
}
''';

  // Conditional Operators
  final String conditionalTitle = '7. Conditional Operators';
  final String conditionalDesc =
      'Used to make decisions in code. Example: condition ? expr1 : expr2, expr1 ?? expr2';
  final String conditionalExample = '''
void main() {
  int? a;
  int b = a ?? 10; // If a is null, use 10
  print(b); // 10

  int x = 5;
  String result = (x > 0) ? 'Positive' : 'Negative';
  print(result); // Positive
}
''';

  // Summary
  final String summaryTitle = 'Summary';
  final String summaryDesc =
      'Operators in Dart make it easy to perform operations on variables and values. Understanding them is essential for writing effective Dart code.';

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
