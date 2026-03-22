import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForEachLoopController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FOR EACH LOOP IN DART';
  final String intro =
      'The forEach loop in Dart is used to iterate over each element of a collection. It is a functional-style approach that calls a callback function for every element in the collection.';

  final String forInTitle = 'For-In Loop';
  final String forInDesc =
      'The for-in loop is a cleaner way to iterate over a collection without needing an index.';
  final String forInCode = '''void main() {
  List<String> fruits = ['Apple', 'Banana', 'Cherry', 'Date'];

  for (String fruit in fruits) {
    print(fruit);
  }
}''';
  final String forInOutput = '''Apple
Banana
Cherry
Date''';

  final String forEachTitle = 'forEach() Method';
  final String forEachDesc =
      'The forEach() method is a built-in method on List, Set, and Map that takes a callback function.';
  final String forEachCode = '''void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  numbers.forEach((number) {
    print('Number: \$number');
  });
}''';
  final String forEachOutput = '''Number: 1
Number: 2
Number: 3
Number: 4
Number: 5''';

  final String mapForEachTitle = 'forEach on Map';
  final String mapForEachDesc =
      'You can use forEach on a Map to iterate over key-value pairs.';
  final String mapForEachCode = '''void main() {
  Map<String, int> scores = {
    'Alice': 95,
    'Bob': 87,
    'Charlie': 92,
  };

  scores.forEach((name, score) {
    print('\$name scored \$score points');
  });
}''';
  final String mapForEachOutput = '''Alice scored 95 points
Bob scored 87 points
Charlie scored 92 points''';

  final String arrowForEachTitle = 'forEach with Arrow Function';
  final String arrowForEachDesc =
      'When the callback has a single expression, you can use an arrow function.';
  final String arrowForEachCode = '''void main() {
  List<String> names = ['Alice', 'Bob', 'Charlie'];
  names.forEach((name) => print('Hello, \$name!'));
}''';
  final String arrowForEachOutput = '''Hello, Alice!
Hello, Bob!
Hello, Charlie!''';

  final List<String> tips = [
    'Use for-in when you need the element value only.',
    'Use forEach() for a more functional programming style.',
    'For-in allows break and continue; forEach() does not.',
    'forEach on Map gives you both key and value in the callback.',
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
      child: SideNavBarChildEnum.forEachLoop,
    );
    Get.find<AppBarController>().appBarTitle = SK.forEach;
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
