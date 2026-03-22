import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClassAndObjectController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'CLASS AND OBJECT IN DART';
  final String intro = 'A class is a template, and an object is an instance created from that template. Understanding how classes and objects work together is the foundation of OOP.';
  final String exampleTitle = 'Class and Object Relationship';
  final String exampleCode = '''class BankAccount {
  String owner;
  double balance;

  BankAccount(this.owner, this.balance);

  void deposit(double amount) {
    balance += amount;
    print('Deposited \$amount. Balance: \$balance');
  }

  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print('Withdrew \$amount. Balance: \$balance');
    } else {
      print('Insufficient funds!');
    }
  }
}

void main() {
  BankAccount acc = BankAccount('Alice', 1000.0);
  acc.deposit(500.0);
  acc.withdraw(200.0);
  acc.withdraw(2000.0);
}''';
  final String exampleOutput = '''Deposited 500.0. Balance: 1500.0
Withdrew 200.0. Balance: 1300.0
Insufficient funds!''';
  final List<String> tips = [
    'A class can have many objects (instances).',
    'Each object maintains its own state.',
    'Methods are shared across all instances but operate on each objects data.',
    'Use this keyword to refer to the current object.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()..addListener(() { if (scrollController.offset >= 400) { showBackToTopButton = true; } else { showBackToTopButton = false; } });
    Get.find<SideMenuController>().selectPage(parent: SideNavBarParentEnum.oppsInDart, child: SideNavBarChildEnum.classAndObject);
    Get.find<AppBarController>().appBarTitle = SK.classAndObject;
    update();
    super.onInit();
  }

  void scrollToTop() { scrollController.animateTo(0, duration: const Duration(seconds: 1), curve: Curves.linear); }

  @override
  void dispose() { scrollController.dispose(); super.dispose(); }
}
