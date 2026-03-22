import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetterController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'GETTER IN DART';
  final String intro = 'A getter is a special method that reads a computed or private field. Use the get keyword to define a getter. Getters look like property accesses but execute code when accessed.';
  final String exampleTitle = 'Getter Example';
  final String exampleCode = '''class Circle {
  double _radius;

  Circle(this._radius);

  double get radius => _radius;
  double get area => 3.14159 * _radius * _radius;
  double get circumference => 2 * 3.14159 * _radius;
  String get description => 'Circle with radius \$_radius';

  bool get isLarge => _radius > 10;
}

void main() {
  Circle c = Circle(7.5);
  print('Radius: \${c.radius}');
  print('Area: \${c.area.toStringAsFixed(2)}');
  print('Circumference: \${c.circumference.toStringAsFixed(2)}');
  print(c.description);
  print('Is large: \${c.isLarge}');
}''';
  final String exampleOutput = '''Radius: 7.5
Area: 176.71
Circumference: 47.12
Circle with radius 7.5
Is large: false''';
  final List<String> tips = [
    'Getters provide read access to computed properties.',
    'They look like field access to the caller (no parentheses needed).',
    'Use getters to compute values from other fields.',
    'Arrow syntax (=>) is perfect for simple getters.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.getter);
    Get.find<AppBarController>().appBarTitle = SK.getter;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
