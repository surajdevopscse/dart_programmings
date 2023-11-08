import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/modules/introduction_and_syntax/add_sub_partner/controllers/add_sub_partner_controller.dart';
import 'package:dart_programing/app/views/common_text_field_view.dart';
import 'package:dart_programing/app/views/drop_down_text_field_view.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

class AddPersonalInfoSubPartnerView extends GetView<AddSubPartnerController> {
  const AddPersonalInfoSubPartnerView({Key? key}) : super(key: key);
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
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: C.primaryText,
                  ),
                ),
                const SizedBox(height: 16),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: C.backgroundColor,
                  child: SvgPicture.asset(I.icCamera),
                ),
                const SizedBox(height: 16),
                Form(
                    child: Column(
                  children: [
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Salutation',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),

                        //First Name*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'First Name',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Aditya',
                          ),
                        ),
                        //Middle Name
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Middle Name',
                            controller: CommonTextFieldController()
                              ..text = 'Kumar',
                          ),
                        ),
                        //Last Name
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Last Name',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Singh',
                          ),
                        ),
                        // Email*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Email',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'abc@gmail.com',
                          ),
                        ),
                        //Alternative Email
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Alternative Email',
                            controller: CommonTextFieldController()
                              ..text = 'tuv@gmail.com',
                          ),
                        ),
                        //Mobile
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Mobile',
                            controller: CommonTextFieldController()
                              ..text = '7903411003',
                          ),
                        ),
                        //Alternative Mobile
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Alternative Mobile',
                            controller: CommonTextFieldController(),
                          ),
                        ),
                        // Aadhar Number
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Aadhar Number',
                            controller: CommonTextFieldController()
                              ..text = '7890 7494 0099',
                          ),
                        ),
                        // Pan Number*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Pan Number',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'BYTP03377',
                          ),
                        ),
                        //Gender*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Gender',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Date of Birth
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Date of Birth',
                            controller: CommonTextFieldController()
                              ..text = '23-06-23',
                            readOnly: true,
                            suffixIcon: const Icon(
                              Icons.calendar_month,
                              color: C.seconderyText,
                              size: 20,
                            ),
                          ),
                        ),
                        // Landline Number
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Landline Number',
                            controller: CommonTextFieldController()
                              ..text = '7890000987',
                          ),
                        ),
                        // Fax No.
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Fax No.',
                            controller: CommonTextFieldController()
                              ..text = '09-05-12',
                          ),
                        ),
                        // Anniversary Date
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Anniversary Date',
                            controller: CommonTextFieldController()
                              ..text = '09-05-12',
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
