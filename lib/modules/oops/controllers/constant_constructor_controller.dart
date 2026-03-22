import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConstantConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CONSTANT CONSTRUCTOR IN DART';
  final String intro = 'A constant constructor creates compile-time constant objects. Use the const keyword for the constructor and declare all fields as final. Constant objects are immutable and can improve performance.';
  final String exampleTitle = 'Constant Constructor Example';
  final String exampleCode = '''class ImmutablePoint {
  final double x;
  final double y;

  const ImmutablePoint(this.x, this.y);

  double get distanceFromOrigin => (x * x + y * y);

  @override
  String toString() => 'Point(\$x, \$y)';
}

void main() {
  const ImmutablePoint p1 = ImmutablePoint(3, 4);
  const ImmutablePoint p2 = ImmutablePoint(3, 4);

  print(p1);
  print('Distance squared: \${p1.distanceFromOrigin}');

  // Identical objects with const
  print('Identical: \${identical(p1, p2)}');
}''';
  final String exampleOutput = '''Point(3.0, 4.0)
Distance squared: 25.0
Identical: true''';
  final List<String> tips = [
    'All fields in a const class must be final.',
    'const objects with the same values are the same instance.',
    'Use const constructors for value objects like coordinates, colors.',
    'const objects are more memory-efficient for repeated use.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.constantContructor);
    Get.find<AppBarController>().appBarTitle = SK.constantContructor;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
