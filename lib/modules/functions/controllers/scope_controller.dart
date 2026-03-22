import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScopeController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  final String title = 'SCOPE IN DART';
  final String intro =
      'Scope refers to the region of code where a variable is accessible. Dart uses lexical scoping, meaning a variable is accessible within the block in which it is declared and in any nested blocks.';

  final String localScopeTitle = 'Local Scope';
  final String localScopeDesc =
      'Variables declared inside a function or block are only accessible within that function or block.';
  final String localScopeCode = '''void main() {
  int localVar = 10; // local to main

  if (localVar > 5) {
    int blockVar = 20; // local to this if block
    print('blockVar: \$blockVar');
    print('localVar inside if: \$localVar');
  }

  print('localVar: \$localVar');
  // print(blockVar); // Error: blockVar not in scope here
}''';
  final String localScopeOutput = '''blockVar: 20
localVar inside if: 10
localVar: 10''';

  final String globalScopeTitle = 'Global (Top-Level) Scope';
  final String globalScopeDesc =
      'Variables declared at the top level of a file are accessible throughout the entire file.';
  final String globalScopeCode = '''String appName = 'DartApp'; // global variable
int version = 1;

void showInfo() {
  print('\$appName v\$version');
}

void incrementVersion() {
  version++;
}

void main() {
  showInfo();
  incrementVersion();
  showInfo();
}''';
  final String globalScopeOutput = '''DartApp v1
DartApp v2''';

  final String lexicalTitle = 'Lexical Scoping';
  final String lexicalDesc =
      'Dart uses lexical scoping: inner functions can access variables from outer functions.';
  final String lexicalCode = '''void outer() {
  String outerVar = 'I am outer';

  void inner() {
    String innerVar = 'I am inner';
    print(outerVar); // can access outer variable
    print(innerVar);
  }

  inner();
  // print(innerVar); // Error: innerVar not accessible here
}

void main() {
  outer();
}''';
  final String lexicalOutput = '''I am outer
I am inner''';

  final List<String> tips = [
    'Variables have the narrowest scope needed — declare them close to where they are used.',
    'Avoid global variables when possible; prefer passing values as parameters.',
    'Inner scopes can read variables from outer scopes (lexical scoping).',
    'Outer scopes cannot access variables from inner scopes.',
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
      parent: SideNavBarParentEnum.functions,
      child: SideNavBarChildEnum.scope,
    );
    Get.find<AppBarController>().appBarTitle = SK.scope;
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
