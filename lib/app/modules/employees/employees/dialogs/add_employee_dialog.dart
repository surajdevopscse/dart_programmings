import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/app/views/common_text_field_view.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:dart_programing/constants/strings/string_keys.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../views/drop_down_text_field_view.dart';
import 'add_employee_designation_dialog.dart';

void addEmployeeDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return const AlertDialog(
        content: SizedBox(
            width: double.maxFinite,
            height: double.maxFinite,
            child: AddEmployeeDialog()),
      );
    },
  );
}

class AddEmployeeDialog extends GetView {
  const AddEmployeeDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.pureWhite,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              SK.employees,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: C.primaryText,
              ),
            ),
            Text(
              SK.adminPartnersSubPartners,
              style: const TextStyle(
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
                    Text(
                      SK.employeeInformation,
                      style: const TextStyle(
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
                            //Employee name*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.employeeName,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = 'Aditya',
                              ),
                            ),

                            // Mobile*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.mobile,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = '9457003800',
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
                            //Business type*
                            SizedBox(
                              width: 200,
                              child: CommonDropDownButton<DropDownItem>(
                                fieldName: SK.businessType,
                                isRequired: true,
                                items: DropDownItem.values,
                                selectedValue: null,
                                hint: SK.select,
                                onChanged: (value) {},
                                itemAsString: (p0) => p0.title,
                              ),
                            ),
                            //Designation*
                            SizedBox(
                              width: 200,
                              child: CommonDropDownButton<String>(
                                fieldName: SK.designation,
                                isRequired: true,
                                isAddMore: true,
                                addMore: () {
                                  addEmployeeDesignationDialog(context);
                                },
                                items: const [
                                  '+ Add Designation',
                                  'Associate',
                                  'Admin',
                                  'Manager',
                                  'Field Staff'
                                ],
                                selectedValue: null,
                                hint: SK.select,
                                onChanged: (value) {},
                              ),
                            ),
                            //Date of Joining*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.dateOfJoining,
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
                            // Experience(yrs)*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.experienceYr,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = '05',
                              ),
                            ),
                            //Working location*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.workingLocation,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = 'Plot No-356, Udyog Vihar',
                              ),
                            ),
                            //Pin code*

                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.pinCode2,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = '203377',
                              ),
                            ),
                            //Latitude*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.latitude,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = '',
                              ),
                            ),
                            //Longitude*
                            SizedBox(
                              width: 200,
                              child: CommonTextField(
                                fieldName: SK.longitude,
                                isRequired: true,
                                controller: CommonTextFieldController()
                                  ..text = '',
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
                            child: Text(
                              SK.cancel,
                              style: const TextStyle(
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
                              _showDialog(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: C.button,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: Text(
                              SK.create,
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
        ),
      ),
    );
  }

  void _showDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) {
        return const _SuccessDialog();
      },
    );
  }
}

class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 48, horizontal: 40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const CircleAvatar(
            radius: 32,
            backgroundColor: C.success,
            child: Icon(
              Icons.check,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(height: 24),
          const Text(
            'Successfully Created',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: C.primaryText,
            ),
          ),
          const Text(
            'You have successfully created Sub Partner',
            style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: C.seconderyText),
          ),
          const SizedBox(height: 24),
          const Divider(),
          const SizedBox(height: 24),
          const Text(
            'Mr. Aditya Singh',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: C.primaryText),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'License ID - ',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: C.seconderyText),
              ),
              Text(
                'LC0094',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                    color: C.success700),
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              Container(
                width: 200,
                height: 40,
                color: Colors.transparent,
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                      width: 1,
                      color: C.buttonBorder,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Share via mail',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: C.buttonBorder),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Container(
                width: 200,
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
                    'Download',
                  ),
                ),
              ),
              const SizedBox(height: 16)
            ],
          )
        ],
      ),
    );
  }
}
