import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../views/enum/table_column.dart';
import '../../../../views/table/common_table_column.dart';
import '../../../../views/table/table_row_type_enum.dart';
import '../views/leads_header.dart';

/// TODO : Replace with actual model
///
///
class _TempLeadListingModel {
  final int sNo;
  final String actions;
  final String landingDate;
  final String leadStatus;
  final String mobileNo;
  final String firstName;
  final String firmName;
  final String businessType;
  final String leadSource;
  final String assignTo;
  final String name;
  final String emailId;
  const _TempLeadListingModel({
    required this.sNo,
    required this.actions,
    required this.landingDate,
    required this.leadStatus,
    required this.mobileNo,
    required this.firstName,
    required this.firmName,
    required this.businessType,
    required this.leadSource,
    required this.assignTo,
    required this.name,
    required this.emailId,
  });
}

/// TODO: Temporary Data
///
///
List<_TempLeadListingModel> generateTempData() {
  return List.generate(
    5,
    (index) => _TempLeadListingModel(
      sNo: index + 1,
      actions: '',
      landingDate: '04 Aug 23',
      leadStatus: 'Pending',
      mobileNo: '9855503887',
      firstName: 'Dianne Russell',
      firmName: 'Admin',
      businessType: '-',
      leadSource: 'Direct',
      assignTo: 'Vinakay',
      name: 'Dianne Russell',
      emailId: 'dianne.russel@mail.com',
    ),
  );
}

class LeadsController extends GetxController {
  final selectedTab = Rx(LeadsEnum.dashboard);
  // Available Key
  RxMap<String, List<HbTableColumn>> leadListingTable = RxMap();
  late List<_TempLeadListingModel> leadListingData;

  void changeTab(LeadsEnum tab) {
    selectedTab.value = tab;
    update();
  }

  @override
  void onInit() {
    leadListingData = generateTempData();
    buildLeadListingTable();
    super.onInit();
  }

  void buildLeadListingTable() {
    leadListingTable.clear();
    leadListingTable.putIfAbsent(
      '',
      () => leadListingData
          .map((element) => HbTableColumn(
              widget: Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              value: '',
              type: HbDataTableRow.action,
              showLogo: false))
          .toList(),
    );
    leadListingTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                  value: element.sNo.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    leadListingTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icEdit2),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    leadListingTable.putIfAbsent(
        TableColumn.landingDate.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.landingDate, type: HbDataTableRow.name))
            .toList());

    leadListingTable.putIfAbsent(
        TableColumn.leadStatus.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                widget: Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: element.leadStatus == 'Active'
                          ? C.success50
                          : C.warning50),
                  child: Text(
                    '• ${element.leadStatus}',
                    style: TextStyle(
                        color: element.leadStatus == 'Active'
                            ? C.success500
                            : C.warning600,
                        fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                value: element.leadStatus,
                type: HbDataTableRow.action))
            .toList());

    leadListingTable.putIfAbsent(
        TableColumn.mobileNo.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.mobileNo, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.firstName.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.firstName, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.firmName.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.firmName, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.businessType.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.businessType, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.leadSource.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.leadSource, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.assignTo.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.assignTo, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.name.tittle,
        () => leadListingData
            .map((element) =>
                HbTableColumn(value: element.name, type: HbDataTableRow.name))
            .toList());
    leadListingTable.putIfAbsent(
        TableColumn.emailId.tittle,
        () => leadListingData
            .map((element) => HbTableColumn(
                value: element.emailId, type: HbDataTableRow.name))
            .toList());

    update();
  }
}
