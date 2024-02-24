import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VaribalesController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String varibales =
      'Consider variables as containers that store data; data types determine the data type they can keep. For example, a variable can have a number, a word, or even a collection of values. Here is an example of creating a variable and initializing it';

  String helloWorld = '''
void main() { 
   print("Hello World!"); 
}''';
  String variableExample = '''
// here variable name contains value John.
var name = "Suraj";
''';

  String variableUseExample = '''
void main() {
// declaring variables
String name = "Suraj";
String address = "Lucknow";  
num age = 30; // used to store any types of numbers 
num height = 5.9;
bool isMarried = false;
   
// printing variables value   
print("Name is \$name");
print("Address is  \$address");
print("Age is  \$age");
print("Height is  \$height");
print("Married Status is  \$isMarried");
}
''';

  String varibaleUseExampleOutput = '''
Name is Suraj
Address is Lucknow
Age is 30
Height is 5.9
Married Status is false
''';
  List<List<String>> typesOfVariables = [
    ['String: ', 'For storing text value. E.g. “John” [Must be in quotes].'],
    [
      'int: ',
      'For storing integer value. E.g. 10, -10, 8555 [Decimal is not included].'
    ],
    [
      'double: ',
      'For storing floating point values. E.g. 10.0, -10.2, 85.698 [Decimal is included].'
    ],
    [
      'num: ',
      'For For storing any type of number. E.g. 10, 20.2, -20 [both int and double].'
    ],
    [
      'bool: ',
      'For storing true or false. E.g. true, false [Only stores true or false values].'
    ],
    ['var: ', 'For storing any value. E.g. ‘Bimal’, 12, ‘z’, true'],
  ];

  List<String> rulesForVariblesCreating = [
    'Variable names are case sensitive, i.e., a and A are different.',
    'A variable name can consist of letters and alphabets.',
    'A variable name cannot start with a number.',
    'Keywords are not allowed to be used as a variable name.',
    'Blank spaces are not allowed in a variable name.',
    'Special characters are not allowed except for the underscore (_) and the dollar (\$) sign.',
  ];

  List<String> typesOfVaribales = [
    'Top-level variables.',
    'Static variables.',
    'Instance variables.',
    'Local variables.',
  ];

  String staticVarExample = '''
void main() {

print(A.id);

}

class A {

static int id = 0;

}

''';

  String instanceVarExample = '''
void main(List<String> args) {

Car toyota = Car(color: “Red”, model: “RAV4”);

Car nissan = Car(color: “Yellow”, model: “Altima”);

print(toyota.model); // RAV4

print(nissan.model); // Altima

}

class Car{

String color;

String model;

Car({this.color, this.model});

}''';

  String localVarExample = '''
void main(List<String> args) {

print(calculate(4)); // 5

}

int calculate(int number){

int x = 5;

return x+number;

}''';
  String constants =
      'Constant is the type of variable whose value never changes. In programming, changeable values are mutable and unchangeable values are immutable. Sometimes, you don’t need to change the value once declared. Like the value of PI=3.14, it never changes. To create a constant in Dart, you can use the const keyword';

  String constantsExample = '''
void main(){
const pi = 3.14;
pi = 4.23; // not possible  
print("Value of PI is \$pi");
}''';

  String nameingConvention =
      'It is a good habit to follow the naming convention. In Dart Variables, the variable name should start with lower-case, and every second word’s first letter will be upper-case like num1, fullName, isMarried, etc. Technically, this naming convention is called lowerCamelCase.';

  String nameingConvetionExample = '''
// Not standard way
var fullname = "Suraj Yadav";
// Standard way
var fullName = "Suraj Yadav";
const pi = 3.14;
''';
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
    scrollController.animateTo(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.linear,
    );
  }
}
