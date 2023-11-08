import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import 'profile_field_detail.dart';

class SubPartnerDetailPartnerProfileView extends GetView {
  const SubPartnerDetailPartnerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Sub Partner Details',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            ProfileFieldDetail(
              fieldName: 'Name of Proprietor/Sub Partner',
              data: 'Aditya Birla',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Type of Business/Profession',
              data: 'Firm',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Sub Partner Type',
              data: 'Sub Partner',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Margin %',
              data: '59%',
            ),
            ProfileFieldDetail(
              fieldName: 'BDM Reporting',
              data: 'Select',
            ),
            ProfileFieldDetail(
              fieldName: 'Sub Partner Reporting',
              data: 'Select',
            ),
            ProfileFieldDetail(
              fieldName: 'GSTN',
              data: 'FDfg00885',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'No. of Employees',
              data: '45',
            ),
            ProfileFieldDetail(
              fieldName: 'Sales',
              data: '7890',
            ),
            ProfileFieldDetail(
              fieldName: 'Service and Support',
              data: '|',
            ),
            ProfileFieldDetail(
              fieldName: 'Interested to work as',
              data: 'Active Partner',
            ),
            ProfileFieldDetail(
              fieldName: 'Status',
              data: 'Active',
            ),
            ProfileFieldDetail(
              fieldName:
                  'How you come to know about Hostbooks Products and its Opportunity?',
              data: 'Instagram',
            ),
            ProfileFieldDetail(
              fieldName:
                  'Are you willing to buy 8100/- self use (Multi User) Lifetime Renewal free License',
              data: 'Yes',
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
