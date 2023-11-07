import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../views/table/common_table_widget.dart';
import '../controllers/licence_controller.dart';

class ActivatedLicenceKeysListView extends GetView<LicenceController> {
  const ActivatedLicenceKeysListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return HbDataTable(
      columnData: controller.activatedKeyTable,
      currentPageIndex: 1,
      limit: 15,
      totalItems: controller.activatedKeyTable.length,
      pageCount: 0,
    );
  }
}
