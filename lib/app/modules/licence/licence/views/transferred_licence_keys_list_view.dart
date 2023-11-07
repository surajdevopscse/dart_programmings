import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../views/table/common_table_widget.dart';
import '../controllers/licence_controller.dart';

class TransferredLicenceKeysListView extends GetView<LicenceController> {
  const TransferredLicenceKeysListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HbDataTable(
      columnData: controller.transferredKeysTable,
      currentPageIndex: 1,
      limit: 15,
      totalItems: controller.transferredKeysTable.length,
      pageCount: 0,
    );
  }
}
