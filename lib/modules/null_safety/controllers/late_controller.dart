import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LateController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'LATE KEYWORD IN DART';
  final String intro =
      'The late keyword in Dart is used to declare a non-nullable variable that will be initialized later. It is useful when you know a variable will be set before it is used but cannot assign it at declaration time.';
  final String exampleTitle = 'Late Keyword Example';
  final String exampleCode = '''class DatabaseConnection {
  late String host;
  late int port;

  void initialize(String h, int p) {
    host = h;
    port = p;
  }

  void connect() {
    print('Connecting to \$host:\$port');
  }
}

class Config {
  // Late with initializer — computed lazily on first access
  late final String appName = _computeAppName();

  String _computeAppName() {
    print('Computing app name...');
    return 'DartApp v1.0';
  }
}

void main() {
  DatabaseConnection db = DatabaseConnection();
  db.initialize('localhost', 5432);
  db.connect();

  Config config = Config();
  print(config.appName); // Computed here
  print(config.appName); // Returned from cache
}''';
  final String exampleOutput = '''Connecting to localhost:5432
Computing app name...
DartApp v1.0
DartApp v1.0''';
  final List<String> tips = [
    'Use late when initialization cannot happen at declaration.',
    'Accessing a late variable before initialization throws a LateInitializationError.',
    'late final creates a lazily-initialized constant.',
    'Useful in Flutter for controllers initialized in initState.',
    'Prefer late over nullable (?) when the value is always set before use.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTopButton = true;
        } else {
          showBackToTopButton = false;
        }
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.nullSafety,
      child: SideNavBarChildEnum.lateKeywords,
    );
    Get.find<AppBarController>().appBarTitle = SK.lateKeywords;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
