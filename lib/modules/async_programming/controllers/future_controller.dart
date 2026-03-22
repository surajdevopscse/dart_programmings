import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FutureController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FUTURE IN DART';
  final String intro =
      'A Future in Dart represents a value or error that will be available at some time in the future. It is the foundation of asynchronous programming in Dart, allowing you to run operations concurrently without blocking.';
  final String exampleTitle = 'Future Example';
  final String exampleCode = '''Future<int> calculateSquare(int n) {
  return Future.delayed(Duration(seconds: 1), () => n * n);
}

Future<String> getUserName(int id) async {
  await Future.delayed(Duration(milliseconds: 500));
  if (id == 1) return 'Alice';
  throw Exception('User not found');
}

void main() async {
  // Using await
  int result = await calculateSquare(5);
  print('Square: \$result');

  // Using then/catchError
  calculateSquare(7)
    .then((value) => print('Square: \$value'))
    .catchError((e) => print('Error: \$e'));

  // Error handling with try/catch
  try {
    String name = await getUserName(1);
    print('User: \$name');
    await getUserName(99);
  } catch (e) {
    print('Caught: \$e');
  }

  // Future.wait — run multiple futures concurrently
  List<int> results = await Future.wait([
    calculateSquare(2),
    calculateSquare(3),
    calculateSquare(4),
  ]);
  print('Results: \$results');
}''';
  final String exampleOutput = '''Square: 25
User: Alice
Square: 49
Caught: Exception: User not found
Results: [4, 9, 16]''';
  final List<String> tips = [
    'Use await to get the result of a Future in async functions.',
    'Use Future.wait() to run multiple Futures concurrently.',
    'Handle errors with try/catch or .catchError().',
    'Future.value() creates an already-completed Future.',
    'Future.error() creates a Future that completes with an error.',
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
      parent: SideNavBarParentEnum.asyncProgram,
      child: SideNavBarChildEnum.futureInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.futureInDart;
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
