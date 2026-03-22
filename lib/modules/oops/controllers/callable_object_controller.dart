import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CallableObjectController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CALLABLE OBJECT IN DART';
  final String intro =
      'In Dart, you can make instances of a class callable like functions by implementing the call() method. This is useful when an object has a primary action that makes sense to invoke like a function.';
  final String exampleTitle = 'Callable Object Example';
  final String exampleCode = '''class Multiplier {
  final int factor;
  Multiplier(this.factor);

  int call(int value) => value * factor;
}

class Greeter {
  final String greeting;
  Greeter(this.greeting);

  String call(String name) => '\$greeting, \$name!';
}

void main() {
  Multiplier triple = Multiplier(3);
  print(triple(5));   // Calls triple.call(5)
  print(triple(10));

  Greeter hello = Greeter('Hello');
  print(hello('Alice'));
  print(hello('Bob'));

  // Use as a function
  List<int> numbers = [1, 2, 3, 4, 5];
  List<int> tripled = numbers.map(triple).toList();
  print('Tripled: \$tripled');
}''';
  final String exampleOutput = '''15
30
Hello, Alice!
Hello, Bob!
Tripled: [3, 6, 9, 12, 15]''';
  final List<String> tips = [
    'Implement call() to make objects callable like functions.',
    'Callable objects can maintain state between calls.',
    'They can be used anywhere a function of the same signature is expected.',
    'This is useful for strategy patterns and configurable behaviors.',
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
      parent: SideNavBarParentEnum.oppsInDart,
      child: SideNavBarChildEnum.callableObject,
    );
    Get.find<AppBarController>().appBarTitle = SK.callableObject;
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
