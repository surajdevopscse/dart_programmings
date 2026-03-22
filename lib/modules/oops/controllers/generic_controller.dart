import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GenericController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'GENERICS IN DART';
  final String intro = 'Generics allow you to write type-safe code that works with different types. Use type parameters (like <T>) to create classes, methods, and functions that work with any type while maintaining type safety.';
  final String exampleTitle = 'Generics Example';
  final String exampleCode = '''class Stack<T> {
  final List<T> _items = [];

  void push(T item) {
    _items.add(item);
    print('Pushed: \$item');
  }

  T pop() {
    if (_items.isEmpty) throw Exception('Stack is empty');
    T item = _items.removeLast();
    print('Popped: \$item');
    return item;
  }

  T get top => _items.last;
  bool get isEmpty => _items.isEmpty;
  int get size => _items.length;
}

T max<T extends Comparable>(T a, T b) => a.compareTo(b) > 0 ? a : b;

void main() {
  Stack<int> intStack = Stack<int>();
  intStack.push(1);
  intStack.push(2);
  intStack.push(3);
  intStack.pop();
  print('Top: \${intStack.top}');

  print(max(10, 20));
  print(max('apple', 'banana'));
}''';
  final String exampleOutput = '''Pushed: 1
Pushed: 2
Pushed: 3
Popped: 3
Top: 2
20
banana''';
  final List<String> tips = [
    'Generics provide type safety at compile time.',
    'Use T, E, K, V as conventional type parameter names.',
    'Use extends to constrain type parameters (e.g., <T extends num>).',
    'Built-in collections like List<T> and Map<K,V> use generics.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.generic);
    Get.find<AppBarController>().appBarTitle = SK.generic;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
