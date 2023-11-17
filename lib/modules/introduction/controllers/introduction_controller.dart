import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String expresion = '''
 void main() {
  // Example of an expression
  int a = 5;
  int b = 3;
  int result = a + b * 2;
  a. 520
  b. 5+5
  c. 'Hello Dart World.'
  d. num , int 
}
''';
  String dart =
      'Dart is a client-optimized, object-oriented, programming language designed for building web, mobile, and desktop applications. It was developed by Google and first announced in 2011. Dart is known for its focus on simplicity, performance, and productivity.';

  List<List<String>> keyFeatures = [
    [
      'Object-Oriented:',
      'Dart is an object-oriented language, which means it supports concepts such as class, object, encapsulation, inheritance, polymorphism, interface, etc. You will in depth about oops in Next Chapters.'
    ],
    [
      'Garbage Collection:',
      'Dart uses garbage collection to automatically reclaim memory occupied by objects that are no longer in use, making memory management easier for developers.'
    ],
    [
      'Strong Typing:',
      'Dart is statically typed, which means variable types are known at compile-time. This can help catch certain types of errors before runtime, improving code reliability.'
    ],
    [
      'Concurrency Support:',
      'Dart supports asynchronous programming, allowing developers to write concurrent code that can handle multiple tasks without blocking the program\'s execution.'
    ],
    [
      'Cross-platform Development:',
      'Dart is often used in conjunction with the Flutter framework to build cross-platform mobile applications. Flutter allows developers to write code once and deploy it on both iOS and Android platforms.'
    ],
    [
      'Dart VM (Virtual Machine): ',
      'Dart comes with its virtual machine that allows it to be executed on the client-side, enabling the development of standalone Dart applications.'
    ],
    [
      'DartPad:',
      'DartPad is an online platform that allows developers to experiment with the Dart programming language in a web browser without the need for any installation. It provides a simple and interactive environment for writing, running, and sharing Dart code.'
    ],
    [
      'Free and open-source:',
      'Dart is free and open-source. It is released under the BSD (Berkeley Software Distribution) license. This means that developers are free to use, modify, and distribute Dart without significant restrictions. The open-source nature of Dart encourages collaboration and allows the community to contribute to its development.'
    ]
  ];

  List<List<String>> diffrence = [
    [
      'Dart',
      ' is a client optimized, object-oriented programming language. It is popular nowadays because of flutter. It is difficult to build complete apps only using Dart because you have to manage many things yourself.'
    ],
    [
      'Flutter',
      ' is a framework that uses dart programming language. With the help of flutter, you can build apps for android, iOS, web, desktop, etc. The framework contains ready-made tools to make apps faster.'
    ],
  ];

  List<List<String>> programingTerms = [
    [
      'Statements: ',
      'A statement is a command that tells a computer to do something. In Dart, you can end most statements with a semicolon ;.'
    ],
    [
      'Algorithm: ',
      'A step-by-step procedure or formula for solving a problem or accomplishing a task in a finite number of steps.'
    ],
    [
      'Expressions: ',
      'An Expression is a value or something that can be calculated as a value. The expression can be numbers, text, or some other type. For Example.'
    ],
    [
      'Variable: ',
      'A named storage location in a program where data can be stored and manipulated. Variables have a data type, such as integer, float, or string.'
    ],
    [
      'Keywords: ',
      'Keywords are reserved words that give special meaning to the dart compiler. For Example. int, if, switch, case, final,  var, String, const, etc'
    ],
    [
      'Identifiers: ',
      'Identifiers are names given to various program elements in programming languages. They serve as a way to uniquely identify and refer to variables, functions, classes, and other entities within a program'
    ],
    [
      'Comment: ',
      'Annotations in the code that are ignored by the compiler or interpreter. Comments are used to document code and improve its readability.'
    ],
    [
      'Debugging: ',
      'The process of finding and fixing errors, or bugs, in a program.'
    ],
    [
      'IDE (Integrated Development Environment): ',
      'A software suite that provides comprehensive facilities to programmers for software development. It typically includes a code editor, debugger, and compiler.'
    ],
    [
      'Compiler: ',
      'A program that translates source code written in a high-level programming language into machine code or an intermediate code.'
    ],
    [
      'API (Application Programming Interface): ',
      'A set of rules and tools for building software applications. APIs allow different software applications to communicate with each other.'
    ],
    [
      'High-Level Programming Language: ',
      'High-Level Programming Language is easy to learn, user-friendly, and uses English-like-sentence. For E.g. dart, c, java, etc.'
    ],
    [
      'Low-Level Programming Language: ',
      'Low-level programming language is hard to learn, non-user friendly, and deals with computer hardware components, e.g., machine and assembly language.'
    ],
    [
      'Syntax: ',
      'The set of rules that dictate the combinations of symbols and words that are considered to be correctly structured programs in a given programming language'
    ],
  ];

  List<String> keyPoints = [
    'Dart is a programming language used by flutter, the world’s most popular framework for building apps.',
    'Dart comes with a dart2js compiler which translates dart code to javascript code that runs on all modern browsers.',
    'Offers modern programming features like null safety and asynchronous programming.',
    'Can compile to either native code or javascript.',
    'Dart is a platform-independent language and supports almost every operating system such as windows, mac, and Linux.',
    'You can even use Dart for servers and backend.'
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
