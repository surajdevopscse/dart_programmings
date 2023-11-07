import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/app/views/table/common_table_widget.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/strings/string_keys.dart';
import '../controllers/partners_controller.dart';

/// TODO: Replace from here
///
///

void subPartnerDialog(BuildContext context) async {
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
                    SK.subPartners,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: C.bluishGray500),
                  ),
                  Text(
                    '${SK.total} 5 ${SK.subPartners}',
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
            const SizedBox(width: double.maxFinite, child: SubPartnersDialog()),
      );
    },
  );
}

class SubPartnersDialog extends GetView<PartnersController> {
  const SubPartnersDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.pureWhite,
      body: HbDataTable(
        columnData: controller.subPartnerTable,
        currentPageIndex: 1,
        // frozeEndColumns: 1,
        // frozeStartColumns: 2,
        limit: 15,
        totalItems: controller.subPartnerTable.length,
        pageCount: 0,
      ),
    );
  }
}
