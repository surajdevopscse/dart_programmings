// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  static const LOGIN = _Paths.LOGIN;
  static const HOME = _Paths.HOME;
  static const PARTNERS = _Paths.PARTNERS;
  static const ADD_SUB_PARTNER = _Paths.PARTNERS + _Paths.ADD_SUB_PARTNER;
  static const PARTNER_PROFILE = _Paths.PARTNERS + _Paths.PARTNER_PROFILE;
  static const EMPLOYEES = _Paths.EMPLOYEES;
  static const ADD_EMPLOYEE = _Paths.EMPLOYEES + _Paths.ADD_EMPLOYEE;
  static const EMPLOYEE_PROFILE = _Paths.EMPLOYEES + _Paths.EMPLOYEE_PROFILE;
  static const LEADS = _Paths.LEADS;
  static const ADD_LEADS = _Paths.LEADS + _Paths.ADD_LEADS;
  static const LICENCE = _Paths.LICENCE;
  static const ADD_LICENCE = _Paths.LICENCE + _Paths.ADD_LICENCE;
}

abstract class _Paths {
  _Paths._();
  static const LOGIN = '/login';
  static const HOME = '/home';
  static const PARTNERS = '/partners';
  static const ADD_SUB_PARTNER = '/add';
  static const PARTNER_PROFILE = '/:profile';
  static const EMPLOYEES = '/employees';
  static const ADD_EMPLOYEE = '/add';
  static const EMPLOYEE_PROFILE = '/:profile';
  static const LEADS = '/leads';
  static const ADD_LEADS = '/add';
  static const LICENCE = '/licence';
  static const ADD_LICENCE = '/add-licence';
}
