import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/bookmarks/bookmark_service.dart';
import 'package:dart_programing/services/shared_preference_service/shared_preference_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BookmarkItem {
  final String route;
  final String title;
  final String category;

  const BookmarkItem({
    required this.route,
    required this.title,
    required this.category,
  });
}

class BookmarksController extends GetxController {
  late ScrollController scrollController;
  bool showBackToTopButton = false;

  final BookmarkService _bookmarkService = Get.find();
  final SharedPreferenceService _prefs = Get.find();

  var bookmarks = RxList<BookmarkItem>([]);

  String _getCategoryFromRoute(String route) {
    if (route.contains('/interview')) return 'Interview';
    if (route.contains('/flutter')) return 'Flutter';
    if (route.contains('/best-guide')) return 'Best Guide';
    return 'Dart';
  }

  void loadBookmarks() {
    final routes = _bookmarkService.getBookmarks();
    bookmarks.value = routes.map((route) {
      final title = _prefs.getString('bookmark_title_$route') ?? route;
      return BookmarkItem(
        route: route,
        title: title,
        category: _getCategoryFromRoute(route),
      );
    }).toList();
  }

  Future<void> removeBookmark(String route) async {
    final title = _prefs.getString('bookmark_title_$route') ?? route;
    await _bookmarkService.toggleBookmark(route, title);
    loadBookmarks();
    update();
  }

  Map<String, List<BookmarkItem>> get groupedBookmarks {
    final Map<String, List<BookmarkItem>> groups = {};
    for (final bm in bookmarks) {
      groups.putIfAbsent(bm.category, () => []).add(bm);
    }
    return groups;
  }

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.bookmarks,
      child: SideNavBarChildEnum.bookmarksPage,
    );
    Get.find<AppBarController>().appBarTitle = SK.bookmarks;
    loadBookmarks();
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
