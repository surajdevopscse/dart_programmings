import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class HomeController extends GetxController {
  bool showBackToTopButton = false;

  // scroll controller
  late ScrollController scrollController;
  late VideoPlayerController videoController;

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
    videoController = VideoPlayerController.asset(
      I.homeVideo,
      videoPlayerOptions: VideoPlayerOptions(
        allowBackgroundPlayback: true,
      ),
    )..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.home,
    );
    update();
    super.onInit();
  }

  List<String> whyShouldLearnList = [
    'Huge community support',
    'Free and open source',
    'To be comfortable in a flutter',
    'To develop multi-platform apps for android, iOS, windows, mac, Linux, etc',
    'Fastest growing programming language',
    'It has rich set of libraries and tools.',
    'Mobile App Development using Flutter',
    'Single Codebase for Multiple Platforms',
  ];

  List<List<String>> featureList = [
    [
      'Flutter for Cross-Platform App Development:',
      'Dart is the primary programming language used in Flutter, a popular open-source framework for building natively compiled applications for mobile, web, and desktop from a single codebase. Learning Dart is essential if you want to develop cross-platform mobile apps efficiently.'
    ],
    [
      'Productivity and Readabilit:',
      'Dart has a clean and straightforward syntax, making it easy to learn and read. It emphasizes developer-friendliness with features like type inference, strong static typing, and concise code. This can lead to increased productivity in your development work.'
    ],
    [
      'Strong Ecosystem:',
      'Dart\'s ecosystem is growing, with a growing number of packages and libraries available on pub.dev. This allows you to leverage existing code to enhance your projects and build applications more quickly.'
    ],
    [
      'Performance:',
      'Dart is known for its high performance. It compiles to native machine code, resulting in fast and smooth applications. For mobile app development, this performance is crucial for delivering a seamless user experience.'
    ],
    [
      'Single Codebase for Multiple Platforms:',
      'Dart, in conjunction with Flutter, enables you to write code once and run it on multiple platforms, including iOS, Android, web, and desktop. This "write once, run anywhere" approach can save time and resources in the long run.'
    ],
    [
      'Community and Support:',
      'Dart has an active and supportive community. You can find extensive documentation, tutorials, and help from fellow developers in case you encounter issues or have questions.'
    ],
    [
      'Concurrent Programming:',
      'Dart offers built-in support for isolates, which are lightweight concurrent processes that can run in parallel. This feature is beneficial for tasks that require concurrent execution and managing heavy workloads.'
    ],
    [
      'Stable and Backed by Google:',
      'Dart is developed and maintained by Google, providing it with a stable and reputable backing. This can be reassuring for developers looking for a language with strong support.'
    ],
    [
      'Modern Tooling:',
      'Dart offers a range of development tools, including a package manager (pub), a development server, and excellent debugging support. Various integrated development environments (IDEs) and code editors support Dart, making it a convenient language to work with.'
    ],
  ];
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
