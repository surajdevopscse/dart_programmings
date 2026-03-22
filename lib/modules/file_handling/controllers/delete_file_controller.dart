import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteFileController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'DELETE FILE IN DART';
  final String intro =
      "Deleting files in Dart is straightforward using the File.delete() or File.deleteSync() methods. Always check that the file exists before deleting to avoid exceptions.";

  final String deleteTitle = 'Delete a File';
  final String deleteDesc =
      'Use deleteSync() to delete a file synchronously. The file must exist, otherwise a FileSystemException is thrown.';
  final String deleteCode = '''import 'dart:io';

void main() {
  // Create a temp file
  File file = File('temp.txt');
  file.writeAsStringSync('Temporary data');

  print('File exists: \${file.existsSync()}');

  // Delete the file
  file.deleteSync();

  print('File exists after delete: \${file.existsSync()}');
  print('File deleted successfully!');
}''';
  final String deleteOutput = '''File exists: true
File exists after delete: false
File deleted successfully!''';

  final String safeDeleteTitle = 'Safe Delete with Check';
  final String safeDeleteDesc =
      'Always check if a file exists before deleting to prevent runtime errors.';
  final String safeDeleteCode = '''import 'dart:io';

void deleteIfExists(String path) {
  File file = File(path);
  if (file.existsSync()) {
    file.deleteSync();
    print('Deleted: \$path');
  } else {
    print('File not found: \$path');
  }
}

void main() {
  // Create a file
  File('test.txt').writeAsStringSync('test content');

  deleteIfExists('test.txt');
  deleteIfExists('nonexistent.txt');
}''';
  final String safeDeleteOutput = '''Deleted: test.txt
File not found: nonexistent.txt''';

  final String asyncDeleteTitle = 'Async Delete';
  final String asyncDeleteDesc =
      'Use async delete() for non-blocking file deletion in Flutter and server applications.';
  final String asyncDeleteCode = '''import 'dart:io';

Future<void> cleanupFiles(List<String> paths) async {
  for (String path in paths) {
    File file = File(path);
    if (await file.exists()) {
      await file.delete();
      print('Cleaned up: \$path');
    }
  }
  print('Cleanup complete.');
}

Future<void> main() async {
  // Create temp files
  for (int i = 1; i <= 3; i++) {
    File('temp_\$i.txt').writeAsStringSync('Temp \$i');
  }

  await cleanupFiles(['temp_1.txt', 'temp_2.txt', 'temp_3.txt', 'missing.txt']);
}''';
  final String asyncDeleteOutput = '''Cleaned up: temp_1.txt
Cleaned up: temp_2.txt
Cleaned up: temp_3.txt
Cleanup complete.''';

  final List<String> tips = [
    'Always check existsSync() or exists() before deleting.',
    'Use async delete() to avoid blocking the UI thread.',
    'Deleting a directory requires recursive: true parameter.',
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
      child: SideNavBarChildEnum.deleteFile,
    );
    Get.find<AppBarController>().appBarTitle = SK.deleteFile;
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
