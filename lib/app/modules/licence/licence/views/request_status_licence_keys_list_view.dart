import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../views/table/common_table_widget.dart';
import '../controllers/licence_controller.dart';
import '../dialogs/licence_details_dialog.dart';

class RequestStatusLicenceKeysListView extends GetView<LicenceController> {
  const RequestStatusLicenceKeysListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HbDataTable(
      onRowTap: (p0) {
        licenseDetailsDialog(context);
      },
      columnData: controller.requestStatusTable,
      currentPageIndex: 1,
      limit: 15,
      totalItems: controller.requestStatusTable.length,
      pageCount: 0,
    );
  }
}
