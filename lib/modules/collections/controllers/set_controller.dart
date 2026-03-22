import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SetController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'SET IN DART';
  final String intro =
      'A Set in Dart is an unordered collection of unique items. Unlike a List, a Set does not allow duplicate values. Sets are useful when you need to store distinct elements.';

  final String creatingSetTitle = 'Creating a Set';
  final String creatingSetDesc =
      'You can create a Set using curly braces {} or the Set() constructor.';
  final String creatingSetCode = '''void main() {
  // Creating a set literal
  Set<int> numbers = {1, 2, 3, 4, 5};
  print(numbers);

  // Adding duplicate - ignored
  numbers.add(3);
  numbers.add(6);
  print(numbers);

  // Creating empty set
  Set<String> colors = {};
  colors.addAll(['Red', 'Green', 'Blue', 'Red']); // Red added only once
  print(colors);
}''';
  final String creatingSetOutput = '''{1, 2, 3, 4, 5}
{1, 2, 3, 4, 5, 6}
{Red, Green, Blue}''';

  final String setOpsTitle = 'Set Operations';
  final String setOpsDesc =
      'Dart sets support mathematical set operations: union, intersection, and difference.';
  final String setOpsCode = '''void main() {
  Set<int> setA = {1, 2, 3, 4, 5};
  Set<int> setB = {4, 5, 6, 7, 8};

  // Union - all elements from both
  print('Union: \${setA.union(setB)}');

  // Intersection - common elements
  print('Intersection: \${setA.intersection(setB)}');

  // Difference - in A but not B
  print('A - B: \${setA.difference(setB)}');

  // Check containment
  print('Contains 3: \${setA.contains(3)}');
  print('Is subset: \${setA.containsAll({1, 2})}');
}''';
  final String setOpsOutput = '''Union: {1, 2, 3, 4, 5, 6, 7, 8}
Intersection: {4, 5}
A - B: {1, 2, 3}
Contains 3: true
Is subset: true''';

  final List<String> tips = [
    'Sets do not maintain insertion order (use LinkedHashSet for ordered sets).',
    'Duplicates are automatically ignored when adding to a Set.',
    'Sets are more efficient than Lists for membership checking (contains()).',
    'Use toSet() to convert a List to a Set to remove duplicates.',
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
      parent: SideNavBarParentEnum.collections,
      child: SideNavBarChildEnum.setInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.setInDart;
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
