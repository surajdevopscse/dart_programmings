import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterWebDesktopController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Flutter supports web and desktop (Windows, macOS, Linux) in addition to mobile. While the core Flutter code works across all platforms, you need to consider responsive design and platform-specific APIs.';
  String enableWebCode = '''# Enable Flutter web support (already enabled in Flutter 3.x)
\$ flutter config --enable-web

# List all available devices
\$ flutter devices

# Run on Chrome
\$ flutter run -d chrome

# Run on edge
\$ flutter run -d edge

# Check web support
\$ flutter doctor -v | grep Chrome

# Create project with web support
\$ flutter create --platforms=web,android,ios my_app

# pubspec.yaml — web-specific packages
# dependencies:
#   url_launcher: ^6.1.0
#   file_picker: ^6.0.0  # web-compatible
#   universal_html: ^2.2.4''';
  String enableDesktopCode = '''# Enable desktop platforms
\$ flutter config --enable-windows-desktop
\$ flutter config --enable-macos-desktop
\$ flutter config --enable-linux-desktop

# Run on desktop
\$ flutter run -d windows
\$ flutter run -d macos
\$ flutter run -d linux

# Build desktop
\$ flutter build windows --release
\$ flutter build macos --release
\$ flutter build linux --release

# Required: Visual Studio (Windows), Xcode (macOS), build-essential (Linux)

# Desktop-only packages:
# window_manager: ^0.3.0  — control window size/position
# tray_manager: ^0.2.0    — system tray integration
# local_notifier: ^0.1.0  — desktop notifications
# hotkey_manager: ^0.1.0  — keyboard shortcuts''';
  String responsiveCode = '''// Responsive design for multiple screen sizes
class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return const DesktopLayout();       // desktop: sidebar + content
        } else if (constraints.maxWidth >= 600) {
          return const TabletLayout();        // tablet: compact sidebar
        } else {
          return const MobileLayout();        // mobile: bottom nav / drawer
        }
      },
    );
  }
}

// Breakpoints
const mobileBreakpoint = 600.0;
const tabletBreakpoint = 900.0;
const desktopBreakpoint = 1200.0;

// Adaptive widgets
class AdaptiveScaffold extends StatelessWidget {
  const AdaptiveScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < mobileBreakpoint;

    return Scaffold(
      drawer: isMobile ? const AppDrawer() : null,
      body: Row(
        children: [
          if (!isMobile) const SideNavBar(),  // permanent sidebar on desktop
          Expanded(child: MainContent()),
        ],
      ),
      bottomNavigationBar: isMobile ? const BottomNav() : null,
    );
  }
}''';
  String platformCode = '''import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;

// Platform detection
bool get isWeb => kIsWeb;
bool get isAndroid => !kIsWeb && Platform.isAndroid;
bool get isIOS => !kIsWeb && Platform.isIOS;
bool get isWindows => !kIsWeb && Platform.isWindows;
bool get isMacOS => !kIsWeb && Platform.isMacOS;
bool get isLinux => !kIsWeb && Platform.isLinux;
bool get isDesktop => isWindows || isMacOS || isLinux;
bool get isMobile => isAndroid || isIOS;

// Conditional platform imports
import 'stub.dart'
    if (dart.library.io) 'native_platform.dart'
    if (dart.library.html) 'web_platform.dart';

// Mouse and keyboard for desktop
class DesktopInteraction extends StatelessWidget {
  const DesktopInteraction({super.key});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {},
        child: Focus(
          autofocus: true,
          onKeyEvent: (node, event) {
            if (event.logicalKey == LogicalKeyboardKey.escape) {
              // handle escape key
              return KeyEventResult.handled;
            }
            return KeyEventResult.ignored;
          },
          child: const Card(child: Text('Desktop Widget')),
        ),
      ),
    );
  }
}''';
  List<String> tips = [
    'Use LayoutBuilder or MediaQuery for responsive breakpoints',
    'Test your app on different screen sizes using Flutter DevTools',
    'Desktop apps need keyboard navigation and right-click context menus',
    'Web apps need SEO considerations — use flutter_meta_seo package',
    'Platform.isIOS/isAndroid throws on web — always check kIsWeb first',
    'Use adaptive_breakpoints or responsive_framework packages for easier responsive design',
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
      child: SideNavBarChildEnum.flutterWebDesktop,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterWebDesktop;
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
