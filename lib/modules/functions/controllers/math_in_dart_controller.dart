import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MathInDartController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'MATH IN DART';
  final String intro =
      "Dart provides the dart:math library for mathematical operations including square root, power, trigonometry, random numbers, and more. Import it with import 'dart:math';";

  final String basicMathTitle = 'Basic Math Operations';
  final String basicMathDesc =
      'Dart has built-in arithmetic operators and a rich set of math functions in dart:math.';
  final String basicMathCode = '''import 'dart:math';

void main() {
  print(sqrt(16));        // Square root
  print(pow(2, 10));      // 2 to the power of 10
  print(max(10, 20));     // Maximum of two numbers
  print(min(10, 20));     // Minimum of two numbers
  print(log(e));          // Natural log of e
  print(pi);              // Value of pi
}''';
  final String basicMathOutput = '''4.0
1024.0
20
10
1.0
3.141592653589793''';

  final String trigTitle = 'Trigonometric Functions';
  final String trigDesc =
      'The dart:math library includes sin, cos, tan and their inverse functions.';
  final String trigCode = '''import 'dart:math';

void main() {
  double angle = pi / 4; // 45 degrees in radians
  print('sin(45°): \${sin(angle).toStringAsFixed(4)}');
  print('cos(45°): \${cos(angle).toStringAsFixed(4)}');
  print('tan(45°): \${tan(angle).toStringAsFixed(4)}');
}''';
  final String trigOutput = '''sin(45°): 0.7071
cos(45°): 0.7071
tan(45°): 1.0000''';

  final String randomTitle = 'Random Numbers';
  final String randomDesc =
      'Use the Random class from dart:math to generate random integers and doubles.';
  final String randomCode = '''import 'dart:math';

void main() {
  Random random = Random();

  // Random integer between 0 and 9
  for (int i = 0; i < 5; i++) {
    print('Random int: \${random.nextInt(10)}');
  }

  // Random double between 0.0 and 1.0
  print('Random double: \${random.nextDouble().toStringAsFixed(4)}');

  // Random bool
  print('Random bool: \${random.nextBool()}');
}''';
  final String randomOutput = '''Random int: 3
Random int: 7
Random int: 1
Random int: 9
Random int: 4
Random double: 0.6823
Random bool: true''';

  final List<String> tips = [
    "Always import 'dart:math' to use math functions.",
    'Angles in trigonometric functions are in radians, not degrees.',
    'Use Random(seed) for reproducible random sequences.',
    'Use num.abs() for absolute value instead of dart:math.',
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
      child: SideNavBarChildEnum.mathInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.mathInDart;
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
