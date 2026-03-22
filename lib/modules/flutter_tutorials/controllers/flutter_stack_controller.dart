import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterStackController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Stack allows widgets to overlap each other. Children are painted in order, with the last child on top. Use Positioned to place children at specific positions within the Stack.';
  String stackCode = '''// Stack — overlapping widgets
Stack(
  alignment: Alignment.center,
  children: [
    // Bottom layer — background image
    Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: NetworkImage('https://picsum.photos/300/200'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    // Middle layer — gradient overlay
    Container(
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
        ),
      ),
    ),
    // Top layer — text content
    const Positioned(
      bottom: 16,
      left: 16,
      right: 16,
      child: Text(
        'Beautiful Landscape',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
)''';
  String positionedCode = '''// Positioned — places child at specific location in Stack
Stack(
  children: [
    // Base widget fills the Stack
    Container(color: Colors.grey[200], width: 300, height: 300),

    // Positioned from top-left
    const Positioned(
      top: 10,
      left: 10,
      child: Icon(Icons.star, color: Colors.yellow, size: 40),
    ),

    // Positioned from bottom-right
    const Positioned(
      bottom: 10,
      right: 10,
      child: Icon(Icons.favorite, color: Colors.red, size: 40),
    ),

    // Centered with specific size
    const Positioned(
      top: 120,
      left: 120,
      width: 60,
      height: 60,
      child: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text('C', style: TextStyle(color: Colors.white)),
      ),
    ),
  ],
)''';
  String overlayExample = '''// Notification badge example using Stack
Stack(
  clipBehavior: Clip.none,
  children: [
    const Icon(Icons.notifications, size: 32),
    Positioned(
      top: -6,
      right: -6,
      child: Container(
        width: 18,
        height: 18,
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Text(
            '3',
            style: TextStyle(color: Colors.white, fontSize: 11),
          ),
        ),
      ),
    ),
  ],
)''';
  List<String> tips = [
    'Stack sizes itself to the largest non-Positioned child by default',
    'Positioned children are excluded from Stack size calculation',
    'Use clipBehavior: Clip.none to allow Positioned children outside Stack bounds',
    'alignment property aligns non-Positioned children',
    'IndexedStack shows only one child at a time (great for tab views)',
    'Stack + Positioned is ideal for floating badges, tooltips, and overlays',
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
      child: SideNavBarChildEnum.flutterStack,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterStack;
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
