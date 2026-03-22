import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'MAP IN DART';
  final String intro =
      'A Map in Dart is a collection of key-value pairs. Each key is unique, and each key maps to exactly one value. Maps are useful for storing structured data.';

  final String creatingMapTitle = 'Creating a Map';
  final String creatingMapDesc =
      'You can create a Map using map literals {} with key: value syntax, or with the Map() constructor.';
  final String creatingMapCode = '''void main() {
  // Map literal
  Map<String, int> ages = {
    'Alice': 30,
    'Bob': 25,
    'Charlie': 35,
  };
  print(ages);

  // Accessing values
  print('Alice age: \${ages['Alice']}');

  // Adding entry
  ages['Diana'] = 28;
  print('After adding Diana: \$ages');

  // Removing entry
  ages.remove('Bob');
  print('After removing Bob: \$ages');
}''';
  final String creatingMapOutput = '''{Alice: 30, Bob: 25, Charlie: 35}
Alice age: 30
After adding Diana: {Alice: 30, Bob: 25, Charlie: 35, Diana: 28}
After removing Bob: {Alice: 30, Charlie: 35, Diana: 28}''';

  final String methodsTitle = 'Common Map Methods';
  final String methodsDesc =
      'Maps provide methods to check keys, values, and iterate over entries.';
  final String methodsCode = '''void main() {
  Map<String, double> prices = {
    'Apple': 1.5,
    'Banana': 0.75,
    'Cherry': 3.0,
  };

  print('Keys: \${prices.keys.toList()}');
  print('Values: \${prices.values.toList()}');
  print('Length: \${prices.length}');
  print('Contains Apple: \${prices.containsKey('Apple')}');
  print('Contains 1.5: \${prices.containsValue(1.5)}');

  // Iterating
  prices.forEach((fruit, price) {
    print('\$fruit costs \\\$\$price');
  });
}''';
  final String methodsOutput = '''Keys: [Apple, Banana, Cherry]
Values: [1.5, 0.75, 3.0]
Length: 3
Contains Apple: true
Contains 1.5: true
Apple costs \$1.5
Banana costs \$0.75
Cherry costs \$3.0''';

  final List<String> tips = [
    'Keys in a Map must be unique; adding an existing key updates its value.',
    'Use containsKey() before accessing to avoid null values.',
    'The putIfAbsent() method adds an entry only if the key does not exist.',
    'Use Map.from() to create a copy of a map.',
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
      child: SideNavBarChildEnum.mapInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.mapInDart;
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
