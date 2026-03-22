import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InterfaceController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'INTERFACE IN DART';
  final String intro = 'In Dart, every class implicitly defines an interface. Use the implements keyword to implement an interface, which requires implementing all the methods of that class. Dart supports implementing multiple interfaces.';
  final String exampleTitle = 'Interface Example';
  final String exampleCode = '''abstract class Printable {
  void print();
}

abstract class Saveable {
  void save(String filename);
}

class Document implements Printable, Saveable {
  String title;
  String content;

  Document(this.title, this.content);

  @override
  void print() {
    print('--- \$title ---');
    print(content);
    print('--- End ---');
  }

  @override
  void save(String filename) {
    print('Saving "\$title" to \$filename...');
  }
}

void main() {
  Document doc = Document('Report', 'This is a quarterly report.');
  doc.print();
  doc.save('report.pdf');
}''';
  final String exampleOutput = '''--- Report ---
This is a quarterly report.
--- End ---
Saving "Report" to report.pdf...''';
  final List<String> tips = [
    'Use implements to implement one or more interfaces.',
    'All methods from implemented interfaces must be overridden.',
    'Dart does not have an interface keyword — any class can be an interface.',
    'Implementing multiple interfaces provides multiple type contracts.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.interface);
    Get.find<AppBarController>().appBarTitle = SK.interface;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
