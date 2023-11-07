import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/common_text_field_view.dart';

/// TODO : Replace from Here
void validateLicenceKeyDialog(BuildContext context) async {
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
                      SK.licenseKeys,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: C.bluishGray500),
                    ),
                    Text(
                      SK.adminLicensesKeysCheckLicense,
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
                  ),
                ),
              ],
            )),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: const SizedBox(
            width: 450, height: 200, child: ValidateLicenceKeyDialog()),
      );
    },
  );
}

class ValidateLicenceKeyDialog extends StatefulWidget {
  const ValidateLicenceKeyDialog({super.key});

  @override
  State<ValidateLicenceKeyDialog> createState() => _CheckLicenseState();
}

class _CheckLicenseState extends State<ValidateLicenceKeyDialog> {
  final textController = CommonTextFieldController();
  bool checkLicense = true;
  bool isGenuineLicense = false;
  bool isActivatedLicense = false;

  Widget _commonText(String text1, String text2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Text(
            '$text1: ',
            style: const TextStyle(
                fontWeight: FontWeight.w400, color: C.bluishGray200),
          ),
          Text(
            text2,
            style: const TextStyle(
                fontWeight: FontWeight.w500, color: C.bluishGray400),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.baseWhite,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CommonTextField(
            fieldName: 'First Name',
            hintText: 'XXXX - XXXX - XXXX - XXXX',
            isRequired: true,
            controller: textController,
          ),
          const Spacer(),
          if (checkLicense)
            Wrap(
              children: [
                Container(
                  width: 115,
                  height: 40,
                  color: Colors.transparent,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        width: 1,
                        color: C.bluishGray50,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      checkLicense = false;
                      isActivatedLicense = true;
                      isGenuineLicense = false;

                      setState(() {});
                    },
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: C.error500),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  width: 112,
                  height: 40,
                  color: Colors.transparent,
                  child: ElevatedButton(
                    onPressed: () {
                      checkLicense = false;
                      isActivatedLicense = false;
                      isGenuineLicense = true;
                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: C.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Validate',
                    ),
                  ),
                ),
              ],
            ),
          if (isGenuineLicense)
            Container(
              height: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: C.bluishGray50.withOpacity(0.3),
                border: Border.all(width: 0.5, color: C.bluishGray50),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(I.icVerify),
                      const Text(
                        ' This License Key is Genuine',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: C.success600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  _commonText('Product', 'HB Accounting'),
                  _commonText('Partner', 'Rohit Kumar'),
                  _commonText('Issue Date', '02 Sep 2023'),
                ],
              ),
            ),
          if (isActivatedLicense)
            Container(
              height: 120,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: C.bluishGray50.withOpacity(0.3),
                border: Border.all(width: 0.5, color: C.bluishGray50),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(I.icVerify),
                      const Text(
                        ' This License Key is Already Activated',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: C.success600),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _commonText('Product', 'HB Accounting'),
                          _commonText('Partner', 'Rohit Kumar'),
                          _commonText('Issue Date', '02 Sep 2023'),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _commonText('Firm Name', 'Amit Associates'),
                          _commonText('Customer', 'Rohit Kumar'),
                          _commonText('Activation Date', '28 Sep 2023'),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
}
