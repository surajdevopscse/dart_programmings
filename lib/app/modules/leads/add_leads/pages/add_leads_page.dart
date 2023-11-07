import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../views/common_text_field_view.dart';
import '../../../../views/drop_down_text_field_view.dart';
import '../controllers/add_leads_controller.dart';

class AddLeadsPage extends GetView<AddLeadsController> {
  const AddLeadsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 48),
        child: AddLeads(),
      ),
    );
  }
}

/// TODO : Remove all enum from here
///
///

enum LeadSource {
  website(title: 'Website'),
  socialMedia(title: 'Social Media'),
  event(title: 'Event'),
  referral(title: 'Referral');

  final String title;
  const LeadSource({required this.title});
}

enum LeadRating {
  coldlead(title: 'Cold lead'),
  hotlead(title: 'Hot lead'),
  warmLead(title: 'Warm Lead'),
  informationQualifiedLeads(title: 'Information qualified leads'),
  marketingQualifiedLeads(title: 'Marketing qualified leads'),
  salesQualifiedLeads(title: 'Sales qualified leads'),
  ;

  final String title;
  const LeadRating({required this.title});
}

enum LeadStatus {
  new_(title: 'New'),
  renewal(title: 'Renewal'),
  working(title: 'Working'),
  contracted(title: 'Contracted'),
  reschedule(title: 'Reschedule'),
  converted(title: 'Converted'),
  failed(title: 'Failed'),
  closed(title: 'Closed'),
  unqualified(title: 'Unqualified'),
  ;

  final String title;
  const LeadStatus({required this.title});
}

enum PreferredCommunication {
  inCall(title: 'In-Call'),
  mail(title: 'Mail'),
  inPerson(title: 'In-Person'),
  ;

  final String title;
  const PreferredCommunication({required this.title});
}

class AddLeads extends StatelessWidget {
  const AddLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Add Leads',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        const Text('Home | leads | Add Leads',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: C.subTitleText,
              letterSpacing: 1.28,
            )),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(16.0),
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: C.border)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('Add Leads',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: C.primaryText,
                  )),
              const SizedBox(height: 16),
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
                            fieldName: 'First Name',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Aditya Birla',
                          ),
                        ),
                        //Last Name*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Last Name',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Singh',
                          ),
                        ),
                        //Email*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Email',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'Adi73@gmail.com',
                          ),
                        ),
                        //Mobile*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Mobile',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = '9457003800',
                          ),
                        ),
                        //Company name*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Company name',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = 'HB Neo',
                          ),
                        ),
                        //Job Title*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Job Title',
                            controller: CommonTextFieldController()
                              ..text = 'Sales',
                          ),
                        ),
                        //Lead Source*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<LeadSource>(
                            fieldName: 'Lead Source',
                            isRequired: true,
                            items: LeadSource.values,
                            selectedValue: LeadSource.socialMedia,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        //Lead Status*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<LeadStatus>(
                            fieldName: 'Lead Status',
                            isRequired: true,
                            // selectedValue: null,
                            // onChanged: (value) {},
                            // itemAsString: (p0) => p0.title,

                            items: LeadStatus.values,
                            // hint: 'Working',
                            selectedValue: LeadStatus.working,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Industry/Business Type*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Industry/Business Type',
                            hint: 'Accounting',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Lead Rating*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<LeadRating>(
                            fieldName: 'Lead Rating',
                            isRequired: true,
                            items: LeadRating.values,
                            selectedValue: LeadRating.coldlead,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Preferred Communication*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<PreferredCommunication>(
                            fieldName: 'Preferred Communication',
                            isRequired: true,
                            items: PreferredCommunication.values,
                            selectedValue: PreferredCommunication.mail,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Lead Assign to*
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Lead Assign to',
                            isRequired: true,
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Description/Comments*
                        Padding(
                          padding: const EdgeInsets.only(right: 65),
                          child: CommonTextField(
                            fieldName: 'Description/Comments',
                            isRequired: true,
                            controller: CommonTextFieldController(),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 28),
                    const Text('Address Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: C.primaryText,
                        )),
                    const SizedBox(height: 16),
                    Wrap(
                      spacing: 24,
                      runSpacing: 24,
                      children: [
                        //Pin code*
                        SizedBox(
                          width: 200,
                          child: CommonTextField(
                            fieldName: 'Pin code',
                            isRequired: true,
                            controller: CommonTextFieldController()
                              ..text = '203377',
                          ),
                        ),
                        //Country
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'Country',
                            hint: 'Indian',
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),

                        //State
                        SizedBox(
                          width: 200,
                          child: CommonDropDownButton<DropDownItem>(
                            fieldName: 'State',
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
                            fieldName: 'State',
                            hint: 'Gurgaon',
                            items: DropDownItem.values,
                            selectedValue: null,
                            onChanged: (value) {},
                            itemAsString: (p0) => p0.title,
                          ),
                        ),
                        // Address
                        Padding(
                          padding: const EdgeInsets.only(right: 65),
                          child: CommonTextField(
                            fieldName: 'Address',
                            controller: CommonTextFieldController()
                              ..text = 'Plot No-356, Udyog Vihar II Rd, Ph...',
                          ),
                        )
                      ],
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
                              'Create',
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
