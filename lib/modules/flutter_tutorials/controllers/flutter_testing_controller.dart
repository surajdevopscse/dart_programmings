import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterTestingController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Testing is essential for building reliable Flutter apps. Flutter supports three types of tests: unit tests (Dart logic), widget tests (UI), and integration tests (full app). A good testing strategy covers all three levels.';
  String testingTypesDesc = '''Testing Pyramid:

Integration Tests (few, slow)
  • Test the complete app end-to-end
  • Run on real device or emulator
  • Simulate user interactions across screens
  • Catch issues that unit/widget tests miss
  • Tool: integration_test package

Widget Tests (medium, moderate speed)
  • Test a single widget or small widget tree
  • Run in a simulated environment
  • Verify widget renders correctly and responds to interaction
  • No real device needed
  • Tool: flutter_test (WidgetTester)

Unit Tests (many, fast)
  • Test individual functions, methods, classes
  • No Flutter framework needed
  • Pure Dart logic testing
  • Very fast and easy to write
  • Tool: test package''';
  String setupCode = '''# pubspec.yaml
# dev_dependencies:
#   flutter_test:
#     sdk: flutter
#   test: ^1.24.0
#   mockito: ^5.4.0
#   build_runner: ^2.4.0
#   integration_test:
#     sdk: flutter

# Test file naming: test/my_class_test.dart
# Widget tests: test/widgets/my_widget_test.dart
# Integration tests: integration_test/app_test.dart

# Run all tests
\$ flutter test

# Run a specific test file
\$ flutter test test/unit/calculator_test.dart

# Run tests with coverage
\$ flutter test --coverage
\$ genhtml coverage/lcov.info -o coverage/html
\$ open coverage/html/index.html

# Run integration tests
\$ flutter test integration_test/app_test.dart''';
  String unitTestCode = '''import 'package:test/test.dart';

// Simple function to test
int add(int a, int b) => a + b;
String formatName(String first, String last) => '\$first \$last';

void main() {
  test('add returns correct sum', () {
    expect(add(2, 3), equals(5));
    expect(add(-1, 1), equals(0));
    expect(add(0, 0), equals(0));
  });

  test('formatName returns full name', () {
    expect(formatName('John', 'Doe'), equals('John Doe'));
  });

  group('Calculator', () {
    late Calculator calc;

    setUp(() {
      calc = Calculator();  // runs before each test in group
    });

    tearDown(() {
      // cleanup after each test
    });

    test('initial value is 0', () {
      expect(calc.result, equals(0));
    });

    test('add works correctly', () {
      calc.add(5);
      calc.add(3);
      expect(calc.result, equals(8));
    });

    test('divide throws on zero', () {
      expect(() => calc.divide(0), throwsArgumentError);
    });
  });
}''';
  List<String> tips = [
    'Aim for 80%+ test coverage for critical business logic',
    'Test edge cases: empty lists, null values, error conditions',
    'Use groups to organize related tests',
    'setUp/tearDown runs before/after each test; setUpAll/tearDownAll for entire group',
    'Integration tests should cover the most important user journeys',
    'Test-driven development (TDD): write tests before implementation',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterTesting,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterTesting;
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
