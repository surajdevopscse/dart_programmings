import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WriteFileController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'WRITE FILE IN DART';
  final String intro =
      "Writing files in Dart allows you to save data persistently. Use writeAsString() to overwrite a file's content, or use append mode to add content without erasing existing data.";

  final String writeStringTitle = 'Write String to File';
  final String writeStringDesc =
      'Use writeAsStringSync() to write a string to a file. This overwrites the file if it already exists.';
  final String writeStringCode = '''import 'dart:io';

void main() {
  File file = File('output.txt');

  // Write to file (overwrites if exists)
  file.writeAsStringSync('Hello, World!\\nWelcome to Dart!');
  print('File written successfully.');

  // Verify content
  print(file.readAsStringSync());
}''';
  final String writeStringOutput = '''File written successfully.
Hello, World!
Welcome to Dart!''';

  final String appendTitle = 'Append to File';
  final String appendDesc =
      'Use FileMode.append to add content to the end of an existing file without overwriting it.';
  final String appendCode = '''import 'dart:io';

void main() {
  File file = File('log.txt');

  // Write initial content
  file.writeAsStringSync('Entry 1: App started\\n');

  // Append more content
  file.writeAsStringSync('Entry 2: User logged in\\n', mode: FileMode.append);
  file.writeAsStringSync('Entry 3: Data processed\\n', mode: FileMode.append);

  print(file.readAsStringSync());
}''';
  final String appendOutput = '''Entry 1: App started
Entry 2: User logged in
Entry 3: Data processed''';

  final String asyncWriteTitle = 'Async Write';
  final String asyncWriteDesc =
      'For production code, use async write methods to avoid blocking the main thread.';
  final String asyncWriteCode = '''import 'dart:io';

Future<void> saveData(String filename, String data) async {
  File file = File(filename);
  await file.writeAsString(data);
  print('Saved \${data.length} characters to \$filename');
}

Future<void> main() async {
  await saveData('config.txt', 'theme=dark\\nlanguage=en\\nversion=1.0');
  File config = File('config.txt');
  print(await config.readAsString());
}''';
  final String asyncWriteOutput = '''Saved 36 characters to config.txt
theme=dark
language=en
version=1.0''';

  final List<String> tips = [
    'writeAsStringSync() overwrites the file completely by default.',
    'Use FileMode.append to add content without erasing existing data.',
    'Async versions (writeAsString()) are preferred for UI applications.',
    'Create parent directories first using Directory.createSync(recursive: true).',
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
      child: SideNavBarChildEnum.writeFile,
    );
    Get.find<AppBarController>().appBarTitle = SK.writeFile;
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
