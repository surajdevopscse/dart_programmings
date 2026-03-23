import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class KeywordsController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.KEYWORDS_IN_DART}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      'Dart reserves certain words for its syntax — you cannot use them as identifiers. There are three categories: reserved words (hard keywords), built-in identifiers (soft keywords), and asynchrony-related keywords.';

  String reservedWordsDesc =
      'These words are part of Dart grammar. You cannot use them as identifiers anywhere:';

  List<String> reservedWords = [
    'assert', 'break', 'case', 'catch', 'class', 'const', 'continue',
    'default', 'do', 'else', 'enum', 'extends', 'false', 'final',
    'finally', 'for', 'if', 'in', 'is', 'new', 'null', 'rethrow',
    'return', 'super', 'switch', 'this', 'throw', 'true', 'try',
    'var', 'void', 'while', 'with',
  ];

  String reservedWordsCode = """// Using reserved words — examples
void main() {
  // var / final / const
  var x = 10;
  final y = 20;
  const z = 30;

  // if / else / while / for / break / continue
  for (int i = 0; i < 5; i++) {
    if (i == 3) break;
    if (i == 1) continue;
    print(i);             // 0  2
  }

  // try / catch / finally / throw / rethrow
  try {
    throw Exception('oops');
  } catch (e) {
    print(e);
  } finally {
    print('always runs');
  }

  // assert (active only in debug mode)
  assert(x > 0, 'x must be positive');
}""";

  String builtInDesc =
      'Built-in identifiers (soft keywords) have special meaning in specific contexts but can be used as identifiers elsewhere (not recommended):';

  List<String> builtInIdentifiers = [
    'abstract', 'as', 'covariant', 'deferred', 'dynamic', 'export',
    'extension', 'external', 'factory', 'Function', 'get', 'hide',
    'implements', 'import', 'interface', 'library', 'mixin', 'operator',
    'part', 'required', 'set', 'show', 'static', 'typedef',
  ];

  String builtInCode = """// 'as' — type cast + import alias
import 'dart:math' as math;
double value = math.sqrt(9);           // 3.0
Object obj = 'hello';
String s = obj as String;              // cast (throws if wrong type)

// 'is' — type check (reserved word)
print(s is String);                    // true

// 'dynamic' — opt out of static typing
dynamic anything = 42;
anything = 'now a string';

// 'typedef' — name a function type
typedef Predicate<T> = bool Function(T value);
Predicate<int> isEven = (n) => n % 2 == 0;
print(isEven(4));                      // true

// 'get' / 'set' — property accessors (built-in identifiers)
class Circle {
  double radius;
  Circle(this.radius);
  double get area => 3.14159 * radius * radius;
  set diameter(double d) => radius = d / 2;
}""";

  String asyncKeywordsDesc =
      'These keywords relate to asynchronous programming. They are contextual — they only have special meaning inside async/generator functions:';

  List<Map<String, String>> asyncKeywords = [
    {
      'keyword': 'async',
      'desc':
          'Marks a function as asynchronous. Its body may use await. Returns a Future.'
    },
    {
      'keyword': 'await',
      'desc':
          'Pauses execution until a Future completes. Only valid inside async functions.'
    },
    {
      'keyword': 'sync*',
      'desc':
          'Marks a generator function that yields values synchronously (Iterable).'
    },
    {
      'keyword': 'async*',
      'desc':
          'Marks a generator function that yields values asynchronously (Stream).'
    },
    {
      'keyword': 'yield',
      'desc': 'Emits a value from a generator function (sync* or async*).'
    },
    {
      'keyword': 'yield*',
      'desc':
          'Delegates to another iterable or stream inside a generator.'
    },
  ];

  List<String> tips = [
    'Never use reserved words as variable/class names — it causes compile errors.',
    'Built-in identifiers can technically be used as names, but avoid it for clarity.',
    'new is technically optional in Dart 2+ — you can always omit it.',
    'late is NOT a keyword — it is a modifier added in Dart null safety.',
    'sealed and base / interface / final are class modifiers added in Dart 3.',
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
      child: SideNavBarChildEnum.keywords,
    );
    Get.find<AppBarController>().appBarTitle = SK.keywords;
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
