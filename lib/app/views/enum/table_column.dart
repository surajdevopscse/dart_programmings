import '../../../utils/constants/strings/string_keys.dart';

enum TableColumn {
  sNo,
  firmName,
  partnerName,
  type,
  code,
  location,
  pincode,
  mobileNo,
  email,
  activeDate,
  subPartner,
  employees,
  status,
  sendPwd,
  actions,
  designation,
  address,
  joinDate,
  experienceYrs,
  employeesName,
  latitude,
  longitude,
  product,
  planType,
  totalKeys,
  licenseKeys,
  licenseNumbers,
  activationDate,
  expiresOn,
  name,
  requestNo,
  requestDate,
  issueDate,
  qty,
  rate,
  amount,
  transferTo,
  transferDate,
  landingDate,
  leadStatus,
  businessType,
  leadSource,
  assignTo,
  emailId,
  firstName;
}

extension AllColumnTitle on TableColumn {
  String get tittle {
    switch (this) {
      case TableColumn.sNo:
        return SK.sNo;
      case TableColumn.firmName:
        return SK.firmName;
      case TableColumn.partnerName:
        return SK.partnerName;
      case TableColumn.type:
        return SK.type;
      case TableColumn.code:
        return SK.code;
      case TableColumn.location:
        return SK.location;
      case TableColumn.pincode:
        return SK.pincode;
      case TableColumn.mobileNo:
        return SK.mobileNo;
      case TableColumn.email:
        return SK.email;
      case TableColumn.activeDate:
        return SK.activeDate;
      case TableColumn.subPartner:
        return SK.subPartner;
      case TableColumn.employees:
        return SK.employees;
      case TableColumn.status:
        return SK.status;
      case TableColumn.sendPwd:
        return SK.sendPwd;
      case TableColumn.actions:
        return SK.actions;
      case TableColumn.designation:
        return SK.designation;
      case TableColumn.address:
        return SK.address;
      case TableColumn.joinDate:
        return SK.joinDate;
      case TableColumn.experienceYrs:
        return SK.experienceYrs;
      case TableColumn.employeesName:
        return SK.employeeName;
      case TableColumn.latitude:
        return SK.latitude;
      case TableColumn.longitude:
        return SK.longitude;
      case TableColumn.product:
        return SK.product;
      case TableColumn.planType:
        return SK.planType;
      case TableColumn.totalKeys:
        return SK.totalKeys;
      case TableColumn.issueDate:
        return SK.issueDate;
      case TableColumn.licenseKeys:
        return SK.licenseKeys;
      case TableColumn.licenseNumbers:
        return SK.licenseNumbers;
      case TableColumn.activationDate:
        return SK.activationDate;
      case TableColumn.expiresOn:
        return SK.expiresOn;
      case TableColumn.name:
        return SK.name;
      case TableColumn.requestNo:
        return SK.requestNo;
      case TableColumn.requestDate:
        return SK.requestDate;
      case TableColumn.qty:
        return SK.qty;
      case TableColumn.rate:
        return SK.rate;
      case TableColumn.amount:
        return SK.amount;
      case TableColumn.transferTo:
        return SK.transferTo;
      case TableColumn.transferDate:
        return SK.transferDate;
      case TableColumn.landingDate:
        return SK.landingDate;
      case TableColumn.leadStatus:
        return SK.leadStatus;
      case TableColumn.businessType:
        return SK.businessType1;
      case TableColumn.leadSource:
        return SK.leadSource;
      case TableColumn.assignTo:
        return SK.assignTo;
      case TableColumn.emailId:
        return SK.emailId;
      case TableColumn.firstName:
        return SK.firstName;
    }
  }
}
