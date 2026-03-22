import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterIntroController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Flutter is Google\'s open-source UI software development kit used to build natively compiled, multi-platform applications from a single codebase. It supports mobile, web, desktop, and embedded devices.';
  String whatIsFlutter = 'Flutter uses the Dart programming language and provides its own rendering engine (Skia/Impeller), allowing pixel-perfect UIs on every platform without relying on native platform widgets.';
  String whyFlutter = 'Flutter offers fast development with Hot Reload, expressive and flexible UI, native performance, and a single codebase for iOS, Android, Web, Windows, macOS, and Linux.';
  String architectureDesc = 'Flutter architecture has three layers: the Framework (Dart), the Engine (C++), and the Embedder (platform-specific). Everything in Flutter is a widget — from layout to gestures to styling.';
  String helloWorldCode = '''import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Hello Flutter')),
        body: const Center(
          child: Text(
            'Hello, World!',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}''';
  String helloWorldDesc = 'Every Flutter app starts with main() which calls runApp() with the root widget. MaterialApp provides the Material Design theme and Navigator setup.';
  List<String> keyPoints = [
    'Flutter uses Dart — a strongly-typed, AOT-compiled language',
    'Everything in Flutter is a Widget (text, buttons, layouts, etc.)',
    'Flutter has its own rendering engine — no native widgets',
    'Hot Reload lets you see changes instantly without restarting',
    'One codebase targets iOS, Android, Web, Windows, macOS, Linux',
    'Flutter uses a reactive programming model similar to React',
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
      child: SideNavBarChildEnum.flutterIntro,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterIntro;
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
