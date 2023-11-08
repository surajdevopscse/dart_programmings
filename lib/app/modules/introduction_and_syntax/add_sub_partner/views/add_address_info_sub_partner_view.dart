import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/modules/introduction_and_syntax/add_sub_partner/controllers/add_sub_partner_controller.dart';

import '../../../../../constants/colors.dart';
import '../../../../views/common_text_field_view.dart';
import '../../../../views/drop_down_text_field_view.dart';

class AddAddressInfoSubPartnerView extends GetView<AddSubPartnerController> {
  const AddAddressInfoSubPartnerView({Key? key}) : super(key: key);
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
                const Text(
                  'Address Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: C.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CommonTextField(
                      fieldName: 'Address',
                      controller: CommonTextFieldController()
                        ..text =
                            'Plot No-356, Udyog Vihar II Rd, Phase II, Udyog Vihar, Sector 20, Gurugram, Haryana 122016',
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        //State*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'State',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // City*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'City',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Pin code*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Pin code',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = '233020',
                          ),
                        ),
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
