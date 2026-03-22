import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterStatefulController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'A StatefulWidget is a widget that has mutable state. Unlike StatelessWidget, it can change over time. The state is kept in a separate State object and can be updated using setState().';
  String exampleCode = '''import 'package:flutter/material.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _count = 0;  // mutable state

  void _increment() {
    setState(() {       // triggers rebuild
      _count++;
    });
  }

  void _decrement() {
    setState(() {
      _count--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Count: \$_count',
          style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              heroTag: 'dec',
              onPressed: _decrement,
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              heroTag: 'inc',
              onPressed: _increment,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}''';
  String lifecycleCode = '''class _MyWidgetState extends State<MyWidget> {

  @override
  void initState() {
    super.initState();
    // Called once when the widget is first inserted into the tree
    // Initialize controllers, subscriptions, fetch initial data here
    print('Widget initialized');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Called when widget dependencies change (e.g., Theme, MediaQuery)
  }

  @override
  void didUpdateWidget(MyWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Called when parent rebuilds and passes new config to this widget
  }

  @override
  void dispose() {
    // Clean up: dispose controllers, cancel subscriptions
    // ALWAYS call super.dispose() at the end
    print('Widget disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}''';
  String lifecycleDesc = 'The StatefulWidget lifecycle: createState → initState → didChangeDependencies → build → setState → build → (repeat) → dispose. Always dispose controllers and subscriptions in dispose() to prevent memory leaks.';
  List<String> whenToUse = [
    'When the widget needs to track user interaction (e.g., a counter)',
    'When the widget shows data that changes over time',
    'Animations that are driven by widget-local state',
    'Form validation and input tracking',
    'Toggle buttons, checkboxes, dropdowns',
    'Tab bars or page views with local page tracking',
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
      child: SideNavBarChildEnum.flutterStateful,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterStateful;
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
