import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LibrariesController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.LIBRARIES_AND_IMPORTS_IN_DART}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      'Dart organises code into libraries. A library is a set of related code packed into a single namespace. Every .dart file is itself a library. Libraries are shared via import and export statements.';

  String importTypesDesc = 'Dart supports three import URI schemes:';

  List<Map<String, String>> importTypes = [
    {
      'scheme': 'dart:',
      'desc':
          'Core Dart SDK libraries (dart:core, dart:async, dart:math, dart:convert, dart:io, dart:html, ...). dart:core is auto-imported.'
    },
    {
      'scheme': 'package:',
      'desc':
          'Third-party packages from pub.dev or local packages declared in pubspec.yaml.'
    },
    {
      'scheme': 'relative path',
      'desc':
          "Files within the same project, e.g. import 'utils/helpers.dart'."
    },
  ];

  String basicImportCode = '''// SDK library
import 'dart:math';

// Third-party package
import 'package:get/get.dart';

// Relative file (same project)
import '../models/user.dart';

void main() {
  print(sqrt(16));   // dart:math — sqrt
}''';

  String aliasCode = '''// Avoid name conflicts with 'as'
import 'dart:math' as math;
import 'package:vector_math/vector_math.dart' as vectors;

void main() {
  print(math.pi);           // 3.141592...
  final v = vectors.Vector2(1, 0);
  print(v);
}''';

  String showHideCode = '''// Import only what you need with 'show'
import 'dart:math' show Random, pi;

// Import everything except specific names with 'hide'
import 'dart:core' hide print;   // rarely useful but valid

void main() {
  final rng = Random();
  print(rng.nextInt(100));    // 'print' comes from dart:core (auto-imported)
  print(pi);                  // 3.141592...
}''';

  String exportCode = '''// file: lib/my_library.dart
// Aggregate exports — users import one file to get everything.
export 'src/widget_a.dart';
export 'src/widget_b.dart' show WidgetB;        // export subset
export 'src/widget_c.dart' hide InternalHelper; // hide internals''';

  String partCode = '''// Legacy mechanism — prefer separate files + exports instead.

// file: large_file.dart
library large_file;
part 'src/part_a.dart';
part 'src/part_b.dart';

// file: src/part_a.dart
part of large_file;       // shares the library's namespace''';

  List<String> tips = [
    'dart:core is always auto-imported — you never need to import String, int, print, etc.',
    "Use 'as' aliases when two packages export the same class name.",
    "'show' makes your intentions explicit and speeds up IDE auto-complete.",
    'Barrel files (index.dart) that only export other files are a common Flutter pattern.',
    "Avoid 'part' / 'part of' in new code — it couples files tightly.",
    'Deferred imports (import ... deferred as) lazy-load libraries on Flutter web.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 150) {
          Get.find<ProgressService>().markCompleted(routePath);
        }
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.libraries,
    );
    Get.find<AppBarController>().appBarTitle = SK.libraries;
    Get.find<ProgressService>().markInProgress(routePath);
    update();
    super.onInit();
  }

  void scrollToTop() => scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
