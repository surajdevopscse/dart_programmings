import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

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
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
