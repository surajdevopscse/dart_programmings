import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsyncProgrammingController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ASYNC PROGRAMMING IN DART';
  final String intro =
      'Asynchronous programming allows your program to perform long-running tasks without blocking the main thread. Dart provides Future, async/await, Stream, and Isolate to handle async operations effectively.';
  final String exampleTitle = 'Async Programming Overview';
  final String exampleCode = '''import 'dart:async';

// Simulating an async network request
Future<String> fetchData() async {
  await Future.delayed(Duration(seconds: 2));
  return 'Data from server';
}

// Simulating a stream of events
Stream<int> countStream(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i;
  }
}

void main() async {
  print('Fetching data...');
  String result = await fetchData();
  print(result);

  print('Counting:');
  await for (int value in countStream(3)) {
    print(value);
  }
  print('Done!');
}''';
  final String exampleOutput = '''Fetching data...
Data from server
Counting:
1
2
3
Done!''';
  final List<String> tips = [
    'Use async/await to write asynchronous code that reads like synchronous code.',
    'Future represents a single async computation.',
    'Stream represents a sequence of async events.',
    'Isolates provide true parallelism for CPU-intensive work.',
    'Always handle errors in async code with try/catch or .catchError().',
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
      child: SideNavBarChildEnum.asyncProgramming,
    );
    Get.find<AppBarController>().appBarTitle = SK.asyncProgramming;
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
