import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

// import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/images.dart';
import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/common_text_field_view.dart';
import '../../../../views/drop_down_text_field_view.dart';

/// TODO : Replace from here
void transferLicenseKeyDialog(BuildContext context) async {
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
                SK.transferLicenseKey,
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
            width: double.maxFinite, child: TransferLicenceKeyDialog()),
      );
    },
  );
}

class TransferLicenceKeyDialog extends StatefulWidget {
  const TransferLicenceKeyDialog({Key? key}) : super(key: key);

  @override
  State<TransferLicenceKeyDialog> createState() =>
      _TransferLicenceKeyDialogState();
}

class _TransferLicenceKeyDialogState extends State<TransferLicenceKeyDialog> {
  bool isPartnerSubPartner = false;
  DropDownItem? selectedValue;
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

  Widget partnerSubPartnerText(String text1, String text2) {
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
      body: SingleChildScrollView(
        child: Form(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Partner/Sub Partner*
            CommonDropDownButton<DropDownItem>(
              fieldName: SK.partnerSubPartner,
              isRequired: true,
              hint: '--Select--',
              items: DropDownItem.values,
              selectedValue: selectedValue,
              onChanged: (value) {
                selectedValue = value;
                isPartnerSubPartner = true;
                setState(() {});
              },
              itemAsString: (p0) => p0.title,
            ),
            if (isPartnerSubPartner)
              Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(I.icVerify),
                      Text(
                        ' ${selectedValue?.title}',
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: C.success600),
                      ),
                    ],
                  ),
                  partnerSubPartnerText('License ID', 'LC0094'),
                  partnerSubPartnerText(
                      'Address', 'Andheri East, Mumbai - 654400'),
                ],
              ),
            Row(
              children: [
                //Product/License*
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: CommonDropDownButton<DropDownItem>(
                      fieldName: SK.productLicense,
                      isRequired: true,
                      hint: '--Select--',
                      items: DropDownItem.values,
                      selectedValue: null,
                      onChanged: (value) {},
                      itemAsString: (p0) => p0.title,
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                //Qty
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonTextField(
                          fieldName: SK.qty,
                          hintText: '${SK.enter} ${SK.qty}',
                          controller: CommonTextFieldController(),
                        ),
                        const Text(
                          '55 License keys available.',
                          style: TextStyle(
                            fontSize: 12,
                            color: C.success600,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                //Rate
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: CommonTextField(
                      fieldName: SK.rate,
                      controller: CommonTextFieldController()..text = '0.00',
                    ),
                  ),
                ),
                const SizedBox(width: 24),
                //Amount
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: CommonTextField(
                      fieldName: SK.amount,
                      controller: CommonTextFieldController()..text = '0.00',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
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
                },
                child: const Text(
                  '+ Add New',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: C.primary600),
                ),
              ),
            ),

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
                    _commonSummaryText('Subtotal', '₹0.00', C.bluishGray500),
                    _commonSummaryText('Offer Discount', '₹0.00', C.success500),
                    _commonSummaryText(
                        'Discount', 'Apply Coupon', C.primary600),
                    _commonSummaryText('GST (18%)', '₹0.00', C.bluishGray500),
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
                            '₹0.00',
                            style: TextStyle(
                                color: C.bluishGray500,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

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
                            onPressed: () {},
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
                          width: 115,
                          height: 40,
                          color: Colors.transparent,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Request',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
