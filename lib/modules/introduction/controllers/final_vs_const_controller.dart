import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FinalVsConstController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.FINAL_VS_CONST}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      'Dart provides three ways to declare an unchangeable binding: var (mutable), final (set once at runtime), and const (compile-time constant). Understanding the difference is essential for writing correct, optimised Flutter code.';

  String comparisonCode = """// var — mutable, type inferred
var counter = 0;
counter = 1;            // ✓ allowed

// final — set once, value known at runtime
final now = DateTime.now();   // evaluated each run
// now = DateTime.now();         // ✗ compile error: can't reassign final

// const — compile-time constant, value must be known at compile time
const pi = 3.14159;
// const pi = 3.0;         // ✗ compile error: can't reassign const

// Both final and const prevent reassignment.
// Only const guarantees a compile-time value.""";

  String runtimeVsCompileCode = """// ✓ final can hold a runtime value
// final userToken = await fetchToken();      // fetched at runtime
final items = <String>[];                   // mutable list, immutable binding

// ✓ const must be a compile-time value
const maxItems = 100;
const appName = 'Dart App';
const pair = (1, 2);                        // record literal (Dart 3)

// ✗ This fails — DateTime.now() is not a compile-time constant
// const now = DateTime.now();   // ERROR""";

  String finalFieldCode = """class User {
  final String id;        // set once in constructor, never again
  final String name;
  final DateTime created = DateTime.now();  // runtime final field

  const User({required this.id, required this.name});
}

// final local variable — must be assigned before use
void greet() {
  final String message;     // declared but not yet assigned
  message = 'Hello!';       // assigned once
  // message = 'Hi!';       // ✗ ERROR: already assigned
  print(message);
}""";

  String constCollectionsCode = """// const collections — deeply immutable
const colors = ['red', 'green', 'blue'];  // elements also become const
// colors.add('yellow');    // ✗ throws UnsupportedError at runtime
// colors[0] = 'pink';      // ✗ throws UnsupportedError

// final collections — the reference is immutable, but the collection is not
final fruits = ['apple', 'banana'];
fruits.add('cherry');   // ✓ allowed — list contents can change
// fruits = [];           // ✗ ERROR — can't reassign final

// const Map
const config = {'host': 'localhost', 'port': '8080'};

// const in Flutter widgets — reuse across rebuilds
const SizedBox(height: 16);   // Flutter creates ONE instance and reuses it
const Text('Hello');           // same — cached by the framework""";

  String constConstructorCode = """// A class with a const constructor must have only final fields.
class Point {
  final double x;
  final double y;

  const Point(this.x, this.y);                    // const constructor
  const Point.origin() : x = 0, y = 0;           // named const constructor

  @override
  String toString() => 'Point(\$x, \$y)';
}

void main() {
  const p1 = Point(1, 2);
  const p2 = Point(1, 2);
  print(identical(p1, p2));   // true — same instance (canonicalised)

  const origin = Point.origin();
  print(origin);              // Point(0.0, 0.0)
}""";

  List<Map<String, String>> summary = [
    {
      'label': 'var',
      'desc': 'Mutable. Type inferred. Can be reassigned.'
    },
    {
      'label': 'final',
      'desc':
          'Immutable binding. Value set once at runtime. Object itself may be mutable.'
    },
    {
      'label': 'const',
      'desc':
          'Compile-time constant. Deeply immutable. Identical instances are canonicalised.'
    },
  ];

  List<String> tips = [
    'Prefer const for values you know at compile time — Flutter reuses the widget instance.',
    'Use final for fields that are set once in the constructor and never change.',
    'final List is not a const list — you can still add/remove elements.',
    'const constructors require ALL fields to be final.',
    'identical(a, b) returns true for two const objects with the same value.',
    'In Flutter, const widgets are cached — they are never rebuilt unnecessarily.',
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
      child: SideNavBarChildEnum.finalVSConst,
    );
    Get.find<AppBarController>().appBarTitle = SK.finalVsConst;
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
