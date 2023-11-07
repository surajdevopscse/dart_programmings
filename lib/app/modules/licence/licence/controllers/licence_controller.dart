import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/enum/table_column.dart';
import '../../../../views/table/common_table_column.dart';
import '../../../../views/table/table_row_type_enum.dart';
import '../dialogs/licence_keys_dialog.dart';

class _TempModel {
  final int id;
  final String product;
  final String planType;
  final String totalKeys;
  final String issueDate;
  final String status;
  final String actions;
  final String licenseKeys;
  final String licenseNumbers;
  final String activationDate;
  final String expiresOn;
  final String name;
  final String address;
  final String requestNo;
  final String requestDate;
  final String qty;
  final String rate;
  final String amount;
  final String transferTo;
  final String transferDate;

  const _TempModel({
    required this.id,
    required this.product,
    required this.planType,
    required this.totalKeys,
    required this.issueDate,
    required this.status,
    required this.actions,
    required this.licenseKeys,
    required this.licenseNumbers,
    required this.activationDate,
    required this.expiresOn,
    required this.name,
    required this.address,
    required this.requestNo,
    required this.requestDate,
    required this.qty,
    required this.rate,
    required this.amount,
    required this.transferTo,
    required this.transferDate,
  });
}

/// TODO: Temporary Data
///
///
List<_TempModel> generateTempData() {
  return List.generate(
    5,
    (index) => _TempModel(
      id: index + 1,
      product: 'HB Accounting',
      planType: 'Gold (3 Years)',
      totalKeys: '55',
      issueDate: '05 Aug 2023',
      status: 'Active',
      actions: '',
      licenseKeys: '8976-3297-0098-0002',
      licenseNumbers: 'LC2023/00987',
      activationDate: '05 Aug 2023',
      expiresOn: '05 Aug 2023',
      name: 'Rohit Kumar',
      address: 'Andheri East, Mumbai - 654400',
      requestNo: 'RQ2023/050/A546',
      requestDate: '05 Aug 2023',
      qty: '55',
      rate: '55',
      amount: '55',
      transferTo: 'Amit Traders',
      transferDate: '10 Aug 2023',
    ),
  );
}

class LicenceController extends GetxController {
  RxInt selectedIndex = 0.obs; // Change Table
  final List<String> buttonLabels = [
    SK.availableKeys,
    SK.activatedKey,
    SK.requestStatus,
    SK.transferredKeys
  ];
  // Available Key
  RxMap<String, List<HbTableColumn>> availableKeysTable = RxMap();
  late List<_TempModel> availableKeysData;

  // Activated Key
  RxMap<String, List<HbTableColumn>> activatedKeyTable = RxMap();
  late List<_TempModel> activatedKeyData;

  // Request Status
  RxMap<String, List<HbTableColumn>> requestStatusTable = RxMap();
  late List<_TempModel> requestStatusData;

  // Transferred Keys
  RxMap<String, List<HbTableColumn>> transferredKeysTable = RxMap();
  late List<_TempModel> transferredKeysData;

  //HB Accounting: License Key (Dialog)
  RxMap<String, List<HbTableColumn>> hbaccountingLicenseKeyTable = RxMap();
  late List<_TempModel> accountingLicenseKey;

  @override
  void onInit() {
    availableKeysData = generateTempData();
    buildAvailableKeysTable();
    activatedKeyData = generateTempData();
    buildActivatedKeyTable();
    requestStatusData = generateTempData();
    buildRequestStatusTable();
    transferredKeysData = generateTempData();
    buildTransferredKeysTable();
    accountingLicenseKey = generateTempData();
    buildaccountingLicenseKeyTable();

    super.onInit();
  }

  //HB Accounting: License Key (Dialog)
  void buildaccountingLicenseKeyTable() {
    hbaccountingLicenseKeyTable.clear();
    hbaccountingLicenseKeyTable.putIfAbsent(
      '',
      () => accountingLicenseKey
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
    hbaccountingLicenseKeyTable.putIfAbsent(
      TableColumn.sNo.tittle,
      () => accountingLicenseKey
          .map((element) => HbTableColumn(
                value: element.id.toString(),
                type: HbDataTableRow.name,
              ))
          .toList(),
    );
    hbaccountingLicenseKeyTable.putIfAbsent(
        TableColumn.licenseKeys.tittle,
        () => accountingLicenseKey
            .map((element) => HbTableColumn(
                value: element.product, type: HbDataTableRow.name))
            .toList());
    hbaccountingLicenseKeyTable.putIfAbsent(
        TableColumn.issueDate.tittle,
        () => accountingLicenseKey
            .map((element) => HbTableColumn(
                value: element.planType, type: HbDataTableRow.name))
            .toList());
    update();
  }

  // Transferred Keys
  void buildTransferredKeysTable() {
    transferredKeysTable.clear();
    transferredKeysTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    transferredKeysTable.putIfAbsent(
        TableColumn.product.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                value: element.product, type: HbDataTableRow.name))
            .toList());

    transferredKeysTable.putIfAbsent(
        TableColumn.planType.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                value: element.planType, type: HbDataTableRow.name))
            .toList());

    transferredKeysTable.putIfAbsent(
        TableColumn.requestNo.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                color: C.primary600,
                value: element.requestNo,
                type: HbDataTableRow.name))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.transferTo.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                value: element.transferTo, type: HbDataTableRow.name))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.requestDate.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                value: element.requestDate, type: HbDataTableRow.name))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.transferDate.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                value: element.transferDate, type: HbDataTableRow.name))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.qty.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.qty,
                type: HbDataTableRow.number))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.rate.tittle,
        () => transferredKeysData
            .map((element) =>
                HbTableColumn(value: element.rate, type: HbDataTableRow.name))
            .toList());
    transferredKeysTable.putIfAbsent(
        TableColumn.amount.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.amount,
                type: HbDataTableRow.amount))
            .toList());

    transferredKeysTable.putIfAbsent(
        TableColumn.status.tittle,
        () => transferredKeysData
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

    transferredKeysTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => transferredKeysData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icEye),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    update();
  }

  //  Request Status
  void buildRequestStatusTable() {
    requestStatusTable.clear();
    requestStatusTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    requestStatusTable.putIfAbsent(
        TableColumn.product.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                value: element.product, type: HbDataTableRow.name))
            .toList());

    requestStatusTable.putIfAbsent(
        TableColumn.planType.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                value: element.planType, type: HbDataTableRow.name))
            .toList());

    requestStatusTable.putIfAbsent(
        TableColumn.requestNo.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                value: element.requestNo, type: HbDataTableRow.name))
            .toList());
    requestStatusTable.putIfAbsent(
        TableColumn.requestDate.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                value: element.requestDate, type: HbDataTableRow.name))
            .toList());
    requestStatusTable.putIfAbsent(
        TableColumn.issueDate.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                value: element.issueDate, type: HbDataTableRow.name))
            .toList());
    requestStatusTable.putIfAbsent(
        TableColumn.qty.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.qty,
                type: HbDataTableRow.number))
            .toList());
    requestStatusTable.putIfAbsent(
        TableColumn.rate.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.rate,
                type: HbDataTableRow.number))
            .toList());
    requestStatusTable.putIfAbsent(
        TableColumn.amount.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                color: C.bluishGray400,
                value: element.amount,
                type: HbDataTableRow.amount))
            .toList());

    requestStatusTable.putIfAbsent(
        TableColumn.status.tittle,
        () => requestStatusData
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

    requestStatusTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => requestStatusData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icEye),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    update();
  }

  // Activated Key
  void buildActivatedKeyTable() {
    activatedKeyTable.clear();
    activatedKeyTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    activatedKeyTable.putIfAbsent(
        TableColumn.product.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.product, type: HbDataTableRow.name))
            .toList());

    activatedKeyTable.putIfAbsent(
        TableColumn.planType.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.planType, type: HbDataTableRow.name))
            .toList());

    activatedKeyTable.putIfAbsent(
        TableColumn.licenseKeys.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.licenseKeys, type: HbDataTableRow.name))
            .toList());
    activatedKeyTable.putIfAbsent(
        TableColumn.licenseNumbers.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.licenseNumbers, type: HbDataTableRow.name))
            .toList());
    activatedKeyTable.putIfAbsent(
        TableColumn.activationDate.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.activationDate, type: HbDataTableRow.name))
            .toList());
    activatedKeyTable.putIfAbsent(
        TableColumn.expiresOn.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.expiresOn, type: HbDataTableRow.name))
            .toList());
    activatedKeyTable.putIfAbsent(
        TableColumn.name.tittle,
        () => activatedKeyData
            .map((element) =>
                HbTableColumn(value: element.name, type: HbDataTableRow.name))
            .toList());
    activatedKeyTable.putIfAbsent(
        TableColumn.address.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                value: element.address, type: HbDataTableRow.name))
            .toList());

    activatedKeyTable.putIfAbsent(
        TableColumn.status.tittle,
        () => activatedKeyData
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

    activatedKeyTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => activatedKeyData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icEye),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    update();
  }

  // Available Key
  void buildAvailableKeysTable() {
    availableKeysTable.clear();
    availableKeysTable.putIfAbsent(
        TableColumn.sNo.tittle,
        () => availableKeysData
            .map((element) => HbTableColumn(
                  value: element.id.toString(),
                  type: HbDataTableRow.name,
                  showLogo: false,
                ))
            .toList());

    availableKeysTable.putIfAbsent(
        TableColumn.product.tittle,
        () => availableKeysData
            .map((element) => HbTableColumn(
                value: element.product, type: HbDataTableRow.name))
            .toList());

    availableKeysTable.putIfAbsent(
        TableColumn.planType.tittle,
        () => availableKeysData
            .map((element) => HbTableColumn(
                value: element.planType, type: HbDataTableRow.name))
            .toList());

    availableKeysTable.putIfAbsent(
      TableColumn.totalKeys.tittle,
      () => availableKeysData
          .map((element) => HbTableColumn(
              widget: TextButton(
                onPressed: () {
                  licenceKeysDialog(Get.context!);
                },
                child: Text(
                  element.totalKeys,
                  style: const TextStyle(
                      color: C.primary600, fontWeight: FontWeight.w600),
                ),
              ),
              value: element.totalKeys,
              type: HbDataTableRow.action))
          .toList(),
    );
    availableKeysTable.putIfAbsent(
        TableColumn.issueDate.tittle,
        () => availableKeysData
            .map((element) => HbTableColumn(
                value: element.issueDate, type: HbDataTableRow.name))
            .toList());

    availableKeysTable.putIfAbsent(
        TableColumn.status.tittle,
        () => availableKeysData
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

    availableKeysTable.putIfAbsent(
        TableColumn.actions.tittle,
        () => availableKeysData
            .map((element) => HbTableColumn(
                widget: SvgPicture.asset(I.icEye),
                value: element.actions,
                type: HbDataTableRow.action))
            .toList());

    update();
  }
}
