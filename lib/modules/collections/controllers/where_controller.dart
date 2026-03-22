import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WhereController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'WHERE IN DART';
  final String intro =
      'The where() method in Dart filters a collection and returns an Iterable containing only the elements that satisfy the given condition. It is similar to the filter() method in other languages.';

  final String basicWhereTitle = 'Basic where() Usage';
  final String basicWhereDesc =
      'Pass a predicate function to where() that returns true for elements you want to keep.';
  final String basicWhereCode = '''void main() {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  // Filter even numbers
  var evens = numbers.where((n) => n.isEven).toList();
  print('Evens: \$evens');

  // Filter numbers greater than 5
  var greaterThan5 = numbers.where((n) => n > 5).toList();
  print('Greater than 5: \$greaterThan5');

  // Multiple conditions
  var evenAndBig = numbers.where((n) => n.isEven && n > 4).toList();
  print('Even and > 4: \$evenAndBig');
}''';
  final String basicWhereOutput = '''Evens: [2, 4, 6, 8, 10]
Greater than 5: [6, 7, 8, 9, 10]
Even and > 4: [6, 8, 10]''';

  final String withStringsTitle = 'where() with Strings';
  final String withStringsDesc =
      'The where() method works with any collection type, including lists of strings.';
  final String withStringsCode = '''void main() {
  List<String> names = ['Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Frank'];

  // Names longer than 4 characters
  var longNames = names.where((n) => n.length > 4).toList();
  print('Long names: \$longNames');

  // Names starting with vowel
  var vowelNames = names.where((n) => 'AEIOUaeiou'.contains(n[0])).toList();
  print('Vowel names: \$vowelNames');
}''';
  final String withStringsOutput = '''Long names: [Alice, Charlie, David, Frank]
Vowel names: [Alice, Eve]''';

  final String withObjectsTitle = 'where() with Objects';
  final String withObjectsDesc =
      'Combine where() with custom objects for powerful data filtering.';
  final String withObjectsCode = '''class Student {
  String name;
  int grade;
  Student(this.name, this.grade);
}

void main() {
  List<Student> students = [
    Student('Alice', 92),
    Student('Bob', 75),
    Student('Charlie', 85),
    Student('Diana', 60),
    Student('Eve', 95),
  ];

  var topStudents = students
      .where((s) => s.grade >= 85)
      .map((s) => '\${s.name}: \${s.grade}')
      .toList();

  print('Top students:');
  topStudents.forEach(print);
}''';
  final String withObjectsOutput = '''Top students:
Alice: 92
Charlie: 85
Eve: 95''';

  final List<String> tips = [
    'where() returns a lazy Iterable — call toList() to materialize it.',
    'Chain where() with map() and other methods for powerful transformations.',
    'Use firstWhere() to get the first matching element.',
    'Use any() to check if any element matches a condition.',
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
      child: SideNavBarChildEnum.whereInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.whereInDart;
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
