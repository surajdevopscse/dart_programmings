import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../views/enum/table_column.dart';
import '../../../../views/table/common_table_column.dart';
import '../../../../views/table/table_row_type_enum.dart';
import '../dialogs/employees_dialog.dart';
import '../dialogs/sub_partners_dialog.dart';

/// TODO: Temporary Model
///
///
class TempModel {
  final int id;
  final String firmName;
  final String patnerName;
  final String type;
  final String code;
  final String location;
  final String pincode;
  final String mobileNo;
  final String email;
  final String activeDate;
  final String subPartner;
  final String employees;
  final String status;
  final String sendPwd;
  final String actions;
  final String designation;
  final String address;
  final String joinDate;
  final String experienceYrs;
  final String employeeName;

  const TempModel({
    required this.id,
    required this.firmName,
    required this.patnerName,
    required this.type,
    required this.code,
    required this.location,
    required this.pincode,
    required this.mobileNo,
    required this.email,
    required this.activeDate,
    required this.subPartner,
    required this.employees,
    required this.status,
    required this.sendPwd,
    required this.actions,
    required this.designation,
    required this.address,
    required this.joinDate,
    required this.experienceYrs,
    required this.employeeName,
  });
}

/// TODO: Temporary Data
///
///
List<TempModel> generateTempData() {
  return List.generate(
    5,
    (index) => TempModel(
      id: index + 1,
      firmName: 'Dainne Associates',
      patnerName: 'Dianne Russell',
      type: '-',
      code: 'SP/2023/0098',
      location: 'Mumbai',
      pincode: '100287',
      mobileNo: '9855503887',
      email: 'dianne.russel@mail.com',
      activeDate: '04 Aug 23',
      subPartner: '20',
      employees: '20',
      status: 'Active',
      sendPwd: 'sendPwd',
      actions: 'actions',
      designation: 'Admin',
      address: 'Mumbai',
      joinDate: '05 Aug 2023',
      experienceYrs: '2 yrs',
      employeeName: 'Ralph Edwards',
    ),
  );
}

class PartnersController extends GetxController {
  RxMap<String, List<HbTableColumn>> partnerTable = RxMap();
  late List<TempModel> patnerData;
  RxMap<String, List<HbTableColumn>> subPartnerTable = RxMap();
  late List<TempModel> subPartnerData;
  RxMap<String, List<HbTableColumn>> employeeTable = RxMap();
  late List<TempModel> employeeData;

  @override
  void onInit() {
    patnerData = generateTempData();
    buildPartnerTable();

    subPartnerData = generateTempData();
    buildSubPartnerDialogTable();

    employeeData = generateTempData();
    buildEmployeeDialogTable();

    super.onInit();
  }

  void buildEmployeeDialogTable() {
    employeeTable.clear();
    employeeTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.employeesName.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.employeeName, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.code.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.code, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.designation.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.designation, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.mobileNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.mobileNo, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.email.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.email,
                type: HbDataTableRow.number))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.address.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.address, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.joinDate.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.joinDate, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.experienceYrs.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.experienceYrs,
                type: HbDataTableRow.number))
            .toList());

    update();
  }

  void buildSubPartnerDialogTable() {
    subPartnerTable.clear();
    subPartnerTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.firmName.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.firmName, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.partnerName.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.patnerName, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.type.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.type, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.code.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.code, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.mobileNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.mobileNo, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.email.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.email, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.location.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.location, type: HbDataTableRow.name))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.employees.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                color: C.primary600,
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                value: element.employees,
                type: HbDataTableRow.number))
            .toList());
    subPartnerTable.putIfAbsent(
        TableColumn.activeDate.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.activeDate, type: HbDataTableRow.name))
            .toList());

    update();
  }

  void buildPartnerTable() {
    partnerTable.clear();
    partnerTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.firmName.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.firmName, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.partnerName.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                color: C.primary600,
                fontWeight: FontWeight.w500,
                value: element.patnerName,
                type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.type.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.type, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.code.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.code, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.location.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.location, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.pincode.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.pincode, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.mobileNo.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.mobileNo, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.email.tittle,
        () => patnerData
            .map((element) =>
                HbTableColumn(value: element.email, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.activeDate.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                value: element.activeDate, type: HbDataTableRow.name))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.subPartner.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                onTap: () {
                  print('subPartner');
                  subPartnerDialog(Get.context!);
                },
                color: C.primary600,
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                value: element.subPartner,
                type: HbDataTableRow.number))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.employees.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                onTap: () {
                  print('Employees');
                  employeeDialog(Get.context!);
                },
                color: C.primary600,
                align: TextAlign.center,
                fontWeight: FontWeight.w500,
                value: element.employees,
                type: HbDataTableRow.number))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.status.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                widget: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color:
                          element.status == 'Active' ? C.success50 : C.error50),
                  child: Text(
                    '• ${element.status}',
                    style: TextStyle(
                        color: element.status == 'Active'
                            ? C.success500
                            : C.error500,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                value: element.status,
                type: HbDataTableRow.action))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.sendPwd.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icPrimeSend),
                value: element.sendPwd,
                type: HbDataTableRow.action))
            .toList());
    partnerTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => patnerData
            .map((element) => HbTableColumn(
                widget: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(I.icEdit),
                    const SizedBox(width: 16),
                    SvgPicture.asset(I.icTrash),
                  ],
                ),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    update();
  }


}
