import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasicDartController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;
  String dart =
      'This is a simple dart program that prints Hello World on screen. Most programmers write the Hello World program as their first program.';
  String helloWorld = '''
void main() { 
   print("Hello World!"); 
}''';
  String helloWorldOutput = 'Hello World!';

  String printingName = '''
void main()
{
    var name = "Hello Suraj";
    print(name);
}''';
  String printingNameOutput = 'Hello Suraj';

  String joinVaribaleName = '''
void main(){
  var firstName = "Suraj";
  var lastName = "Yadav";
  print("Full name \$firstName \$lastName");
}''';
  String joinVaribaleNameOutput = 'Full name Suraj Yadav';

  String basicCalculation = '''
void main() {
int num1 = 10; //declaring number1
int num2 = 3; //declaring number2
  
// Calculation
int sum = num1 + num2;
int diff = num1 - num2;
int mul = num1 * num2;
double div = num1 / num2; // It is double because it outputs number with decimal.
  
// displaying the output
print("The sum is \$sum");
print("The diff is \$diff");
print("The mul is \$mul");
print("The div is \$div");
}''';
  String basicCalculationOutput = '''
The sum is 13
The diff is 7
The mul is 30
The div is 3.3333333333333335''';

  String createFullProject = '''
dart create <project_name>''';
  String dartRun = '''
dart run''';

  List<String> explainationBasic = [
    'void main() is the starting point where the execution of your program begins.',
    'Every program starts with a main function.',
    'The curly braces {} represent the beginning and the ending of a block of code.',
    'print(“Hello World!”); prints Hello World! on screen.',
    'Each code statement must end with a semicolon.',
    'The semicolon (;) is used as a statement terminator. It indicates the end of a statement. The presence of a semicolon tells the compiler or interpreter that the current statement has ended, and the next one can begin.',
  ];

  List<String> stepsToCreateProject = [
    'Open folder location on command prompt/terminal.',
    'Type dart create project_name (For E.g. dart create first_app).',
    'Type cd first_app.',
    'Type code . to open project with visual studio code.',
    'To check the main dart file go to bin/first_app.dart and edit your code.',
  ];

  final List<Map<String, String>> convertDartToJavaScript = [
    {
      'Command': 'dart compile js filename.dart',
      'Description':
          'Compile dart to javascript. You can run this file with Node.js.'
    },
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
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.dartBasic,
    );
    Get.find<AppBarController>().appBarTitle = SK.dartBasic;
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
