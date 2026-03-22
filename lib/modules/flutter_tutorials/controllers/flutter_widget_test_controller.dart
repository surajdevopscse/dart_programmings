import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterWidgetTestController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Widget tests verify that your Flutter widgets render correctly and respond to user interaction. They use WidgetTester to build widgets in a test environment and simulate user actions like taps, scrolls, and text input.';
  String widgetTestCode = '''import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Widget to test
class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}
class _CounterWidgetState extends State<CounterWidget> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Count: \$count', key: const Key('counter_text')),
        ElevatedButton(
          key: const Key('increment_btn'),
          onPressed: () => setState(() => count++),
          child: const Text('Increment'),
        ),
      ],
    );
  }
}

void main() {
  testWidgets('CounterWidget increments on button tap', (tester) async {
    // Build widget tree
    await tester.pumpWidget(
      const MaterialApp(home: Scaffold(body: CounterWidget())),
    );

    // Verify initial state
    expect(find.text('Count: 0'), findsOneWidget);
    expect(find.text('Count: 1'), findsNothing);

    // Tap the button
    await tester.tap(find.byKey(const Key('increment_btn')));
    await tester.pump();  // trigger rebuild

    // Verify new state
    expect(find.text('Count: 1'), findsOneWidget);
    expect(find.text('Count: 0'), findsNothing);
  });
}''';
  String finderCode = '''// Widget Finders — locating widgets in the tree
find.text('Hello World')              // by text content
find.byKey(const Key('my_key'))      // by Key
find.byType(ElevatedButton)          // by widget type
find.byIcon(Icons.add)               // by icon data
find.byWidget(myWidget)              // exact widget instance
find.byTooltip('Submit')             // by tooltip text
find.ancestor(                       // ancestor/descendant
  of: find.byType(Card),
  matching: find.byType(Text),
)
find.descendant(
  of: find.byType(ListTile),
  matching: find.byType(Icon),
)

// Quantity matchers
findsOneWidget       // exactly one widget
findsNothing         // no widgets
findsWidgets         // one or more widgets
findsNWidgets(3)     // exactly N widgets
findsAtLeast(2)      // at least N widgets

// Example assertions
expect(find.byType(CircularProgressIndicator), findsNothing);
expect(find.text('Error'), findsOneWidget);
expect(find.byType(ListTile), findsNWidgets(5));''';
  String interactionCode = '''// User interactions and async handling
testWidgets('Form submission test', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: LoginForm()));

  // Type in text fields
  await tester.enterText(find.byKey(const Key('email_field')), 'test@example.com');
  await tester.enterText(find.byKey(const Key('password_field')), 'password123');

  // Tap submit button
  await tester.tap(find.text('Login'));

  // Wait for loading indicator
  await tester.pump();
  expect(find.byType(CircularProgressIndicator), findsOneWidget);

  // Wait for async operations to complete
  await tester.pumpAndSettle();
  expect(find.byType(CircularProgressIndicator), findsNothing);

  // Scroll
  await tester.scrollUntilVisible(find.text('Item 50'), 500);

  // Long press
  await tester.longPress(find.byType(ListTile).first);

  // Drag
  await tester.drag(find.byType(Dismissible).first, const Offset(-300, 0));
  await tester.pumpAndSettle();
});

// Test golden images (visual regression)
testWidgets('Widget matches golden', (tester) async {
  await tester.pumpWidget(const MaterialApp(home: MyCard()));
  await expectLater(find.byType(MyCard), matchesGoldenFile('my_card.png'));
});''';
  List<String> tips = [
    'pump() triggers a single frame; pumpAndSettle() waits for all animations',
    'Use pumpWidget with MaterialApp wrapper to have proper theme/localization',
    'Keys make widgets findable reliably — use semantic keys in production code',
    'WidgetTester.pump(Duration) advances the clock for delayed operations',
    'Golden tests catch unintended visual regressions — update with --update-goldens',
    'Test accessibility: semanticsOf(find.text(\'btn\')).label == \'Submit button\'',
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
      child: SideNavBarChildEnum.flutterWidgetTest,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterWidgetTest;
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
