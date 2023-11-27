// ignore_for_file: constant_identifier_names

import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:dart_programing/modules/introduction/bindings/basic_dart_binding.dart';
import 'package:dart_programing/modules/introduction/bindings/install_dart_binding.dart';
import 'package:dart_programing/modules/introduction/pages/basic_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/install_dart_page.dart';
import 'package:get/get.dart';
import '../../modules/home/bindings/dashboard_binding.dart';
import '../../modules/home/pages/home_page.dart';
import '../../modules/control_flow_and_loops/bindings/control_flow_binding.dart';
import '../../modules/introduction/bindings/introduction_binding.dart';
import '../../modules/introduction/pages/introduction_to_dart_page.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    //Home
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      transition: Transition.rightToLeft,
      binding: HomeBinding(),
    ),

    //Introductions
    GetPage(
      name: _Paths.INTRODUCION,
      page: () => const IntroductionToDartPage(),
      transition: Transition.rightToLeft,
      binding: IntroductionBinding(),
      children: [
        GetPage(
          name: _Paths.INSTALL_DART,
          transition: Transition.rightToLeft,
          page: () => const InstallDartPage(),
          binding: InstallDartBinding(),
        ),
        GetPage(
          name: _Paths.DART_BASIC,
          transition: Transition.rightToLeft,
          page: () => const BasicDartPage(),
          binding: BasicDartBinding(),
        ),
        GetPage(
          name: _Paths.VARIABLE_IN_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.DATA_TYPES_IN_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.COMMENTS_IN_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.OPRATOR_IN_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.USER_INPUT_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          transition: Transition.rightToLeft,
          name: _Paths.STRING_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.KEYWORDS_IN_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.FINAL_VS_CONST,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.DATETIME,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
      ],
    ),

    //Control Flow
    GetPage(
      name: _Paths.CONDITIONS,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.ASSERT,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.SWITCH,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.TERNERY,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.LOOPS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FORLOOP,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FOREACHLOOP,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.WHILE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.DOWHILE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.BREAK,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.EXCEPTION,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),

    //Functions in Dart
    GetPage(
      name: _Paths.FUNCTIONS,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.TYPESOFFUNCTIONS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FUNCTIONPARAMETER,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ANONYMOUSFUNCTIONS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ARROWFUNCTIONS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.SCOPE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.MATHINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),

    //Collections in Dart
    GetPage(
      name: _Paths.LISTINDART,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.SETINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.MAPINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.WHERE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),

    //File Handling in Dart
    GetPage(
      name: _Paths.READFILE,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.WRITEFILE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.DELETEFILE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),

    //OOPs in Dart
    GetPage(
      name: _Paths.OOPSINDART,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.CLASINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.OBJECTINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.CONSTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.DEFAULTCONSTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.PARAMETERIZEDCONSTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.NAMEDCONSTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.CONSTANTCONTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ENCAPSULATION,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.GETTER,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.SETTER,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.INHERITENCE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.POLYMORPHISM,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.STATIS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.SUPERINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ABSTRACTINDSRT,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.INTERFACE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.MIXINDART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ENUM,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.GENERIC,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.EXTENSION,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.CALLABLEOBJECT,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FACTORYCONSTRUCTOR,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),

    //Null Safety
    GetPage(
      name: _Paths.NullSAFETY,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.TYPEPROMOTIONS,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.LATE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),
    //Async Programming
    GetPage(
      name: _Paths.ASYNCPROGRAMMING,
      transition: Transition.rightToLeft,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.FUTURE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ASYNCANDAWAIT,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.STREAM,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.ISOLATE,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),
  ];
}
