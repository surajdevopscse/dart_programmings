import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../views/table/common_table_widget.dart';
import '../controllers/licence_controller.dart';

class AvailableLicenceKeysListView extends GetView<LicenceController> {
  const AvailableLicenceKeysListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HbDataTable(
      columnData: controller.availableKeysTable,
      currentPageIndex: 1,
      limit: 15,
      totalItems: controller.availableKeysTable.length,
      // pageCount: 0,
      // controller: controller,
      pageCount: (5 / 15).ceil(), // total/limit
    );
  }
}
