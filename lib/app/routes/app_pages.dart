// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/home/bindings/dashboard_binding.dart';
import '../modules/home/pages/home_page.dart';
import '../modules/employees/employee_profile/bindings/employee_profile_binding.dart';
import '../modules/employees/employee_profile/pages/employee_profile_page.dart';
import '../modules/employees/employees/bindings/employees_binding.dart';
import '../modules/employees/employees/pages/employees_page.dart';
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
import '../modules/introduction_and_syntax/add_sub_partner/bindings/add_sub_partner_binding.dart';
import '../modules/introduction_and_syntax/add_sub_partner/pages/add_sub_partner_page.dart';
import '../modules/introduction_and_syntax/introduction/bindings/introduction_binding.dart';
import '../modules/introduction_and_syntax/introduction/pages/introduction_to_dart.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  // static const INITIAL = Routes.LOGIN;
  static const INITIAL = Routes.HOME;

  // static const INITIAL = Routes.EMPLOYEES;
  // static const INITIAL = Routes.EMPLOYEE_PROFILE;
  // static const INITIAL = Routes.ADD_LEADS;
  // static const INITIAL = Routes.LEADS;
  // static const INITIAL = Routes.ADD_SUB_PARTNER;
  // static const INITIAL = Routes.PARTNERS;
  // static const INITIAL = Routes.PARTNER_PROFILE;

  // static const INITIAL = Routes.LICENCE;
  // static const INITIAL = Routes.ADD_LICENCE;

  // static const INITIAL = Routes.LEAD_LISTING;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INTRODUCION,
      page: () => const IntroductionToDart(),
      binding: IntroductionBinding(),
      children: [
        GetPage(
          name: _Paths.INSTALL_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.DART_BASIC,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.VARIABLE_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.DATA_TYPES_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.COMMENTS_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.OPRATOR_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.USER_INPUT_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.STRING_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.KEYWORDS_IN_DART,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.EMPLOYEES,
      page: () => const EmployeesPage(),
      binding: EmployeesBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_EMPLOYEE,
          page: () => const EmployeesPage(),
          binding: EmployeesBinding(shouldShowAddEmployeeDialog: true),
        ),
        GetPage(
          name: _Paths.EMPLOYEE_PROFILE,
          page: () => const EmployeeProfilePage(),
          binding: EmployeeProfileBinding(),
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
