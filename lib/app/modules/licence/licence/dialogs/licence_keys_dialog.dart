import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/table/common_table_widget.dart';
import '../controllers/licence_controller.dart';
import 'transfer_licence_key_dialog.dart';

/// TODO : Replace from Here
void licenceKeysDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
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
                    SK.hbAccountingLicenseKey,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: C.bluishGray500),
                  ),
                  Text(
                    '${SK.total} 55 ${SK.licensekeysAvailable}',
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: C.bluishGray200),
                  )
                ],
              ),
              Row(
                children: [
                  Container(
                    height: 40,
                    color: Colors.transparent,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: C.primary100,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        '+ Add Licence',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: C.primary600),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Container(
                    height: 40,
                    width: 115,
                    color: Colors.transparent,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: C.primary100,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Navigator.pop(context);
                        transferLicenseKeyDialog(context);
                      },
                      child: const Text(
                        'Transfer',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: C.primary600),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: C.bluishGray200,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content:
            const SizedBox(width: double.maxFinite, child: LicenceKeysDialog()),
      );
    },
  );
}

class LicenceKeysDialog extends GetView<LicenceController> {
  const LicenceKeysDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HbDataTable(
        columnData: controller.hbaccountingLicenseKeyTable,
        currentPageIndex: 1,
        limit: 15,
        totalItems: controller.hbaccountingLicenseKeyTable.length,
        pageCount: 0,
      ),
    );
  }
}
