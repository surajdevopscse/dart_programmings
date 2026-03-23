import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StringDartController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.STRING_IN_DART}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      'Strings in Dart are sequences of UTF-16 code units. They are immutable values — once created you cannot change individual characters. Dart provides rich string literals, interpolation, and a full suite of built-in methods.';

  String literalsCode = r"""// Single or double quotes — identical behaviour
String s1 = 'Hello, Dart!';
String s2 = "Hello, Dart!";

// Escape sequences
String tab     = 'column1\tcolumn2';   // tab
String newLine = 'line1\nline2';        // newline
String dollar  = r'$notInterpolated';   // raw — no interpolation

// Multi-line (triple quotes)
String multiLine = '''
  This spans
  multiple lines.
  No escapes needed for " or '.
''';

print(s1.length);   // 12
print(s1[0]);       // H  (char at index 0)""";

  String interpolationCode = """void main() {
  String name  = 'Alice';
  int    score = 98;
  double avg   = 97.3;

  // Simple variable
  print('Hello, \$name!');                  // Hello, Alice!

  // Expression — wrap in \${ }
  print('Score: \${score + 2}');            // Score: 100
  print('Grade: \${score >= 90 ? "A" : "B"}');  // Grade: A
  print('Avg: \${avg.toStringAsFixed(1)}'); // Avg: 97.3
}""";

  String methodsCode = """void main() {
  String s = '  Hello, Dart!  ';

  print(s.trim());                    // 'Hello, Dart!'
  print(s.toLowerCase());             // '  hello, dart!  '
  print(s.toUpperCase());             // '  HELLO, DART!  '
  print(s.contains('Dart'));          // true
  print(s.startsWith('  Hello'));     // true
  print(s.replaceAll('Dart', 'World')); // '  Hello, World!  '
  print(s.split(', '));               // ['  Hello', 'Dart!  ']
  print(s.substring(2, 7));          // 'Hello'
  print(s.indexOf('Dart'));           // 9
  print(s.isEmpty);                   // false
  print(''.isEmpty);                  // true
}""";

  String concatCode = """void main() {
  // + operator
  String a = 'Hello' + ', ' + 'World!';

  // Adjacent string literals — compile-time concat (preferred for long strings)
  String b = 'This is a very '
             'long string that '
             'spans source lines.';

  // StringBuffer — efficient for many concatenations
  final buf = StringBuffer();
  for (int i = 0; i < 5; i++) {
    buf.write('item\$i ');
  }
  print(buf.toString()); // item0 item1 item2 item3 item4

  // String.fromCharCodes
  String c = String.fromCharCodes([72, 101, 108, 108, 111]); // Hello
}""";

  List<String> methods = [
    'length — number of UTF-16 code units',
    'isEmpty / isNotEmpty — check for empty string',
    'contains(Pattern) — substring or regex search',
    'startsWith / endsWith — prefix / suffix check',
    'indexOf / lastIndexOf — find position',
    'substring(start, [end]) — slice',
    'split(Pattern) — returns List<String>',
    'trim / trimLeft / trimRight — remove whitespace',
    'toLowerCase / toUpperCase — case conversion',
    'replaceAll / replaceFirst / replaceAllMapped — substitution',
    'padLeft / padRight — align with padding characters',
    'compareTo — lexicographic comparison (returns int)',
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
      child: SideNavBarChildEnum.string,
    );
    Get.find<AppBarController>().appBarTitle = SK.string;
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
