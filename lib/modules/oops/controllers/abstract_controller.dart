import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbstractController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ABSTRACT CLASS IN DART';
  final String intro = 'An abstract class is a class that cannot be instantiated directly. It serves as a template for other classes. Abstract methods have no implementation — subclasses must provide the implementation.';
  final String exampleTitle = 'Abstract Class Example';
  final String exampleCode = '''abstract class DatabaseConnector {
  String host;
  int port;

  DatabaseConnector(this.host, this.port);

  // Abstract methods - must be implemented by subclasses
  void connect();
  void disconnect();
  List<Map> query(String sql);

  // Concrete method
  void showConnection() {
    print('Connected to \$host:\$port');
  }
}

class MySQLConnector extends DatabaseConnector {
  MySQLConnector(String host, int port) : super(host, port);

  @override
  void connect() => print('MySQL connecting to \$host:\$port...');

  @override
  void disconnect() => print('MySQL disconnecting.');

  @override
  List<Map> query(String sql) {
    print('MySQL executing: \$sql');
    return [];
  }
}

void main() {
  MySQLConnector db = MySQLConnector('localhost', 3306);
  db.connect();
  db.showConnection();
  db.query('SELECT * FROM users');
  db.disconnect();
}''';
  final String exampleOutput = '''MySQL connecting to localhost:3306...
Connected to localhost:3306
MySQL executing: SELECT * FROM users
MySQL disconnecting.''';
  final List<String> tips = [
    'Abstract classes cannot be instantiated with new.',
    'Abstract methods have no body — subclasses must implement them.',
    'Abstract classes can have both abstract and concrete methods.',
    'Use abstract classes to define a common interface for subclasses.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.abstarctClassInDart);
    Get.find<AppBarController>().appBarTitle = SK.abstarctClassInDart;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
