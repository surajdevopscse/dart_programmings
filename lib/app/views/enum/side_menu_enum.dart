import '../../../constants/images.dart';
import '../../../constants/strings/string_keys.dart';
import '../../routes/app_pages.dart';

enum SideNavBarParentEnum {
  dashboard(
    children: [],
    parentPath: Routes.HOME,
  ),
  introductionAndSyntax(
    children: [
      SideNavBarChildEnum.introductionToDart,
      SideNavBarChildEnum.installDart,
      SideNavBarChildEnum.dartBasic,
      SideNavBarChildEnum.variables,
      SideNavBarChildEnum.dataTypes,
      SideNavBarChildEnum.comments,
      SideNavBarChildEnum.oprators,
      SideNavBarChildEnum.userInput,
      SideNavBarChildEnum.string,
      SideNavBarChildEnum.keywords,
    ],
    parentPath: Routes.INTRODUCTION,
  ),
  employees(
    children: [
      SideNavBarChildEnum.myEmployees,
      SideNavBarChildEnum.addEmployee
    ],
    parentPath: Routes.EMPLOYEES,
  ),
  lead(
    children: [
      SideNavBarChildEnum.home,
      SideNavBarChildEnum.addLead,
    ],
    parentPath: Routes.LEADS,
  ),
  license(
    children: [
      SideNavBarChildEnum.licenseKeys,
      SideNavBarChildEnum.addLicenseKey,
      SideNavBarChildEnum.transferLicenseKey,
      SideNavBarChildEnum.requestLicenseKey,
    ],
    parentPath: Routes.LICENCE,
  ),
  logout(
    children: [],
    parentPath: Routes.LOGIN,
  ),
  ;

  final List<SideNavBarChildEnum> children;
  final String parentPath;

  const SideNavBarParentEnum(
      {required this.children, required this.parentPath});

  String get title {
    switch (this) {
      case SideNavBarParentEnum.dashboard:
        return SK.home;
      case SideNavBarParentEnum.introductionAndSyntax:
        return SK.introductionAndSyntax;
      case SideNavBarParentEnum.employees:
        return SK.employees;
      case SideNavBarParentEnum.lead:
        return SK.lead;
      case SideNavBarParentEnum.license:
        return SK.license;
      case SideNavBarParentEnum.logout:
        return SK.logout;
    }
  }

  (String selectedImage, String unSelectedImage) get image {
    switch (this) {
      case SideNavBarParentEnum.dashboard:
        return (I.icCategory2Active, I.icCategory2);
      case SideNavBarParentEnum.introductionAndSyntax:
        return (I.icBriefcaseActive, I.icBriefcase);
      case SideNavBarParentEnum.employees:
        return (I.icProfile2userActive, I.icProfile2user);
      case SideNavBarParentEnum.lead:
        return (I.icUserSearchActive, I.icUserSearch);
      case SideNavBarParentEnum.license:
        return (I.icPersonalcardActive, I.icPersonalcard);
      case SideNavBarParentEnum.logout:
        return (I.icLogout, I.icLogout);
    }
  }
}

enum SideNavBarChildEnum {
  myEmployees(childPath: Routes.EMPLOYEES),

  addEmployee,
  home(childPath: Routes.LEADS),
  addLead(childPath: Routes.ADD_LEADS),

  licenseKeys(childPath: Routes.LICENCE),
  addLicenseKey(childPath: Routes.ADD_LICENCE),
  transferLicenseKey,
  requestLicenseKey,

  //Introduction to Dart
  introductionToDart(
    childPath: Routes.INTRODUCTION,
  ),
  dartBasic(
    childPath: Routes.DART_BASIC,
  ),
  variables(
    childPath: Routes.VARIABLE,
  ),
  dataTypes(
    childPath: Routes.DATATYPES,
  ),
  comments(
    childPath: Routes.COMMENTS,
  ),
  oprators(
    childPath: Routes.OPRATOR,
  ),
  userInput(
    childPath: Routes.USERINPUT,
  ),
  metaData(
    childPath: Routes.METADATA,
  ),
  libraries(
    childPath: Routes.LIBRARIES,
  ),
  string(
    childPath: Routes.STRING,
  ),
  keywords(
    childPath: Routes.KEYWORDS,
  ),
  installDart(
    childPath: Routes.INSTALL_DART,
  );

  final String? childPath;
  const SideNavBarChildEnum({this.childPath});

  String get title {
    switch (this) {
      case SideNavBarChildEnum.myEmployees:
        return SK.myEmployees;
      case SideNavBarChildEnum.addEmployee:
        return SK.addEmployee;
      case SideNavBarChildEnum.home:
        return SK.home;
      case SideNavBarChildEnum.addLead:
        return SK.addLead;

      case SideNavBarChildEnum.licenseKeys:
        return SK.licenseKeys;
      case SideNavBarChildEnum.addLicenseKey:
        return SK.addLicenseKey;
      case SideNavBarChildEnum.transferLicenseKey:
        return SK.transferLicenseKey;
      case SideNavBarChildEnum.requestLicenseKey:
        return SK.requestLicenseKey;
      case SideNavBarChildEnum.introductionToDart:
        return SK.introductionToDart;
      case SideNavBarChildEnum.installDart:
        return SK.installDart;
      case SideNavBarChildEnum.dartBasic:
        return SK.dartBasic;
      case SideNavBarChildEnum.variables:
        return SK.variables;
      case SideNavBarChildEnum.dataTypes:
        return SK.dataTypes;
      case SideNavBarChildEnum.comments:
        return SK.comments;
      case SideNavBarChildEnum.oprators:
        return SK.oprator;
      case SideNavBarChildEnum.userInput:
        return SK.userInput;
      case SideNavBarChildEnum.metaData:
        return SK.metaData;
      case SideNavBarChildEnum.libraries:
        return SK.libraries;
      case SideNavBarChildEnum.string:
        return SK.string;
      case SideNavBarChildEnum.keywords:
        return SK.keywords;
    }
  }
}
