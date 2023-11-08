// ignore_for_file: constant_identifier_names

import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:get/get.dart';
import '../modules/home/bindings/dashboard_binding.dart';
import '../modules/home/pages/home_page.dart';
import '../modules/control_flow/control_flow_and_loops/bindings/control_flow_binding.dart';
import '../modules/leads/add_leads/bindings/add_leads_binding.dart';
import '../modules/leads/add_leads/pages/add_leads_page.dart';

import '../modules/leads/leads/bindings/leads_binding.dart';
import '../modules/leads/leads/pages/leads_page.dart';
import '../modules/licence/add_licence/bindings/add_licence_binding.dart';
import '../modules/licence/add_licence/pages/add_licence_page.dart';
import '../modules/licence/licence/bindings/licence_binding.dart';
import '../modules/licence/licence/pages/licence_page.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/pages/login_page.dart';
import '../modules/introduction_and_syntax/introduction/bindings/introduction_binding.dart';
import '../modules/introduction_and_syntax/introduction/pages/introduction_to_dart.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),

    //Home
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),

    //Introductions
    GetPage(
      name: _Paths.INTRODUCION,
      page: () => const IntroductionToDart(),
      binding: IntroductionBinding(),
      children: [
        GetPage(
          name: _Paths.INSTALL_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.DART_BASIC,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.VARIABLE_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.DATA_TYPES_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.COMMENTS_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.OPRATOR_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.USER_INPUT_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.STRING_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
        GetPage(
          name: _Paths.KEYWORDS_IN_DART,
          page: () => const ComingSoonPage(),
          binding: IntroductionBinding(),
        ),
      ],
    ),

    //Control Flow
    GetPage(
      name: _Paths.CONDITIONS,
      page: () => const ComingSoonPage(),
      binding: ControlFlowBinding(),
      children: [
        GetPage(
          name: _Paths.ASSERT,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.SWITCH,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.TERNERY,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.LOOPS,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FORLOOP,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.FOREACHLOOP,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.WHILE,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.DOWHILE,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.BREAK,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
        GetPage(
          name: _Paths.EXCEPTION,
          page: () => const ComingSoonPage(),
          binding: ControlFlowBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LEADS,
      page: () => const LeadsPage(),
      binding: LeadsBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_LEADS,
          page: () => const AddLeadsPage(),
          binding: AddLeadsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.LICENCE,
      page: () => const LicencePage(),
      binding: LicenceBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_LICENCE,
          page: () => const AddLicencePage(),
          binding: AddLicenceBinding(),
        ),
      ],
    ),
  ];
}
