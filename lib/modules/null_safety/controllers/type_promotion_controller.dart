import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TypePromotionController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'TYPE PROMOTION IN DART';
  final String intro =
      'Type promotion is a Dart null safety feature where the compiler automatically narrows a nullable type to a non-nullable type within a code block after a null check. This removes the need for explicit null assertions.';
  final String exampleTitle = 'Type Promotion Example';
  final String exampleCode = '''void printLength(String? text) {
  // Type promotion via null check
  if (text != null) {
    // text is promoted to String (non-nullable) here
    print(text.length);
  }
}

void greet(Object value) {
  // Type promotion via is-check
  if (value is String) {
    print(value.toUpperCase()); // value is promoted to String
  } else if (value is int) {
    print(value * 2); // value is promoted to int
  }
}

String describeValue(num? n) {
  if (n == null) return 'null value';
  // n is promoted to num (non-nullable) here
  return 'Value: \${n.toDouble()}';
}

void main() {
  printLength('Hello');
  printLength(null);

  greet('dart');
  greet(21);

  print(describeValue(3.14));
  print(describeValue(null));
}''';
  final String exampleOutput = '''5
DART
42
Value: 3.14
null value''';
  final List<String> tips = [
    'Type promotion happens automatically after null checks.',
    'Works with if-null checks, is-type checks, and assert statements.',
    'Promotes within the current scope only.',
    'Dart flow analysis tracks variable state across branches.',
    'Reassigning a variable resets its promoted type.',
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
      parent: SideNavBarParentEnum.nullSafety,
      child: SideNavBarChildEnum.typePromotions,
    );
    Get.find<AppBarController>().appBarTitle = SK.typePromotions;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
