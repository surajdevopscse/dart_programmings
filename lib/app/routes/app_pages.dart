// ignore_for_file: constant_identifier_names

import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:get/get.dart';
import '../../modules/home/bindings/dashboard_binding.dart';
import '../../modules/home/pages/home_page.dart';
import '../../modules/control_flow/control_flow_and_loops/bindings/control_flow_binding.dart';
import '../../modules/introduction_and_syntax/introduction/bindings/introduction_binding.dart';
import '../../modules/introduction_and_syntax/introduction/pages/introduction_to_dart.dart';

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
      page: () => const IntroductionToDart(),
      transition: Transition.rightToLeft,
      binding: IntroductionBinding(),
      children: [
        GetPage(
          name: _Paths.INSTALL_DART,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.DART_BASIC,
          transition: Transition.rightToLeft,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
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
  ];
}
