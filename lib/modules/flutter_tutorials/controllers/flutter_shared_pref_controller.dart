import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterSharedPrefController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'SharedPreferences provides a persistent store for simple data. It stores data as key-value pairs and is backed by NSUserDefaults on iOS and SharedPreferences on Android. Ideal for user preferences and app settings.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   shared_preferences: ^2.2.0

import 'package:shared_preferences/shared_preferences.dart';

// Initialize (call once, typically in main.dart)
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Pre-load SharedPreferences for synchronous access later
  final prefs = await SharedPreferences.getInstance();
  runApp(MyApp(prefs: prefs));
}

// Or get instance when needed
Future<SharedPreferences> get prefs => SharedPreferences.getInstance();''';
  String writeCode = '''// Writing data
Future<void> saveUserData() async {
  final prefs = await SharedPreferences.getInstance();

  // Save different types
  await prefs.setString('username', 'johndoe');
  await prefs.setInt('user_age', 28);
  await prefs.setDouble('user_height', 175.5);
  await prefs.setBool('is_premium', true);
  await prefs.setStringList('recent_searches', ['flutter', 'dart', 'getx']);

  // Save serialized object as JSON string
  final userJson = jsonEncode({'id': 1, 'name': 'John', 'email': 'john@example.com'});
  await prefs.setString('current_user', userJson);

  print('Data saved successfully');
}''';
  String readCode = '''// Reading data
Future<void> loadUserData() async {
  final prefs = await SharedPreferences.getInstance();

  // Read with default fallback values
  final username = prefs.getString('username') ?? 'Guest';
  final age = prefs.getInt('user_age') ?? 0;
  final height = prefs.getDouble('user_height') ?? 0.0;
  final isPremium = prefs.getBool('is_premium') ?? false;
  final searches = prefs.getStringList('recent_searches') ?? [];

  // Read serialized JSON object
  final userJson = prefs.getString('current_user');
  if (userJson != null) {
    final user = jsonDecode(userJson) as Map<String, dynamic>;
    print('Logged in as: \${user['name']}');
  }

  // Check if a key exists
  final hasToken = prefs.containsKey('auth_token');
  print('Has token: \$hasToken');

  // Get all keys
  final allKeys = prefs.getKeys();
  print('All stored keys: \$allKeys');
}''';
  String clearCode = '''// Removing and clearing data
Future<void> clearUserSession() async {
  final prefs = await SharedPreferences.getInstance();

  // Remove specific key
  await prefs.remove('auth_token');
  await prefs.remove('session_id');

  // Clear all data (use carefully — logs out user!)
  await prefs.clear();

  print('Session cleared');
}

// Practical example — theme preference
class ThemeService {
  static const _themeKey = 'is_dark_mode';

  static Future<bool> isDarkMode() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_themeKey) ?? false;
  }

  static Future<void> setDarkMode(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_themeKey, isDark);
  }

  static Future<void> toggleTheme() async {
    final current = await isDarkMode();
    await setDarkMode(!current);
  }
}''';
  List<String> tips = [
    'SharedPreferences is NOT suitable for sensitive data (not encrypted)',
    'Use flutter_secure_storage for tokens and passwords',
    'Wrap in a service class for cleaner, reusable code',
    'Avoid storing large objects — SharedPreferences has size limitations',
    'await SharedPreferences.getInstance() returns cached instance after first call',
    'Use integration tests to verify SharedPreferences behavior',
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
      child: SideNavBarChildEnum.flutterSharedPref,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterSharedPref;
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
