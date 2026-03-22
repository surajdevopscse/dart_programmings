import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterviewHomeController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Prepare for your Flutter and Dart developer interviews with our comprehensive question bank. We cover beginner to advanced topics including Dart language features, Flutter framework, state management, and more.';
  List<String> features = [
    'Dart Q&A: 30+ questions covering null safety, async/await, OOP, generics, mixins, and Dart 3 features',
    'Flutter Q&A: 30+ questions covering widgets, state management, navigation, animations, and performance',
    'Mock Interview: Practice one question at a time with instant answer reveal',
    'Filter by difficulty: Beginner, Intermediate, Advanced',
    'Track your progress: Mark questions as reviewed',
    'Real code examples for every answer',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.interviewPrep,
      child: SideNavBarChildEnum.interviewHome,
    );
    Get.find<AppBarController>().appBarTitle = SK.interviewHome;
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
