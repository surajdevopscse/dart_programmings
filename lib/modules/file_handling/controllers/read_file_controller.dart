import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadFileController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'READ FILE IN DART';
  final String intro =
      "File handling in Dart uses the dart:io library. Reading files is a common operation when working with configuration files, data files, or logs. Import 'dart:io' to use file operations.";

  final String readAsStringTitle = 'Read File as String';
  final String readAsStringDesc =
      'Use File.readAsStringSync() to read the entire file content as a String synchronously.';
  final String readAsStringCode = '''import 'dart:io';

void main() {
  // Create a file for demonstration
  File file = File('example.txt');
  file.writeAsStringSync('Hello, Dart!\\nThis is file handling.');

  // Read the entire file as a string
  String content = file.readAsStringSync();
  print('File content:');
  print(content);
}''';
  final String readAsStringOutput = '''File content:
Hello, Dart!
This is file handling.''';

  final String readLinesTitle = 'Read File Line by Line';
  final String readLinesDesc =
      'Use readAsLinesSync() to read a file as a list of lines, or use async variants for non-blocking reads.';
  final String readLinesCode = '''import 'dart:io';

void main() {
  File file = File('example.txt');
  file.writeAsStringSync('Line 1\\nLine 2\\nLine 3\\nLine 4');

  // Read as list of lines
  List<String> lines = file.readAsLinesSync();
  for (int i = 0; i < lines.length; i++) {
    print('Line \${i + 1}: \${lines[i]}');
  }
  print('Total lines: \${lines.length}');
}''';
  final String readLinesOutput = '''Line 1: Line 1
Line 2: Line 2
Line 3: Line 3
Line 4: Line 4
Total lines: 4''';

  final String asyncReadTitle = 'Async File Read';
  final String asyncReadDesc =
      'For better performance in real applications, use async methods to avoid blocking the main thread.';
  final String asyncReadCode = '''import 'dart:io';

Future<void> main() async {
  File file = File('data.txt');
  await file.writeAsString('Async content here.');

  // Async read
  String content = await file.readAsString();
  print('Async content: \$content');

  // Check if file exists
  bool exists = await file.exists();
  print('File exists: \$exists');
}''';
  final String asyncReadOutput = '''Async content: Async content here.
File exists: true''';

  final List<String> tips = [
    "Always import 'dart:io' for file operations.",
    'Use async versions (readAsString()) for better app performance.',
    'Check file.exists() before reading to avoid exceptions.',
    'Handle FileSystemException for robust error handling.',
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
      parent: SideNavBarParentEnum.fileHandling,
      child: SideNavBarChildEnum.readFile,
    );
    Get.find<AppBarController>().appBarTitle = SK.readFile;
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
