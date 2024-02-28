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
