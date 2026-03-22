import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterGridViewController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'GridView displays items in a 2D scrollable grid. Use GridView.count for a fixed number of columns, and GridView.builder for dynamic data. Control item proportions using childAspectRatio.';
  String gridCountCode = '''// GridView.count — fixed number of columns
GridView.count(
  crossAxisCount: 3,          // 3 columns
  crossAxisSpacing: 8,
  mainAxisSpacing: 8,
  padding: const EdgeInsets.all(8),
  childAspectRatio: 1.0,     // square cells
  children: List.generate(12, (index) {
    return Card(
      color: Colors.primaries[index % Colors.primaries.length],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.category, color: Colors.white, size: 32),
            const SizedBox(height: 4),
            Text(
              'Item \${index + 1}',
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }),
)''';
  String gridBuilderCode = '''// GridView.builder — efficient for large data sets
final List<String> imageUrls = List.generate(
  50,
  (i) => 'https://picsum.photos/seed/\$i/200/200',
);

GridView.builder(
  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
    childAspectRatio: 0.75,   // taller than wide (portrait)
  ),
  itemCount: imageUrls.length,
  padding: const EdgeInsets.all(8),
  itemBuilder: (context, index) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              imageUrls[index],
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Text('Photo \${index + 1}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  },
)

// SliverGridDelegateWithMaxCrossAxisExtent — auto column count
GridView.builder(
  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    maxCrossAxisExtent: 200,  // max width per item
    childAspectRatio: 1.0,
    crossAxisSpacing: 8,
    mainAxisSpacing: 8,
  ),
  itemCount: 20,
  itemBuilder: (context, index) => Container(
    color: Colors.blue[100 * ((index % 8) + 1)],
    child: Center(child: Text('\${index + 1}')),
  ),
)''';
  List<String> tips = [
    'childAspectRatio = width/height — use < 1 for taller items, > 1 for wider',
    'GridView.extent sets max item width and calculates column count automatically',
    'Use SliverGrid inside CustomScrollView for mixed scrolling content',
    'WrapLayout wraps children and is an alternative to GridView for auto-wrapping',
    'Prefer GridView.builder over GridView for large datasets',
    'You can combine GridView with RefreshIndicator for pull-to-refresh',
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
      child: SideNavBarChildEnum.flutterGridView,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterGridView;
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
