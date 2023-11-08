import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/modules/introduction_and_syntax/add_sub_partner/controllers/add_sub_partner_controller.dart';
import 'package:dart_programing/app/views/common_text_field_view.dart';

import '../../../../../constants/colors.dart';
import '../../../../views/drop_down_text_field_view.dart';

enum RadioButtons {
  activePartner(title: 'Active Partner'),
  hbPartner(title: 'HB Partner'),
  active(title: 'Active'),
  nonActive(title: 'Non-Active'),
  yes(title: 'Yes'),
  no(title: 'No');

  final String title;
  const RadioButtons({required this.title});
}

class AddSubPartnerDetailsView extends GetView<AddSubPartnerController> {
  const AddSubPartnerDetailsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Sub Partner Information',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        const Text(
          'Admin | Partners | SubPartners',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: C.subTitleText,
            letterSpacing: 1.28,
          ),
        ),
        const SizedBox(height: 14),
        Card(
          margin: EdgeInsets.zero,
          child: Container(
            padding: const EdgeInsets.all(16.0),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Sub Partner Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: C.primaryText,
                    )),
                const SizedBox(height: 16),
                Form(
                    child: Column(
                  children: [
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        //Name of Proprietor/Sub Partner*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Name of Proprietor/Sub Partner',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Aditya Birla',
                          ),
                        ),
                        //Type of Business/Profession*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Type of Business/Profession',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Sub Partner Type*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Sub Partner Type',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Margin %
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                              fieldName: 'Margin %',
                              isRequired: true,
                              controller: CommonTextFieldController()),
                        ),
                        // BDM Reporting
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'BDM Reporting',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Sub Partner Reporting
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Sub Partner Reporting',
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // GSTN
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                              fieldName: 'GSTN',
                              controller: CommonTextFieldController()),
                        ),
                        //No. of Employees
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                              fieldName: 'No. of Employees',
                              controller: CommonTextFieldController()
                                ..text = '45'),
                        ),
                        //Sales
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                              fieldName: 'Sales',
                              controller: CommonTextFieldController()
                                ..text = '7890'),
                        ),
                        // Service and Support
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Service and Support',
                            controller: CommonTextFieldController(),
                          ),
                        ),
                        //How you come to know about Hostbooks Products and its Opportunity?
                        Padding(
                          padding: const EdgeInsets.only(right: 65),
                          child: CommonTextField(
                            fieldName:
                                'How you come to know about Hostbooks Products and its Opportunity?',
                            controller: CommonTextFieldController(),
                            suffixIcon: const Icon(
                              Icons.arrow_drop_down,
                              color: C.seconderyText,
                            ),
                          ),
                        ),
                        //
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Interested to work as',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: 50),
                              ],
                            ),
                            // Active Partner
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.activePartner,
                                  groupValue: RadioButtons.activePartner,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.activePartner.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            // HB Partner
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.activePartner,
                                  groupValue: RadioButtons.hbPartner,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.hbPartner.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),

                            // Status
                            Container(
                              alignment: Alignment.center,
                              width: 200,
                              // height: 28,
                              child: const Text(
                                'Status',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                            ),

                            // Active
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.active,
                                  groupValue: RadioButtons.active,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.active.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            // Non Active
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.active,
                                  groupValue: RadioButtons.nonActive,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.nonActive.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                )
                              ],
                            ),
                          ],
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Wrap(
                              children: [
                                Text(
                                  'Are you willing to buy 8100/- self use (Multi User) Lifetime Renewal free License',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(width: 30),
                              ],
                            ),
                            // yes
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.yes,
                                  groupValue: RadioButtons.yes,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.yes.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            const SizedBox(width: 20),
                            // No
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Radio<RadioButtons>(
                                  fillColor: MaterialStateColor.resolveWith(
                                      (states) => C.buttonBorder),
                                  value: RadioButtons.no,
                                  groupValue: RadioButtons.yes,
                                  onChanged: (RadioButtons? value) {},
                                ),
                                Text(
                                  RadioButtons.no.title,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                )),
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
                      width: 112,
                      height: 40,
                      color: Colors.transparent,
                      child: ElevatedButton(
                        onPressed: () {
                          controller.moveToNextView();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: C.button,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: const Text(
                          'Next',
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
