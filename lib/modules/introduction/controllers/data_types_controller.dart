import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataTypesController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  List<String> dataTypes = [
    'Numbers',
    'Strings',
    'Boolean',
    'Lists',
    'Maps',
    'Sets',
    'Runes',
    'Null',
  ];

  List<List<String>> tableData = [
    ['Data Type', 'Keyword', 'Description.'],
    ['Number', 'int, double, num', 'It represents numeric values.'],
    ['Strings', 'String', 'It represents a sequence of characters.'],
    ['Booleans', 'bool', 'It represents Boolean values true and false.'],
    ['Lists', 'List', 'It is an ordered group of items.'],
    ['Maps', 'Map', 'It represents a set of values as key-value pairs.'],
    ['Sets', 'Set', 'It is an unordered list of unique values of same types.'],
    ['Runes', 'runes', 'It represents Unicode values of String.'],
    ['Null', 'null', 'It represents null value.'],
  ];

  List<List<String>> specialCharactor = [
    ['Special Character', 'Work'],
    ['\\n', 'New Line'],
    ['\\t', 'Tab'],
  ];
  String numbersExample = '''void main() {
// Declaring Variables  
int num1 = 100; // without decimal point.
double num2 = 130.2; // with decimal point.
num num3 = 50;
num  num4 = 50.4;  

// For Sum   
num sum = num1 + num2 + num3 + num4;
   
// Printing Info   
print("Num 1 is \$num1");
print("Num 2 is \$num2");  
print("Num 3 is \$num3");  
print("Num 4 is \$num4");  
print("Sum is \$sum");  
   
}''';

  String numbersOutput = '''Num 1 is 100
Num 2 is 130.2
Num 3 is 50
Num 4 is 50.4
Sum is 330.59999999999997''';

  String intExample = '''
int tempNum = 123456;

print('int value \${tempNum}');
''';
  String dobuleExample = '''
double i = 52.11 ;

print('double value \$i');
''';
  String intOutput = '''
int value 123456
''';
  String doubleOutput = '''
double value 52.11
''';

  String doubleValue2Decimal = '''
void main() {
// Declaring Variables
double price = 1130.2232323233233; // valid.
print(price.toStringAsFixed(2));
}
''';

  String stringExample = '''
void main() {
// Declaring Values     
String schoolName = "DAV School";
String address = "INDIA ,LUCKNOW  2140";   

// Printing Values
print("School name is \$schoolName and address is \$address.");   
}
''';

  String stringOutput = '''
School name is DAV School and address is INDIA ,LUCKNOW  2140.
''';

  String stringMultiLineString = '''
void main() {
// Multi Line Using Single Quotes   
String multiLineText = \'''
This is Multi Line Text
with 3 single quote
I am also writing here.
\''';
   
// Multi Line Using Double Quotes   
String otherMultiLineText ="""
This is Multi Line Text
with 3 double quote
I am also writing here.
""";
// Printing Information   
print("Multiline text is \$multiLineText");
print("Other multiline text is \$otherMultiLineText");
}''';

  String specialString = '''
void main() {
// Using \\n and \\t   
print("I am from \\nUS.");
print("I am from \\tUS.");
}
''';

  String specialStringOutput = '''
I am from 
US.
I am from 	US.
''';

  String rawString = '''
void main() {
// Set price value
num price = 10;
String withoutRawString = "The value of price is \\t \$price"; // regular String
String withRawString =r"The value of price is \\t \$price"; // raw String

print("Without Raw: \$withoutRawString"); // regular result
print("With Raw: \$withRawString"); // with raw result

}
''';

  String rawStringOutput = '''
Without Raw: The value of price is 	 10
With Raw: The value of price is \\t \$price
''';

  String convertStringIntoInt = '''
void main() {
String strvalue = "1";
print("Type of strvalue is \${strvalue.runtimeType}");   
int intvalue = int.parse(strvalue);
print("Value of intvalue is \$intvalue");
// this will print data type
print("Type of intvalue is \${intvalue.runtimeType}");
}
''';

  String convertStringIntoIntOutput = '''
Type of strvalue is String
Value of intvalue is 1
Type of intvalue is int
''';

  String stringToDouble = '''
void main() {
String strvalue = "1.1";
print("Type of strvalue is \${strvalue.runtimeType}");
double doublevalue = double.parse(strvalue);
print("Value of doublevalue is \$doublevalue");
// this will print data type
print("Type of doublevalue is \${doublevalue.runtimeType}");
}
''';

  String stringToDoubleOutput = '''
Type of strvalue is String
Value of doublevalue is 1.1
Type of doublevalue is double
''';

  String intToString = '''
void main() {
int one = 1;
print("Type of one is \${one.runtimeType}");
String oneInString = one.toString(); 
print("Value of oneInString is \$oneInString");
// this will print data type
print("Type of oneInString is \${oneInString.runtimeType}");
}
''';

  String intTStringOutput = '''
Type of one is int
Value of oneInString is 1
Type of oneInString is String
''';

  String doubleToInt = '''
void main() { 
   double num1 = 10.01;
   int num2 = num1.toInt(); // converting double to int

  print("The value of num1 is \$num1. Its type is \${num1.runtimeType}");
  print("The value of num2 is \$num2. Its type is \${num2.runtimeType}");
}
''';

  String doubleToIntOutput = '''
The value of num1 is 10.01. Its type is double
The value of num2 is 10. Its type is int

''';

  List<String> booleans = [
    'Are you single?',
    'Is the door close?',
    'Does a dog fly?',
    'Is the traffic light red?',
    'Are you older than your brother?',
  ];

  String boolExample = '''
void main() {
bool isSingle = true;
print("UnMarried Status: \$isSingle");
}
''';

  String boolExampleOutput = '''
UnMarried Status: true
''';

  String listExample = '''
void main() {
List<String> names = ["Raj", "Suraj", "Akash"];
print("Value of names is \$names");
print("Value of names[0] is \${names[0]}"); // index 0
print("Value of names[1] is \${names[1]}"); // index 1
print("Value of names[2] is \${names[2]}"); // index 2

  // Finding Length of List 
int length = names.length;  
print("The Length of names is \$length");
}
''';

  String listExampleOutput = '''
Value of names is [Raj, Suraj, Akash]
Value of names[0] is Raj
Value of names[1] is Suraj
Value of names[2] is Akash
The Length of names is 3
''';

  List<String> typesOfList = [
    'Fixed Length List',
    'Growable List',
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
      child: SideNavBarChildEnum.dataTypes,
    );
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
