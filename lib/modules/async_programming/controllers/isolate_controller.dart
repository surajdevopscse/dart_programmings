import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IsolateController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ISOLATE IN DART';
  final String intro =
      'Dart is single-threaded, but Isolates provide true parallelism by running code in separate memory spaces. Unlike threads, Isolates do not share memory and communicate only via message passing, making them safe and efficient.';
  final String exampleTitle = 'Isolate Example';
  final String exampleCode = '''import 'dart:isolate';

// Function to run in a separate isolate
void heavyComputation(SendPort sendPort) {
  int sum = 0;
  for (int i = 0; i < 1000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

Future<void> runWithIsolate() async {
  ReceivePort receivePort = ReceivePort();

  Isolate isolate = await Isolate.spawn(
    heavyComputation,
    receivePort.sendPort,
  );

  int result = await receivePort.first as int;
  print('Sum computed in isolate: \$result');

  isolate.kill(priority: Isolate.immediate);
  receivePort.close();
}

// Simpler approach with Isolate.run (Dart 2.19+)
Future<void> runSimple() async {
  int result = await Isolate.run(() {
    int sum = 0;
    for (int i = 0; i < 100; i++) sum += i;
    return sum;
  });
  print('Simple isolate result: \$result');
}

void main() async {
  print('Main isolate started.');
  await runWithIsolate();
  await runSimple();
  print('Main isolate done.');
}''';
  final String exampleOutput = '''Main isolate started.
Sum computed in isolate: 499999500000
Simple isolate result: 4950
Main isolate done.''';
  final List<String> tips = [
    'Isolates run in separate memory — no shared state.',
    'Communication happens via SendPort and ReceivePort.',
    'Use Isolate.run() for a simple fire-and-forget computation.',
    'Use Isolates for CPU-intensive work to avoid blocking the UI.',
    'Spawned isolates must be killed when no longer needed.',
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
      child: SideNavBarChildEnum.isolate,
    );
    Get.find<AppBarController>().appBarTitle = SK.isolate;
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
