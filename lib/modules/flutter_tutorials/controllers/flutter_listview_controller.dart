import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterListViewController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'ListView is the most commonly used scrolling widget. It displays a scrollable list of children. For large lists, use ListView.builder which lazily builds items only when they\'re visible.';
  String basicListCode = '''// Basic ListView — all children built at once
ListView(
  padding: const EdgeInsets.all(8),
  children: [
    ListTile(
      leading: const Icon(Icons.home),
      title: const Text('Home'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    ),
    ListTile(
      leading: const Icon(Icons.person),
      title: const Text('Profile'),
      subtitle: const Text('View your profile'),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {},
    ),
    const Divider(),
    ListTile(
      leading: const Icon(Icons.settings),
      title: const Text('Settings'),
      onTap: () {},
    ),
  ],
)''';
  String builderCode = '''// ListView.builder — efficient for large/infinite lists
// Only builds items as they scroll into view

final List<Map<String, String>> items = List.generate(
  100,
  (i) => {'title': 'Item \${i + 1}', 'subtitle': 'Description for item \${i + 1}'},
);

ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) {
    final item = items[index];
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('\${index + 1}'),
        ),
        title: Text(item['title']!),
        subtitle: Text(item['subtitle']!),
        trailing: IconButton(
          icon: const Icon(Icons.delete_outline),
          onPressed: () => items.removeAt(index),
        ),
      ),
    );
  },
)''';
  String separatedCode = '''// ListView.separated — adds dividers between items
ListView.separated(
  itemCount: 20,
  separatorBuilder: (context, index) => const Divider(height: 1),
  itemBuilder: (context, index) {
    return ListTile(
      title: Text('Item \${index + 1}'),
    );
  },
)

// Horizontal ListView
ListView.builder(
  scrollDirection: Axis.horizontal,
  itemCount: 10,
  itemBuilder: (context, index) {
    return Container(
      width: 120,
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.primaries[index % Colors.primaries.length],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          'Card \${index + 1}',
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  },
)''';
  List<String> tips = [
    'Use ListView.builder for lists with more than 50 items',
    'Set shrinkWrap: true when ListView is inside a Column (adds all children\'s height)',
    'Use physics: NeverScrollableScrollPhysics() to disable scrolling',
    'ScrollController allows programmatic scrolling and position listening',
    'PageStorageKey preserves scroll position when navigating away',
    'Use CacheExtent to pre-build items outside the visible area',
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
      child: SideNavBarChildEnum.flutterListView,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterListView;
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
