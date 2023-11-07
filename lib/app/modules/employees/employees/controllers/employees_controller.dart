import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/app/modules/employees/employees/dialogs/add_employee_dialog.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../views/enum/table_column.dart';
import '../../../../views/table/common_table_column.dart';
import '../../../../views/table/table_row_type_enum.dart';

/// TODO: Temporary Model
///
///
class TempModel {
  final int id;
  final String employeeName;
  final String mobileNo;
  final String designation;
  final String email;
  final String location;
  final String pincode;
  final String latitude;
  final String longitude;
  final String joinDate;
  final String experienceYrs;
  final String status;
  final String sendPwd;
  final String actions;

  const TempModel({
    required this.id,
    required this.location,
    required this.pincode,
    required this.mobileNo,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.status,
    required this.sendPwd,
    required this.actions,
    required this.designation,
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
      location: 'Mumbai',
      pincode: '100287',
      mobileNo: '9855503887',
      email: 'dianne.russel@mail.com',
      status: 'Active',
      sendPwd: 'sendPwd',
      actions: 'actions',
      designation: 'Admin',
      joinDate: '05 Aug 2023',
      experienceYrs: '2 yrs',
      employeeName: 'Ralph Edwards',
      latitude: '19.0760°N',
      longitude: '72.8777°E',
    ),
  );
}

class EmployeesController extends GetxController {
  EmployeesController({this.shouldShowAddEmployeeDialog = false});

  final bool shouldShowAddEmployeeDialog;
  RxMap<String, List<HbTableColumn>> employeeTable = RxMap();
  late List<TempModel> employeeData;
  RxBool isGridView = false.obs;

  @override
  void onInit() {
    employeeData = generateTempData();
    buildEmployeeTable();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();

    if (shouldShowAddEmployeeDialog) {
      Get.dialog(const AddEmployeeDialog());
    }
  }

  void buildEmployeeTable() {
    employeeTable.clear();
    employeeTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.employeesName.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.employeeName, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.mobileNo.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.mobileNo, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.designation.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.designation, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.email.tittle,
        () => employeeData
            .map((element) =>
                HbTableColumn(value: element.email, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.location.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.location, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.pincode.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.pincode, type: HbDataTableRow.name))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.latitude.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.latitude, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.longitude.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.longitude, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.joinDate.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                value: element.joinDate, type: HbDataTableRow.name))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.experienceYrs.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                color: C.bluishGray300,
                value: element.experienceYrs,
                type: HbDataTableRow.number))
            .toList());

    employeeTable.putIfAbsent(
        TableColumn.status.tittle,
        () => employeeData
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
    employeeTable.putIfAbsent(
        TableColumn.sendPwd.tittle,
        () => employeeData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icPrimeSend),
                value: element.sendPwd,
                type: HbDataTableRow.action))
            .toList());
    employeeTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => employeeData
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
