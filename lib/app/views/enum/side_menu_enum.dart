import '../../../constants/images.dart';
import '../../../constants/strings/string_keys.dart';
import '../../routes/app_pages.dart';

enum SideNavBarParentEnum {
  dashboard(children: [], parentPath: Routes.HOME),
  partners(children: [
    SideNavBarChildEnum.myPartners,
    SideNavBarChildEnum.addPartner,
  ], parentPath: Routes.PARTNERS),
  employees(children: [
    SideNavBarChildEnum.myEmployees,
    SideNavBarChildEnum.addEmployee
  ], parentPath: Routes.EMPLOYEES),
  lead(children: [
    SideNavBarChildEnum.dashboard,
    SideNavBarChildEnum.addLead,
  ], parentPath: Routes.LEADS),
  license(children: [
    SideNavBarChildEnum.licenseKeys,
    SideNavBarChildEnum.addLicenseKey,
    SideNavBarChildEnum.transferLicenseKey,
    SideNavBarChildEnum.requestLicenseKey,
  ], parentPath: Routes.LICENCE),
  logout(children: [], parentPath: Routes.LOGIN),
  ;

  final List<SideNavBarChildEnum> children;
  final String parentPath;

  const SideNavBarParentEnum(
      {required this.children, required this.parentPath});

  String get title {
    switch (this) {
      case SideNavBarParentEnum.dashboard:
        return SK.home;
      case SideNavBarParentEnum.partners:
        return SK.partners;
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
      case SideNavBarParentEnum.partners:
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
  dashboard(childPath: Routes.LEADS),
  addLead(childPath: Routes.ADD_LEADS),

  licenseKeys(childPath: Routes.LICENCE),
  addLicenseKey(childPath: Routes.ADD_LICENCE),
  transferLicenseKey,
  requestLicenseKey,
  myPartners(childPath: Routes.PARTNERS),
  addPartner(childPath: Routes.ADD_SUB_PARTNER);

  final String? childPath;
  const SideNavBarChildEnum({this.childPath});

  String get title {
    switch (this) {
      case SideNavBarChildEnum.myEmployees:
        return SK.myEmployees;
      case SideNavBarChildEnum.addEmployee:
        return SK.addEmployee;
      case SideNavBarChildEnum.dashboard:
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
      case SideNavBarChildEnum.myPartners:
        return SK.myPartners;
      case SideNavBarChildEnum.addPartner:
        return SK.addPartner;
    }
  }
}
