// ignore_for_file: constant_identifier_names

part of 'app_pages.dart';
// DO NOT EDIT. This is code generated via package:get_cli/get_cli.dart

abstract class Routes {
  Routes._();
  //HOME
  static const HOME = _Paths.HOME;

  //INTRODUCTION
  static const INTRODUCTION = _Paths.INTRODUCION;
  static const INSTALL_DART = _Paths.INTRODUCION + _Paths.INSTALL_DART;
  static const DART_BASIC = _Paths.INTRODUCION + _Paths.DART_BASIC;
  static const VARIABLE = _Paths.INTRODUCION + _Paths.VARIABLE_IN_DART;
  static const DATATYPES = _Paths.INTRODUCION + _Paths.DATA_TYPES_IN_DART;
  static const COMMENTS = _Paths.INTRODUCION + _Paths.COMMENTS_IN_DART;
  static const OPRATOR = _Paths.INTRODUCION + _Paths.OPRATOR_IN_DART;
  static const USERINPUT = _Paths.INTRODUCION + _Paths.USER_INPUT_IN_DART;
  static const METADATA = _Paths.INTRODUCION + _Paths.METADATA_IN_DART;
  static const LIBRARIES =
      _Paths.INTRODUCION + _Paths.LIBRARIES_AND_IMPORTS_IN_DART;
  static const STRING = _Paths.INTRODUCION + _Paths.STRING_IN_DART;
  static const KEYWORDS = _Paths.INTRODUCION + _Paths.KEYWORDS_IN_DART;

  //CONDITIONS AND LOOPS
  static const LOGIN = _Paths.LOGIN;

  static const PARTNER_PROFILE = _Paths.INTRODUCION + _Paths.PARTNER_PROFILE;
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
  static const HOME = '/home';
  static const INTRODUCION = '/introduction_to_dart';
  static const INSTALL_DART = '/install';
  static const DART_BASIC = '/dart';
  static const VARIABLE_IN_DART = '/variable';
  static const DATA_TYPES_IN_DART = '/data_type';
  static const COMMENTS_IN_DART = '/comments';
  static const OPRATOR_IN_DART = '/oprator';
  static const USER_INPUT_IN_DART = '/user_input';
  static const METADATA_IN_DART = '/metadata';
  static const LIBRARIES_AND_IMPORTS_IN_DART = '/libraries_and_imports';
  static const STRING_IN_DART = '/strings';
  static const KEYWORDS_IN_DART = '/keywords';

  static const LOGIN = '/login';

  static const PARTNER_PROFILE = '/:profile';
  static const EMPLOYEES = '/employees';
  static const ADD_EMPLOYEE = '/add';
  static const EMPLOYEE_PROFILE = '/:profile';
  static const LEADS = '/leads';
  static const ADD_LEADS = '/add';
  static const LICENCE = '/licence';
  static const ADD_LICENCE = '/add-licence';
}
