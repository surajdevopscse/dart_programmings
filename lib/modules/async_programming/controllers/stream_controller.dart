import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DartStreamController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'STREAM IN DART';
  final String intro =
      'A Stream in Dart is a sequence of asynchronous events. It is like a pipe through which data flows over time. Streams are used for handling real-time data such as user events, file reads, or network data.';
  final String exampleTitle = 'Stream Example';
  final String exampleCode = '''import 'dart:async';

// Single-subscription stream
Stream<int> timedCounter(int max) async* {
  for (int i = 1; i <= max; i++) {
    await Future.delayed(Duration(milliseconds: 200));
    yield i;
  }
}

// Broadcast stream (multiple listeners)
void broadcastExample() {
  StreamController<String> controller = StreamController<String>.broadcast();

  controller.stream.listen((data) => print('Listener 1: \$data'));
  controller.stream.listen((data) => print('Listener 2: \$data'));

  controller.add('Hello');
  controller.add('World');
  controller.close();
}

void main() async {
  // Listen to stream
  await for (int value in timedCounter(4)) {
    print('Count: \$value');
  }

  // Stream transformations
  Stream<int> numbers = Stream.fromIterable([1, 2, 3, 4, 5]);
  await numbers
    .where((n) => n.isOdd)
    .map((n) => n * n)
    .forEach((n) => print('Odd square: \$n'));

  broadcastExample();
}''';
  final String exampleOutput = '''Count: 1
Count: 2
Count: 3
Count: 4
Odd square: 1
Odd square: 9
Odd square: 25
Listener 1: Hello
Listener 2: Hello
Listener 1: World
Listener 2: World''';
  final List<String> tips = [
    'Use async* and yield to create streams with generators.',
    'Single-subscription streams can only have one listener.',
    'Use broadcast() streams for multiple listeners.',
    'Use StreamController to manually control a stream.',
    'Streams support functional transformations like map, where, and expand.',
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
      child: SideNavBarChildEnum.streamInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.streamInDart;
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
