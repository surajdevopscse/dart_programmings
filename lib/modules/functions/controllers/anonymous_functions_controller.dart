import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnonymousFunctionsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ANONYMOUS FUNCTIONS IN DART';
  final String intro =
      'Anonymous functions (also called lambdas or closures) are functions without a name. They can be assigned to variables, passed as arguments, or returned from other functions.';

  final String basicTitle = 'Basic Anonymous Function';
  final String basicDesc =
      'An anonymous function is defined inline using the function body syntax, without a function name.';
  final String basicCode = '''void main() {
  // Assigning anonymous function to a variable
  var multiply = (int a, int b) {
    return a * b;
  };

  print(multiply(4, 5));
  print(multiply(3, 7));
}''';
  final String basicOutput = '''20
21''';

  final String asArgumentTitle = 'Functions as Arguments';
  final String asArgumentDesc =
      'Anonymous functions are frequently passed as arguments to other functions like map, where, and sort.';
  final String asArgumentCode = '''void main() {
  List<int> numbers = [1, 2, 3, 4, 5];

  // Using anonymous function with map
  var doubled = numbers.map((n) {
    return n * 2;
  }).toList();
  print('Doubled: \$doubled');

  // Using anonymous function with where (filter)
  var evens = numbers.where((n) => n % 2 == 0).toList();
  print('Evens: \$evens');

  // Using anonymous function with sort
  List<String> names = ['Charlie', 'Alice', 'Bob'];
  names.sort((a, b) => a.compareTo(b));
  print('Sorted: \$names');
}''';
  final String asArgumentOutput = '''Doubled: [2, 4, 6, 8, 10]
Evens: [2, 4]
Sorted: [Alice, Bob, Charlie]''';

  final String closureTitle = 'Closures';
  final String closureDesc =
      'A closure is an anonymous function that captures variables from its enclosing scope.';
  final String closureCode = '''Function makeAdder(int addBy) {
  return (int n) => n + addBy;
}

void main() {
  var addFive = makeAdder(5);
  var addTen = makeAdder(10);

  print(addFive(3));   // 3 + 5
  print(addTen(3));    // 3 + 10
  print(addFive(20));  // 20 + 5
}''';
  final String closureOutput = '''8
13
25''';

  final List<String> tips = [
    'Anonymous functions are ideal as short-lived callbacks.',
    'Closures capture the surrounding scope, not just copies of values.',
    'Use arrow functions (=>) for single-expression anonymous functions.',
    'Store reused anonymous functions in variables for clarity.',
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
      child: SideNavBarChildEnum.anonymousFunctions,
    );
    Get.find<AppBarController>().appBarTitle = SK.anonymousFunctions;
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
