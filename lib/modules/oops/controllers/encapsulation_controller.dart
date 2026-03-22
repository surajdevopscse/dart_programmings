import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EncapsulationController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'ENCAPSULATION IN DART';
  final String intro = 'Encapsulation is the practice of hiding the internal details of a class and exposing only what is necessary. In Dart, use the underscore prefix (_) to make fields and methods private to the library.';
  final String exampleTitle = 'Encapsulation Example';
  final String exampleCode = '''class Employee {
  String _name;
  double _salary;

  Employee(this._name, this._salary);

  String get name => _name;
  double get salary => _salary;

  set salary(double value) {
    if (value > 0) {
      _salary = value;
    } else {
      print('Invalid salary!');
    }
  }

  void giveRaise(double percent) {
    _salary += _salary * (percent / 100);
    print('\$_name got a \$percent% raise. New salary: \$_salary');
  }
}

void main() {
  Employee emp = Employee('Alice', 50000);
  print('Name: \${emp.name}, Salary: \${emp.salary}');
  emp.giveRaise(10);
  emp.salary = -1000; // Invalid
}''';
  final String exampleOutput = '''Name: Alice, Salary: 50000.0
Alice got a 10.0% raise. New salary: 55000.0
Invalid salary!''';
  final List<String> tips = [
    'Use _ prefix for private fields in Dart.',
    'Private members are accessible within the same file (library).',
    'Use getters and setters to control access to private fields.',
    'Encapsulation protects internal state from invalid modifications.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.encapsulation);
    Get.find<AppBarController>().appBarTitle = SK.encapsulation;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
