import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FunctionParameterController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FUNCTION PARAMETERS IN DART';
  final String intro =
      'Dart functions support multiple types of parameters: required positional, optional positional, named, and default parameters. Understanding them helps write flexible, readable APIs.';

  final String requiredTitle = 'Required Positional Parameters';
  final String requiredDesc =
      'These are the standard parameters that must be provided when calling the function.';
  final String requiredCode = '''void describe(String name, int age) {
  print('\$name is \$age years old.');
}

void main() {
  describe('Alice', 30);
  describe('Bob', 25);
}''';
  final String requiredOutput = '''Alice is 30 years old.
Bob is 25 years old.''';

  final String optionalTitle = 'Optional Positional Parameters';
  final String optionalDesc =
      'Wrap optional positional parameters in square brackets []. They can have default values.';
  final String optionalCode = '''void greet(String name, [String greeting = 'Hello']) {
  print('\$greeting, \$name!');
}

void main() {
  greet('Alice');
  greet('Bob', 'Hi');
  greet('Charlie', 'Good morning');
}''';
  final String optionalOutput = '''Hello, Alice!
Hi, Bob!
Good morning, Charlie!''';

  final String namedTitle = 'Named Parameters';
  final String namedDesc =
      'Named parameters are wrapped in curly braces {}. They can be optional or required using the required keyword.';
  final String namedCode = '''void createUser({
  required String name,
  required String email,
  int age = 18,
  String role = 'user',
}) {
  print('Name: \$name');
  print('Email: \$email');
  print('Age: \$age');
  print('Role: \$role');
  print('---');
}

void main() {
  createUser(name: 'Alice', email: 'alice@example.com', age: 25);
  createUser(name: 'Bob', email: 'bob@example.com', role: 'admin');
}''';
  final String namedOutput = '''Name: Alice
Email: alice@example.com
Age: 25
Role: user
---
Name: Bob
Email: bob@example.com
Age: 18
Role: admin
---''';

  final List<String> tips = [
    'Use required named parameters for critical inputs.',
    'Provide sensible default values for optional parameters.',
    'Named parameters improve code readability at the call site.',
    'Mix positional and named parameters carefully to avoid confusion.',
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
      child: SideNavBarChildEnum.functionParameter,
    );
    Get.find<AppBarController>().appBarTitle = SK.functionParameter;
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
