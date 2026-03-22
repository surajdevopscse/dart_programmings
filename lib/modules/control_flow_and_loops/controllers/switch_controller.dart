import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SwitchController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'SWITCH CASE IN DART';
  final String intro =
      'The switch statement in Dart is used when you need to compare a variable against multiple values. It is more readable than a long chain of if-else if statements when checking for equality.';

  final String basicSwitchTitle = 'Basic Switch Statement';
  final String basicSwitchDesc =
      'A switch statement evaluates an expression and matches its value against case labels. When a match is found, the corresponding code block is executed.';
  final String basicSwitchCode = '''void main() {
  String day = 'Monday';

  switch (day) {
    case 'Monday':
      print('Start of the work week!');
      break;
    case 'Friday':
      print('Last day of work!');
      break;
    case 'Saturday':
    case 'Sunday':
      print('Weekend!');
      break;
    default:
      print('Midweek day');
  }
}''';
  final String basicSwitchOutput = '''Start of the work week!''';

  final String intSwitchTitle = 'Switch with Integer';
  final String intSwitchDesc =
      'Switch statements work with integers, strings, and other constants. Here is an example with integer values.';
  final String intSwitchCode = '''void main() {
  int grade = 2;

  switch (grade) {
    case 1:
      print('Grade A - Excellent!');
      break;
    case 2:
      print('Grade B - Good!');
      break;
    case 3:
      print('Grade C - Average');
      break;
    default:
      print('Invalid grade');
  }
}''';
  final String intSwitchOutput = '''Grade B - Good!''';

  final String fallThroughTitle = 'Fall-through with Multiple Cases';
  final String fallThroughDesc =
      'You can stack multiple case labels to execute the same code for different values.';
  final String fallThroughCode = '''void main() {
  String month = 'April';

  switch (month) {
    case 'January':
    case 'March':
    case 'May':
    case 'July':
    case 'August':
    case 'October':
    case 'December':
      print('\$month has 31 days');
      break;
    case 'April':
    case 'June':
    case 'September':
    case 'November':
      print('\$month has 30 days');
      break;
    case 'February':
      print('\$month has 28 or 29 days');
      break;
    default:
      print('Invalid month');
  }
}''';
  final String fallThroughOutput = '''April has 30 days''';

  final List<String> tips = [
    'Always include a default case to handle unexpected values.',
    'Use break at the end of each case to prevent fall-through.',
    'Stack multiple cases when they share the same code block.',
    'Switch works best with int, String, and enum types.',
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
      child: SideNavBarChildEnum.switchCase,
    );
    Get.find<AppBarController>().appBarTitle = SK.switchCase;
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
