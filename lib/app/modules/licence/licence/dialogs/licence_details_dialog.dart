import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';

import '../../../../../constants/strings/string_keys.dart';

/// TODO : Replace from here
void licenseDetailsDialog(BuildContext context) async {
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
              Text(
                SK.licenseDetails,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: C.bluishGray500),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.close,
                  color: C.bluishGray200,
                ),
              ),
            ],
          ),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: const SizedBox(
            width: double.maxFinite, child: LicenceDetailsDialog()),
      );
    },
  );
}

class LicenceDetailsDialog extends GetView {
  const LicenceDetailsDialog({super.key});

  RichText _titleSmall(String text1, String text2) {
    return RichText(
      text: TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: '$text1 ',
            style: const TextStyle(
                color: C.bluishGray500, fontWeight: FontWeight.w500),
          ),
          TextSpan(
            text: text2,
            style: const TextStyle(color: C.bluishGray400),
          ),
        ],
      ),
    );
  }

  Column _titleMedium(String text1, String text2, [bool isRequire = false]) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isRequire
            ? Row(
                children: [
                  Text(
                    text1,
                    style: const TextStyle(color: C.bluishGray200),
                  ),
                  const Text(
                    '*',
                    style: TextStyle(color: C.error500),
                  )
                ],
              )
            : Text(
                text1,
                style: const TextStyle(color: C.bluishGray200),
              ),
        const SizedBox(height: 8),
        Text(
          text2,
          style: const TextStyle(
              color: C.bluishGray500,
              fontWeight: FontWeight.w500,
              fontSize: 16),
        ),
      ],
    );
  }

  Widget _commonSummaryText(String text1, String text2, Color clr) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: const TextStyle(color: C.bluishGray200),
          ),
          Text(
            text2,
            style: TextStyle(color: clr, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.baseWhite,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      color: C.warning50,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Text(
                    '• Pending',
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: C.warning500),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _titleSmall(SK.requestNo, 'RQ2023/050/A546'),
                    _titleSmall(SK.issueDate1, '10 Aug 2023'),
                  ],
                )
              ],
            ),
            const SizedBox(height: 40),
            Row(
              children: [
                Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          SK.requestedBy,
                          style: const TextStyle(color: C.bluishGray200),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Ankit Association Private Limited',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: C.bluishGray500),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Hedavkar Wadi No 1, N M Kale Mg, Gokhale Rd South,dadar, Dadar',
                          style: TextStyle(
                              color: C.bluishGray200,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 8),
                        _titleSmall('${SK.mobileNo}.:', '7068909372'),
                        const SizedBox(height: 8),
                        _titleSmall(
                            '${SK.emailId}:', 'Ankitassociation@gmail.com')
                      ],
                    )),
                // const SizedBox(width: 160),
                const Spacer(flex: 2),
                Expanded(
                  flex: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        'Issued by',
                        style: TextStyle(color: C.bluishGray200),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Hostbooks Private Limited',
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: C.bluishGray500),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Plot No-356, Udyog Vihar II Rd, Phase II, Udyog Vihar, Sector 20, Gurugram, Haryana 122016',
                        style: TextStyle(
                            color: C.bluishGray200,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      _titleSmall('${SK.mobileNo}.:', '9038909372'),
                      const SizedBox(height: 8),
                      _titleSmall('${SK.emailId}:', 'Hostbooks@gmail.com')
                    ],
                  ),
                ),
                // const SizedBox(width: 160),
                const Spacer(flex: 2),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _titleMedium(SK.productLicense, 'HB Accounting- Gold', true),
                _titleMedium(SK.partnerType, '-'),
                _titleMedium(SK.planType, 'Gold (3 Years)'),
                _titleMedium(SK.qty, '10'),
                _titleMedium(SK.rate, '1200.00'),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Container(
                color: Colors.transparent,
                width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _commonSummaryText(
                        'Subtotal', '₹2,880.99', C.bluishGray500),
                    _commonSummaryText(
                        'Offer Discount', '-₹2,880.99', C.success500),
                    _commonSummaryText(
                        'Discount', 'Apply Coupon', C.primary600),
                    _commonSummaryText(
                        'GST (18%)', '₹2,880.99', C.bluishGray500),
                    const Padding(
                      padding: EdgeInsets.all(8),
                      child: DottedLine(
                        lineLength: double.infinity,
                        dashLength: 8,
                        dashGapLength: 8,
                        lineThickness: 1,
                        dashColor: Color(0xFFDDD1CB),
                        dashGapColor: Colors.transparent,
                        direction: Axis.horizontal,
                      ),
                    ),
                    // Total Amount
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total Amount',
                            style: TextStyle(
                                color: C.bluishGray500,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text(
                            '₹2,880.99',
                            style: TextStyle(
                                color: C.bluishGray500,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
