import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterStatelessController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'A StatelessWidget is a widget that describes part of the user interface which does not depend on any mutable state. It is built once and never rebuilds unless its parent changes its configuration.';
  String exampleCode = '''import 'package:flutter/material.dart';

// A simple StatelessWidget
class WelcomeCard extends StatelessWidget {
  final String name;
  final String role;

  const WelcomeCard({
    super.key,
    required this.name,
    required this.role,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome, \$name!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Role: \$role',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage:
// WelcomeCard(name: 'Alice', role: 'Developer')''';
  String exampleDesc = 'The WelcomeCard above takes name and role as constructor parameters. Since these values never change after construction, StatelessWidget is perfect here. The build() method is called whenever the widget needs to be displayed.';
  List<String> whenToUse = [
    'Display static content that never changes',
    'UI elements with only read-only data (no setState)',
    'Purely decorative widgets (icons, dividers)',
    'Widgets that only depend on their constructor parameters',
    'When parent controls all data via constructor arguments',
  ];
  List<String> keyPoints = [
    'StatelessWidget is immutable — its fields must be final',
    'The build() method returns the widget\'s UI description',
    'It rebuilds only when the parent widget rebuilds with new parameters',
    'Use const constructor when possible for performance',
    'Perfect for presentational/display-only components',
    'Cannot use setState() — use StatefulWidget if state is needed',
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
      child: SideNavBarChildEnum.flutterStateless,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterStateless;
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
