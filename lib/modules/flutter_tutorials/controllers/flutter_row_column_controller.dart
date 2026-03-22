import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterRowColumnController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Row and Column are the two most fundamental layout widgets in Flutter. Row arranges children horizontally, Column arranges them vertically. Both use MainAxisAlignment and CrossAxisAlignment for positioning.';
  String rowCode = '''// Row — horizontal layout
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    const Icon(Icons.home, size: 30),
    const Text('Home Page'),
    IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () {},
    ),
  ],
)

// MainAxisAlignment options for Row (horizontal axis):
// start / end / center / spaceBetween / spaceAround / spaceEvenly

// CrossAxisAlignment options for Row (vertical axis):
// start / end / center / stretch / baseline''';
  String columnCode = '''// Column — vertical layout
Column(
  mainAxisAlignment: MainAxisAlignment.center,
  crossAxisAlignment: CrossAxisAlignment.stretch,
  children: [
    const Text(
      'Title',
      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    const SizedBox(height: 16),
    const Text('Description text goes here...'),
    const SizedBox(height: 24),
    ElevatedButton(
      onPressed: () {},
      child: const Text('Action'),
    ),
  ],
)''';
  String alignmentDesc = 'mainAxisAlignment controls spacing along the main axis (horizontal for Row, vertical for Column). crossAxisAlignment controls alignment on the cross axis (vertical for Row, horizontal for Column).';
  String nestedExample = '''// Nested Row and Column — common pattern
Card(
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Row(
      children: [
        const CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage('https://picsum.photos/60'),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'John Doe',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const SizedBox(height: 4),
              Text(
                'Flutter Developer',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        const Icon(Icons.arrow_forward_ios, size: 16),
      ],
    ),
  ),
)''';
  List<String> tips = [
    'Use mainAxisSize: MainAxisSize.min if you don\'t want Row/Column to fill all space',
    'CrossAxisAlignment.stretch makes children fill cross axis — great for buttons',
    'Wrap widget handles children that overflow (wraps to next line)',
    'IntrinsicHeight makes all Row children the same height',
    'Avoid deep nesting — prefer Flex/Column/Row combinations',
    'Use Spacer() as a flexible gap between children',
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
      child: SideNavBarChildEnum.flutterRowColumn,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterRowColumn;
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
