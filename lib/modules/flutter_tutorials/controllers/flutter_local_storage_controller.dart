import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterLocalStorageController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Flutter provides several local storage options depending on your data requirements. From simple key-value pairs to complex relational databases, choosing the right storage solution is important for app performance and maintainability.';
  String comparisonDesc = '''Local storage options comparison:

SharedPreferences — Key-value store for simple data
  • Best for: user settings, preferences, small flags
  • Data type: int, double, bool, String, List<String>
  • Speed: Very fast
  • Size limit: Small data only

Hive — Fast NoSQL key-value database
  • Best for: structured data, offline-first apps
  • Data type: Any (with TypeAdapters)
  • Speed: Extremely fast (pure Dart)
  • Size limit: Moderate to large

SQLite (sqflite) — Relational database
  • Best for: complex queries, relational data
  • Data type: Tables with typed columns
  • Speed: Fast with proper indexing
  • Size limit: Large datasets

Secure Storage (flutter_secure_storage)
  • Best for: tokens, passwords, sensitive data
  • Stores in Keychain (iOS) / Keystore (Android)
  • Data type: String key-value
  • Security: Encrypted at OS level''';
  List<String> whenToUseList = [
    'SharedPreferences: theme mode, language, user onboarding seen, notification settings',
    'Hive: shopping cart items, cached API responses, app state persistence',
    'SQLite: contacts, notes app, inventory with filtering/sorting',
    'Secure Storage: JWT tokens, API keys, passwords, session data',
    'ObjectBox/Drift: when you need ORM features with type safety',
    'Isar: when you need fast full-text search and complex queries',
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
      child: SideNavBarChildEnum.flutterLocalStorage,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterLocalStorage;
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
