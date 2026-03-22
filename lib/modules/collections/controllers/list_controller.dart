import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'LIST IN DART';
  final String intro =
      'A List in Dart is an ordered collection of items. Lists can hold items of any type and allow duplicates. They are zero-indexed, meaning the first element is at index 0.';

  final String creatingListTitle = 'Creating a List';
  final String creatingListDesc =
      'You can create a list using the literal syntax [] or the List class.';
  final String creatingListCode = '''void main() {
  // Fixed-length list
  List<int> numbers = [1, 2, 3, 4, 5];
  print(numbers);

  // Dynamic list
  List<String> fruits = [];
  fruits.add('Apple');
  fruits.add('Banana');
  fruits.add('Cherry');
  print(fruits);

  // List with specified length
  List<int> zeros = List.filled(5, 0);
  print(zeros);
}''';
  final String creatingListOutput = '''[1, 2, 3, 4, 5]
[Apple, Banana, Cherry]
[0, 0, 0, 0, 0]''';

  final String methodsTitle = 'Common List Methods';
  final String methodsDesc =
      'Dart lists have many built-in methods for adding, removing, and querying elements.';
  final String methodsCode = '''void main() {
  List<int> nums = [3, 1, 4, 1, 5, 9, 2, 6];

  print('Length: \${nums.length}');
  print('First: \${nums.first}');
  print('Last: \${nums.last}');
  print('Contains 5: \${nums.contains(5)}');
  print('Index of 4: \${nums.indexOf(4)}');

  nums.sort();
  print('Sorted: \$nums');

  nums.remove(1); // removes first occurrence
  print('After remove: \$nums');

  nums.insert(0, 0);
  print('After insert: \$nums');
}''';
  final String methodsOutput = '''Length: 8
First: 3
Last: 6
Contains 5: true
Index of 4: 2
Sorted: [1, 1, 2, 3, 4, 5, 6, 9]
After remove: [1, 2, 3, 4, 5, 6, 9]
After insert: [0, 1, 2, 3, 4, 5, 6, 9]''';

  final String transformTitle = 'List Transformations';
  final String transformDesc =
      'Use map(), where(), and reduce() to transform and process lists.';
  final String transformCode = '''void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  var squared = numbers.map((n) => n * n).toList();
  print('Squared: \$squared');

  var evens = numbers.where((n) => n.isEven).toList();
  print('Evens: \$evens');

  var total = numbers.reduce((a, b) => a + b);
  print('Total: \$total');

  // sublist
  var sub = numbers.sublist(2, 5);
  print('Sublist [2,5): \$sub');
}''';
  final String transformOutput = '''Squared: [1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
Evens: [2, 4, 6, 8, 10]
Total: 55
Sublist [2,5): [3, 4, 5]''';

  final List<String> tips = [
    'Lists are zero-indexed — the first element is at index 0.',
    'Use List<T> to specify the type of elements for type safety.',
    'Use add() for single elements and addAll() for multiple elements.',
    'The spread operator (...) is great for combining lists.',
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
      child: SideNavBarChildEnum.listInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.listInDart;
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
