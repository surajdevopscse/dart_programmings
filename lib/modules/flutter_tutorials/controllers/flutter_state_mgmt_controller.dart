import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterStateMgmtController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'State management is one of the most important topics in Flutter development. As your app grows, you need a strategy to share and manage state across widgets. Flutter offers several solutions from simple setState to advanced solutions like BLoC.';
  String setStateCode = '''// setState — simplest, built-in state management
// Good for: local widget state, small apps

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: \$_count', style: const TextStyle(fontSize: 24)),
            ElevatedButton(
              onPressed: () => setState(() => _count++),
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// Limitation: only works within a single widget
// Cannot share state across different widget subtrees easily''';
  List<Map<String, String>> comparisonList = [
    {
      'solution': 'setState',
      'complexity': 'Simple',
      'use_case': 'Local widget state',
      'learning_curve': 'Easy',
    },
    {
      'solution': 'InheritedWidget',
      'complexity': 'Medium',
      'use_case': 'Pass data down the tree',
      'learning_curve': 'Medium',
    },
    {
      'solution': 'Provider',
      'complexity': 'Medium',
      'use_case': 'Small to medium apps',
      'learning_curve': 'Easy-Medium',
    },
    {
      'solution': 'Riverpod',
      'complexity': 'Medium',
      'use_case': 'Medium to large apps',
      'learning_curve': 'Medium',
    },
    {
      'solution': 'GetX',
      'complexity': 'Low-Medium',
      'use_case': 'Fast development, all sizes',
      'learning_curve': 'Easy',
    },
    {
      'solution': 'BLoC',
      'complexity': 'High',
      'use_case': 'Large, complex apps',
      'learning_curve': 'Hard',
    },
  ];
  String whenToUse = 'Choose setState for simple, local state. Use Provider or Riverpod for medium-sized apps with shared state. Use GetX when you want an easy all-in-one solution. Use BLoC when you need strict separation of concerns and testability in large teams.';

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterStateMgmt,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterStateMgmt;
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
