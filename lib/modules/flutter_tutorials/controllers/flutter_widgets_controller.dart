import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterWidgetsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'In Flutter, everything is a widget. Widgets are the building blocks of a Flutter app\'s user interface. Each widget is an immutable declaration of part of the user interface.';
  String widgetTreeDesc = 'Flutter builds the UI as a tree of widgets. Parent widgets contain child widgets, forming a hierarchy. The framework traverses this tree to build the Element tree and then the Render tree for display.';
  String everythingIsWidgetCode = '''// Widgets can be anything: layout, style, gesture, animation
// A simple widget tree example:

MaterialApp(                    // App configuration widget
  home: Scaffold(               // Page structure widget
    appBar: AppBar(             // Top bar widget
      title: Text('Widgets'),  // Text widget
    ),
    body: Center(               // Layout widget
      child: Column(            // Column layout widget
        children: [
          Icon(Icons.flutter_dash, size: 100),  // Icon widget
          Text('Hello Flutter!'),               // Text widget
          ElevatedButton(                       // Button widget
            onPressed: () {},
            child: Text('Click Me'),
          ),
        ],
      ),
    ),
  ),
);''';
  String widgetTypesDesc = 'Widgets come in two main types: StatelessWidget (immutable, no state) and StatefulWidget (mutable, has state that can change). Most UI elements are composed from combinations of these widget types.';
  List<String> commonWidgets = [
    'Text — displays a string of text',
    'Container — a box with decoration, padding, margin',
    'Row / Column — horizontal / vertical layouts',
    'Stack — overlapping widgets with Positioned',
    'ListView — scrollable list of widgets',
    'GridView — scrollable grid layout',
    'Image — displays images from assets, network, or file',
    'Icon — Material or Cupertino icons',
    'ElevatedButton / TextButton / OutlinedButton — clickable buttons',
    'TextField — user text input',
    'Scaffold — basic Material Design page structure',
    'AppBar — top navigation bar',
    'Navigator — handles page routing',
    'GestureDetector — detects touch gestures',
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
      child: SideNavBarChildEnum.flutterWidgets,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterWidgets;
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
