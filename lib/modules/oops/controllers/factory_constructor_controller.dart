import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FactoryConstructorController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'FACTORY CONSTRUCTOR IN DART';
  final String intro =
      'A factory constructor uses the factory keyword and does not always create a new instance. It can return an existing instance (singleton) or a subtype, making it perfect for implementing design patterns.';
  final String exampleTitle = 'Factory Constructor Example';
  final String exampleCode = '''class AppConfig {
  static AppConfig? _instance;
  final String theme;
  final String language;

  AppConfig._internal(this.theme, this.language);

  factory AppConfig({String theme = 'light', String language = 'en'}) {
    _instance ??= AppConfig._internal(theme, language);
    return _instance!;
  }
}

abstract class Logger {
  void log(String message);

  factory Logger(String type) {
    switch (type) {
      case 'console': return ConsoleLogger();
      case 'file': return FileLogger();
      default: throw ArgumentError('Unknown logger: \$type');
    }
  }
}

class ConsoleLogger implements Logger {
  @override
  void log(String message) => print('[Console] \$message');
}

class FileLogger implements Logger {
  @override
  void log(String message) => print('[File] Writing: \$message');
}

void main() {
  AppConfig c1 = AppConfig(theme: 'dark');
  AppConfig c2 = AppConfig(theme: 'light');
  print('Same instance: \${identical(c1, c2)}');
  print('Theme: \${c1.theme}');

  Logger logger = Logger('console');
  logger.log('Application started');
}''';
  final String exampleOutput = '''Same instance: true
Theme: dark
[Console] Application started''';
  final List<String> tips = [
    'Factory constructors can return existing instances (singleton pattern).',
    'They can return subtypes, unlike regular constructors.',
    'Use factory constructors for object caching or pooling.',
    'The factory keyword removes the obligation to return a new object.',
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
      parent: SideNavBarParentEnum.oppsInDart,
      child: SideNavBarChildEnum.factoryConstructor,
    );
    Get.find<AppBarController>().appBarTitle = SK.factoryConstructor;
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
