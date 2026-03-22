import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterLayoutsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Flutter uses a constraint-based layout system. Parent widgets pass constraints to children, and children report their sizes back. Understanding how Container, Padding, Center, Expanded, and Flexible work is key to building flexible UIs.';
  String containerCode = '''// Container — a versatile box widget
Container(
  width: 200,
  height: 100,
  margin: const EdgeInsets.all(8),       // outer spacing
  padding: const EdgeInsets.all(16),     // inner spacing
  decoration: BoxDecoration(
    color: Colors.blue.shade100,
    borderRadius: BorderRadius.circular(12),
    border: Border.all(color: Colors.blue, width: 2),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 8,
        offset: const Offset(0, 4),
      ),
    ],
  ),
  child: const Text(
    'Styled Container',
    style: TextStyle(fontWeight: FontWeight.bold),
  ),
)''';
  String paddingCode = '''// Padding — adds space around a child
Padding(
  padding: const EdgeInsets.symmetric(
    horizontal: 16,
    vertical: 8,
  ),
  child: Text('Padded Text'),
)

// EdgeInsets options:
// EdgeInsets.all(16)                  — all sides
// EdgeInsets.symmetric(h:16, v:8)    — horizontal/vertical
// EdgeInsets.only(left:16, top:8)    — specific sides
// EdgeInsets.fromLTRB(8, 16, 8, 16) — explicit LTRB''';
  String centerCode = '''// Center — centers its child
Center(
  child: Text('I am centered!'),
)

// Align — aligns child within itself
Align(
  alignment: Alignment.topRight,
  child: Icon(Icons.star, color: Colors.amber),
)

// FractionallySizedBox — child is a fraction of parent
FractionallySizedBox(
  widthFactor: 0.8,  // 80% of parent width
  child: ElevatedButton(
    onPressed: () {},
    child: const Text('Wide Button'),
  ),
)''';
  String expandedCode = '''// Expanded and Flexible inside Row/Column
Row(
  children: [
    Expanded(
      flex: 2,           // takes 2/3 of available space
      child: Container(
        color: Colors.red,
        height: 50,
        child: const Center(child: Text('2/3')),
      ),
    ),
    Expanded(
      flex: 1,           // takes 1/3 of available space
      child: Container(
        color: Colors.blue,
        height: 50,
        child: const Center(child: Text('1/3')),
      ),
    ),
  ],
)

// Flexible (can shrink, unlike Expanded which must fill)
Row(
  children: [
    Flexible(
      child: Text('This text can shrink if needed'),
    ),
    const Icon(Icons.arrow_forward),
  ],
)''';
  List<String> tips = [
    'Use Container when you need decoration (color, border, shadow)',
    'Use Padding widget when you only need padding (lighter than Container)',
    'Expanded fills all remaining space; Flexible can shrink smaller',
    'SizedBox is a lightweight spacer widget',
    'ConstrainedBox sets min/max width and height constraints',
    'IntrinsicHeight/IntrinsicWidth measure child\'s natural size',
    'Always test layouts on multiple screen sizes',
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
      child: SideNavBarChildEnum.flutterLayouts,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterLayouts;
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
