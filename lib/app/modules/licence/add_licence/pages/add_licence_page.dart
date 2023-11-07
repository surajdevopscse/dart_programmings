import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/images.dart';
import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/common_text_field_view.dart';
import '../../../../views/drop_down_text_field_view.dart';
import '../controllers/add_licence_controller.dart';
import 'package:dotted_line/dotted_line.dart';

class AddLicencePage extends GetView<AddLicenceController> {
  const AddLicencePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SingleChildScrollView(
            // padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            padding: EdgeInsets.all(16),
            child: AddLicence()));
  }
}

/// TODO: Please Make Additional Coupon Dialog
///
///
void _showDialog(BuildContext context) async {
  return await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        content: SizedBox(
          width: 1000,
          height: 860,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Licence Keys',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF140F29),
                      )),
                  // CommonDropdown(options: items, onChanged: (value) {})
                ],
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: 2, color: Color(0xFF0067B1)))),
                    child: const Text(
                      'Available Licences',
                      style: TextStyle(color: Color(0xFF0067B1)),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: const Text(
                      'Used Licences',
                      style: TextStyle(),
                    ),
                  )
                ],
              ),
              const Divider(
                height: 0,
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F1F9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Diamond',
                      style: TextStyle(color: Color(0xFF0067B1)),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F1F9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Gold',
                      style: TextStyle(color: Color(0xFF0067B1)),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFE6F1F9),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Silver',
                      style: TextStyle(color: Color(0xFF0067B1)),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 332,
                child: GridView.builder(
                    padding: const EdgeInsets.all(20),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 16,
                            mainAxisSpacing: 16,
                            childAspectRatio: 0.9),
                    itemCount: 24,
                    itemBuilder: (context, index) {
                      return GridTile(
                          child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: const Color(0xFFBEBBBB)),
                          gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [Color(0xFFEBE2E2), Colors.white]),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              I.icDiamond,
                            ),
                            const Text(
                              'HB Neo ERP9 + Diamond',
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xFF140F29)),
                            ),
                            const Text(
                              'Serial no. 1876900',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFF625E70)),
                            ),
                            const Text(
                              '9884-8584-9889-4895-3895',
                              style: TextStyle(
                                  fontSize: 14, color: Color(0xFFAE94A2)),
                            ),
                            const DottedLine(
                              dashLength: 8,
                              dashGapLength: 8,
                              lineThickness: 1,
                              dashColor: Color(0xFFDDD1CB),
                              dashGapColor: Colors.transparent,
                              direction: Axis.horizontal,
                              lineLength: 150,
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Apply Key',
                                style: TextStyle(
                                    fontSize: 14, color: Color(0xFF967988)),
                              ),
                            )
                          ],
                        ),
                      )
                          // child: CustomPaint(
                          //   foregroundPainter: CustomContainerShapeBorder(
                          //       fillColor: const Color(0xFFA997A0)),
                          //   painter: CustomContainerShapeBorder(
                          //       fillColor: const Color(0xFFA997A0)),
                          //   child: CustomPaint(
                          //     foregroundPainter: CustomContainerShapeBorder(
                          //         style: PaintingStyle.fill),
                          //     painter: CustomContainerShapeBorder(
                          //         style: PaintingStyle.fill),
                          //     child: Expanded(
                          //       child: Container(
                          //           child: const Center(child: Text('Hello'))),
                          //     ),
                          //   ),
                          // ),
                          );
                    }),
              )
            ],
          ),
        ),
      );
    },
  );
}

class AddLicence extends StatelessWidget {
  const AddLicence({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          SK.addLicence,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        Text(
          SK.homeLicenceAddLicence,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: C.subTitleText,
            letterSpacing: 1.28,
          ),
        ),
        const SizedBox(height: 24),
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
                  SK.addLicence,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: C.primaryText,
                  ),
                ),
                const SizedBox(height: 24),
                Form(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        //First Name*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.firstName,
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Aditya',
                          ),
                        ),
                        //Middle Name
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.middleName1,
                            controller: CommonTextFieldController()
                              ..text = 'Kumar',
                          ),
                        ),
                        //Last Name
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.lastName,
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Singh',
                          ),
                        ),

                        //City
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: SK.city,
                            hint: 'Gurgaon',
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),

                        // Pin code*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            isRequired: true,
                            fieldName: SK.pinCode,
                            controller: CommonTextFieldController()
                              ..text = '203377',
                          ),
                        ),
                        // Website
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.website,
                            controller: CommonTextFieldController()
                              ..text = 'HB Neo',
                          ),
                        ),
                        //Date
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.date,
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
                        //Type
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: SK.type,
                            hint: 'Select',
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Software Type
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: SK.softwareType,
                            hint: SK.select,
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Old Software
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.oldSoftware,
                            controller: CommonTextFieldController()
                              ..text = 'HB Neo',
                          ),
                        ),
                        //Remarks
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.remarks,
                            controller: CommonTextFieldController()..text = '',
                          ),
                        ),
                        //Exception Code
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: SK.exceptionCode,
                            controller: CommonTextFieldController()..text = '',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),
                    //Registered Company
                    Text(
                      SK.registeredCompany,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: C.primaryText,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 24,
                        spacing: 24,
                        children: [
                          //Company Name*
                          SizedBox(
                            width: 200,
                            child: CommonTextField(
                              fieldName: SK.companyName,
                              isRequired: true,
                              controller: CommonTextFieldController()
                                ..text = 'HB Neo',
                            ),
                          ),
                          // Mobile No.
                          SizedBox(
                            width: 200,
                            child: CommonTextField(
                              fieldName: '${SK.mobileNo}.',
                              controller: CommonTextFieldController()
                                ..text = '8400387992',
                            ),
                          ),
                          //Address
                          CommonTextField(
                            fieldName: SK.address,
                            controller: CommonTextFieldController()
                              ..text = 'Plot No-356, Udyog Vihar II Rd, Ph...',
                          ),
                          // Pin Code*
                          SizedBox(
                            width: 200,
                            child: CommonTextField(
                              fieldName: SK.pinCode,
                              controller: CommonTextFieldController()
                                ..text = '201308',
                            ),
                          ),
                          //State
                          SizedBox(
                            width: 200,
                            child: CommonDropDownButton<DropDownItem>(
                              fieldName: SK.state,
                              hint: 'Haryana',
                              items: DropDownItem.values,
                              selectedValue: null,
                              onChanged: (value) {},
                              itemAsString: (p0) => p0.title,
                            ),
                          ),
                          //City
                          SizedBox(
                            width: 200,
                            child: CommonDropDownButton<DropDownItem>(
                              fieldName: SK.city,
                              hint: 'Gurgaon',
                              items: DropDownItem.values,
                              selectedValue: null,
                              onChanged: (value) {},
                              itemAsString: (p0) => p0.title,
                            ),
                          ),
                          //Country
                          SizedBox(
                            width: 200,
                            child: CommonDropDownButton<DropDownItem>(
                              fieldName: SK.country,
                              hint: 'India',
                              items: DropDownItem.values,
                              selectedValue: null,
                              onChanged: (value) {},
                              itemAsString: (p0) => p0.title,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    //For Code SMS & Mall
                    Text(
                      SK.forCodeSMSMall,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: C.primaryText,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Form(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        runSpacing: 24,
                        spacing: 24,
                        children: [
                          //Registered Mobile
                          SizedBox(
                            width: 200,
                            child: CommonTextField(
                              fieldName: SK.registeredMobile,
                              isRequired: true,
                              controller: CommonTextFieldController()
                                ..text = '8400387992',
                            ),
                          ),
                          // Registered Email
                          SizedBox(
                            width: 200,
                            child: CommonTextField(
                              fieldName: SK.registeredEmail,
                              controller: CommonTextFieldController()
                                ..text = 'Adi982@gmail.com',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFFB0D3EC)),
                        color: const Color(0xFFE6F1F9),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(I.icStar),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(
                                SK.applyLicenceKey,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              )
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              SK.showKeys,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        SK.enterManually,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                InkWell(
                  onTap: () {
                    _showDialog(context);
                  },
                  child: Container(
                    width: 192,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: const Color(0xFFB0D3EC)),
                    ),
                    child: Center(
                      child: Text(
                        '+ ${SK.additionalCoupon}',
                        style: const TextStyle(
                            fontSize: 14, color: Color(0xFF0071BC)),
                      ),
                    ),
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
                      width: 112,
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
