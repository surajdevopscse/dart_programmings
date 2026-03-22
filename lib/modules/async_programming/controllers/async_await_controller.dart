import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AsyncAwaitController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ASYNC AND AWAIT IN DART';
  final String intro =
      'The async and await keywords in Dart make asynchronous code easy to read and write. A function marked with async returns a Future, and await pauses execution within that function until the awaited Future completes.';
  final String exampleTitle = 'Async and Await Example';
  final String exampleCode = '''Future<String> fetchUser(int id) async {
  await Future.delayed(Duration(milliseconds: 300));
  return 'User#\$id';
}

Future<List<String>> fetchOrders(String user) async {
  await Future.delayed(Duration(milliseconds: 300));
  return ['\$user - Order1', '\$user - Order2'];
}

Future<void> processUserOrders(int userId) async {
  try {
    print('Processing user \$userId...');
    String user = await fetchUser(userId);
    print('Fetched: \$user');

    List<String> orders = await fetchOrders(user);
    print('Orders: \$orders');

    print('Processing complete.');
  } catch (e) {
    print('Error: \$e');
  } finally {
    print('Cleanup done.');
  }
}

void main() async {
  await processUserOrders(42);
  print('All done!');
}''';
  final String exampleOutput = '''Processing user 42...
Fetched: User#42
Orders: [User#42 - Order1, User#42 - Order2]
Processing complete.
Cleanup done.
All done!''';
  final List<String> tips = [
    'Mark a function with async to use await inside it.',
    'An async function always returns a Future.',
    'await can only be used inside async functions.',
    'Use try/catch/finally inside async functions for error handling.',
    'Avoid blocking the event loop with heavy synchronous code in async functions.',
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
      parent: SideNavBarParentEnum.asyncProgram,
      child: SideNavBarChildEnum.asyncAndAwait,
    );
    Get.find<AppBarController>().appBarTitle = SK.asyncAndAwait;
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
