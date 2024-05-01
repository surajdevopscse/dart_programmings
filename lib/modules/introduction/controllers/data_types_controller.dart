import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
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

  String fixedList = '''
var list_name = new List(initial_size)
--------------------------------------------------------------------
void main() { 
   var lst = List(3); 
   lst[0] = 12; 
   lst[1] = 13; 
   lst[2] = 11; 
   print(lst); 
}
Output:
[12, 13, 11]
''';

  String growableeList = '''
var list_name = [val1,val2,val3]   
--- creates a list containing the specified values  
OR  
var list_name = [] 
--- creates a list of size zero
--------------------------------------------------------------------
void main() { 
   var num_list = [1,2,3]; 
   print(num_list); 
}
Output:
[1, 2, 3]
''';

  List<List<String>> listProperties = [
    ['Propeerties', 'Work'],
    ['first', 'Returns the first element case.'],
    ['isEmpty', 'Returns true if the collection has no elements.'],
    ['isNotEmpty', 'Returns true if the collection has at least one element.'],
    ['length', 'Returns the size of the list.'],
    ['last', 'Returns the last element in the list.'],
    [
      'reversed',
      'Returns an iterable object containing the lists values in the reverse order.'
    ],
    ['Single', 'Checks if the list has only one element and returns it.'],
    ['add', ' Adds an element to the end of the list.'],
    ['insert', ' Inserts an element at a specified index.'],
    ['remove', 'Removes the first occurrence of a specified value.'],
    ['removeAt', 'Removes the element at the specified index..'],
    ['contains', 'Checks if the list contains a specified element.'],
    ['forEach', 'Executes a function on each element in the list.'],
    [
      'map',
      'Returns a new list containing the results of applying a function to each element in the original list.'
    ],
    [
      'where',
      'Returns a new list containing only the elements that satisfy a predicate function.'
    ],
    [
      'fold',
      'Combines all elements of the list into a single value by applying a function.'
    ],
    ['reduce', ' Similar to fold, but doesn\'t require an initial value.'],
    ['sort', 'Sorts the list in ascending order.'],
    [
      'sublist',
      'Returns a new list containing a portion of the original list.'
    ],
  ];

  String listPropertiesExample = '''
void main() {
  // Example list
  List<int> numbers = [1, 2, 3, 4, 5];

  // first: Returns the first element
  int firstElement = numbers.first;
  print("First element: \$firstElement");

  // isEmpty: Returns true if the collection has no elements
  bool empty = numbers.isEmpty;
  print("Is the list empty? \$empty");

  // isNotEmpty: Returns true if the collection has at least one element
  bool notEmpty = numbers.isNotEmpty;
  print("Is the list not empty? \$notEmpty");

  // length: Returns the size of the list
  int listLength = numbers.length;
  print("Length of the list: \$listLength");

  // last: Returns the last element in the list
  int lastElement = numbers.last;
  print("Last element: \$lastElement");

  // reversed: Returns an iterable object containing the list's values in reverse order
  Iterable<int> reversedList = numbers.reversed;
  print("Reversed list: \$reversedList");

  // Single: Checks if the list has only one element and returns it
  List<int> singleElementList = [7];
  int singleElement = singleElementList.single;
  print("Single element: \$singleElement");

  // add: Adds an element to the end of the list
  numbers.add(6);
  print("List after adding element: \$numbers");

  // insert: Inserts an element at a specified index
  numbers.insert(2, 10);
  print("List after inserting element: \$numbers");

  // remove: Removes the first occurrence of a specified value
  numbers.remove(3);
  print("List after removing element: \$numbers");

  // removeAt: Removes the element at the specified index
  numbers.removeAt(0);
  print("List after removing element at index 0: \$numbers");

  // contains: Checks if the list contains a specified element
  bool containsElement = numbers.contains(10);
  print("Does the list contain 10? \$containsElement");

  // indexOf: Returns the index of the first occurrence of a specified value
  int index = numbers.indexOf(5);
  print("Index of element 5: \$index");

  // forEach: Executes a function on each element in the list
  numbers.forEach((element) {
    print("Element: \$element");
  });

  // map: Returns a new list containing the results of applying a function to each element in the original list
  List<int> squaredNumbers = numbers.map((number) => number * number).toList();
  print("Squared numbers: \$squaredNumbers");

  // where: Returns a new list containing only the elements that satisfy a predicate function
  List<int> evenNumbers = numbers.where((number) => number % 2 == 0).toList();
  print("Even numbers: \$evenNumbers");

  // fold: Combines all elements of the list into a single value by applying a function
  int sum = numbers.fold(0, (prev, element) => prev + element);
  print("Sum of all elements: \$sum");

  // reduce: Similar to fold, but doesn't require an initial value
  int product = numbers.reduce((prev, element) => prev * element);
  print("Product of all elements: \$product");

  // sort: Sorts the list in ascending order
  numbers.sort();
  print("Sorted list: \$numbers");

  // sublist: Returns a new list containing a portion of the original list
  List<int> sublist = numbers.sublist(2, 4);
  print("Sublist from index 2 to 4: \$sublist");

}

''';

  String listPropertiesExampleOutput = '''
First element: 1
Is the list empty? false
Is the list not empty? true
Length of the list: 5
Last element: 5
Reversed list: (5, 4, 3, 2, 1)
Single element: 7
List after adding element: [1, 2, 3, 4, 5, 6]
List after inserting element: [1, 2, 10, 3, 4, 5, 6]
List after removing element: [1, 2, 10, 4, 5, 6]
List after removing element at index 0: [2, 10, 4, 5, 6]
Does the list contain 10? true
Index of element 5: 3
Element: 2
Element: 10
Element: 4
Element: 5
Element: 6
Squared numbers: [1, 4, 9, 16, 25]
Even numbers: [2, 4]
Sum of all elements: 15
Product of all elements: 120
Sorted list: [1, 2, 3, 4, 5]
Sublist from index 2 to 4: [3, 4]
''';

  String maps = '''
void main() { 
   var details = {'Usrname':'harry','Password':'pass@123'}; 
   print(details); 
}
Output :
{Usrname: tom, Password: pass@123}

*********************************************************

void main() { 
   var details = {'Usrname':'harry','Password':'pass@123'}; 
   details['Uid'] = 'U1oo1'; 
   print(details); 
}
Output :
{Usrname: harry, Password: pass@123, Uid: U1oo1}
''';

  List<List<String>> mapProperties = [
    ['keys', 'Returns an iterable object representing keys'],
    ['values', 'Returns an iterable object representing values'],
    ['length', 'Returns the size of the Map'],
    ['isEmpty', 'Returns true if the Map is an empty Map'],
    ['isNotEmpty', 'Returns true if the Map is not an empty Map'],
    ['containsKey', 'Returns true if the map contains the given key'],
    ['containsValue', 'Returns true if the map contains the given value'],
    [
      'remove',
      'removes the entry for the given key and returns its value, or null if it does not exist'
    ],
    [
      'putIfAbsent',
      'Adds a new entry to the map if the given key does not exist'
    ],
    ['clear', 'Removes all key-value pairs from the map'],
    [
      'entries',
      'Returns an iterable object representing key-value pairs (entries)'
    ],
    [
      'update',
      'Updates the value of the entry with the specified key if it exists, otherwise adds a new entry'
    ],
    ['forEach', 'Applies a function to each key-value pair in the map'],
    ['addAll', 'Adds all key-value pairs from another map to this map'],
    [
      'removeWhere',
      'Removes all entries for which the provided predicate returns true'
    ],
    [
      'putIfAbsent',
      'Adds a new entry to the map if the given key does not exist, with a value computed by the provided function'
    ],
    [
      'updateAll',
      'Updates all values in the map by applying a provided function'
    ],
    [
      'cast',
      'Returns a new map with the same keys and values but with a different static type'
    ],
    [
      'map',
      'Returns a new map with the same keys as this map, but with values transformed by a given function'
    ],
    ['toString', 'Returns a string representation of the map'],
  ];

  String mapPropertiesExapmle = '''
Map<String, int> myMap = {
    'apple': 10,
    'banana': 5,
    'orange': 7,
  };

  // Keys
  print('Keys: \${myMap.keys}'); // Output: {apple, banana, orange}

  // Values
  print('Values: \${myMap.values}'); // Output: {10, 5, 7}

  // Length
  print('Length: \${myMap.length}'); // Output: 3

  // IsEmpty
  print('IsEmpty: \${myMap.isEmpty}'); // Output: false

  // IsNotEmpty
  print('IsNotEmpty: \${myMap.isNotEmpty}'); // Output: true

  // ContainsKey
  print('ContainsKey for "apple": \${myMap.containsKey('apple')}'); // Output: true

  // ContainsValue
  print('ContainsValue for 5: \${myMap.containsValue(5)}'); // Output: true

  // Remove
  var removedValue = myMap.remove('banana');
  print('Removed value for "banana": \$removedValue'); // Output: Removed value for "banana": 5

  // PutIfAbsent
  myMap.putIfAbsent('grape', () => 20);
  print('Map after PutIfAbsent: \$myMap'); // Output: {apple: 10, orange: 7, grape: 20}

  // Clear
  myMap.clear();
  print('Map after Clear: \$myMap'); // Output: Map after Clear: {}

  // Entries
  var entries = myMap.entries;
  print('Entries: \$entries'); // Output: Entries: {}

  // Update
  myMap.update('apple', (value) => value + 5, ifAbsent: () => 5);
  print('Map after Update: \$myMap'); // Output: {apple: 15}

  // forEach
  myMap.forEach((key, value) => print('\$key: \$value')); // Output: apple: 15

  // AddAll
  myMap.addAll({'banana': 10, 'orange': 12});
  print('Map after AddAll: \$myMap'); // Output: {apple: 15, banana: 10, orange: 12}

  // RemoveWhere
  myMap.removeWhere((key, value) => value < 13);
  print('Map after RemoveWhere: \$myMap'); // Output: {orange: 12}

  // putIfAbsent
  myMap.putIfAbsent('apple', () => 10);
  print('Map after putIfAbsent: \$myMap'); // Output: {orange: 12, apple: 10}

  // UpdateAll
  myMap.updateAll((key, value) => value * 2);
  print('Map after UpdateAll: \$myMap'); // Output: {orange: 24, apple: 20}

  // Map
  var mapped = myMap.map((key, value) => MapEntry(key.toUpperCase(), value));
  print('Mapped Map: \$mapped'); // Output: Mapped Map: {ORANGE: 24, APPLE: 20}
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
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.dataTypes,
    );
    Get.find<AppBarController>().appBarTitle = SK.dataTypes;
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
