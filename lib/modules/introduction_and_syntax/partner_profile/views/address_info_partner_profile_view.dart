import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../utils/constants/colors.dart';
import 'profile_field_detail.dart';

class AddressInfoPartnerProfileView extends GetView {
  const AddressInfoPartnerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Address Information',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        SizedBox(height: 16),
        Wrap(
          direction: Axis.vertical,
          children: [
            Text(
              'Address',
              style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                  color: C.seconderyText),
            ),
            Wrap(
              children: [
                Text(
                    'Plot No-356, Udyog Vihar II Rd, Phase II, Udyog Vihar, Sector 20, Gurugram, Haryana 122016',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: C.primaryText)),
              ],
            ),
          ],
        ),
        SizedBox(height: 24),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          children: [
            ProfileFieldDetail(
              fieldName: 'State',
              data: 'Select',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'City',
              data: 'Select',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Pin',
              data: '233020',
              isRequired: true,
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
