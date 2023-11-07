// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';

import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/pages/dashboard_page.dart';
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
import '../modules/partners/add_sub_partner/bindings/add_sub_partner_binding.dart';
import '../modules/partners/add_sub_partner/pages/add_sub_partner_page.dart';
import '../modules/partners/partner_profile/bindings/partner_profile_binding.dart';
import '../modules/partners/partner_profile/pages/partner_profile_page.dart';
import '../modules/partners/partners/bindings/partners_binding.dart';
import '../modules/partners/partners/pages/partners_page.dart';

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
      page: () => const DashboardPage(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.PARTNERS,
      page: () => const PartnersPage(),
      binding: PartnersBinding(),
      children: [
        GetPage(
          name: _Paths.ADD_SUB_PARTNER,
          page: () => const AddSubPartnerPage(),
          binding: AddSubPartnerBinding(),
        ),
        GetPage(
          name: _Paths.PARTNER_PROFILE,
          page: () => const PartnerProfilePage(),
          binding: PartnerProfileBinding(),
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
