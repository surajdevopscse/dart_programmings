import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NullSafetyController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'NULL SAFETY IN DART';
  final String intro =
      'Null safety is a feature in Dart that helps you avoid null reference errors. With null safety, variables are non-nullable by default — you must explicitly opt in to allow null values using the ? operator.';
  final String exampleTitle = 'Null Safety Example';
  final String exampleCode = '''void main() {
  // Non-nullable variable — cannot be null
  String name = 'Alice';

  // Nullable variable — can be null
  String? nickname;
  print(nickname); // null

  nickname = 'Ali';
  print(nickname); // Ali

  // Null-aware operators
  String display = nickname ?? 'No nickname';
  print(display);

  // Null assertion operator
  String? maybeNull = 'Hello';
  print(maybeNull!.length); // 5

  // Conditional access
  String? city;
  print(city?.toUpperCase()); // null (no error)
}''';
  final String exampleOutput = '''null
Ali
Ali
5
null''';
  final List<String> tips = [
    'Variables are non-nullable by default in Dart null safety.',
    'Use ? to declare nullable types (e.g., String?).',
    'Use ?? for null-coalescing (provide a default if null).',
    'Use ! to assert a value is non-null (throws if null).',
    'Use ?. for safe member access on nullable types.',
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
      child: SideNavBarChildEnum.nullSafety,
    );
    Get.find<AppBarController>().appBarTitle = SK.nullSafety;
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
