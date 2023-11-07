import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/modules/partners/partners/controllers/partners_controller.dart';
import 'package:dart_programing/app/views/table/common_table_widget.dart';
import 'package:dart_programing/constants/colors.dart';

import '../../../../../constants/strings/string_keys.dart';

/// TODO: Replace from here
///
///

void employeeDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        // contentPadding: EdgeInsets.all(),
        titlePadding: EdgeInsets.zero,
        title: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: C.bluishGray50.withOpacity(0.3),
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    SK.employees,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: C.bluishGray500),
                  ),
                  Text(
                    '${SK.total} 5 ${SK.employees}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: C.bluishGray200),
                  )
                ],
              ),
              IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: C.bluishGray200,
                  ))
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content:
            const SizedBox(width: double.maxFinite, child: EmployeesDialog()),
      );
    },
  );
}

class EmployeesDialog extends GetView<PartnersController> {
  const EmployeesDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HbDataTable(
        columnData: controller.employeeTable,
        currentPageIndex: 1,
        // frozeEndColumns: 1,
        // frozeStartColumns: 2,
        limit: 15,
        totalItems: controller.employeeTable.length,
        pageCount: 0,
      ),
    );
  }
}
