import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';

import 'profile_field_detail.dart';

class PersonalInfoPartnerProfileView extends GetView {
  const PersonalInfoPartnerProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundImage: NetworkImage(
                'https://picsum.photos/200/300',
                // fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mr. Aditya Kumar Singh',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: C.primaryText,
                  ),
                ),
                Text(
                  'Sub Partner',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
        SizedBox(height: 32),
        Text(
          'Personal Information',
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
              fieldName: 'Email',
              data: 'Adi73@gmail.com',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Alternative Email',
              data: 'Aditya33@gmail.com',
            ),
            ProfileFieldDetail(
              fieldName: 'Mobile',
              data: '9457003800',
            ),
            ProfileFieldDetail(
              fieldName: 'Alternative Mobile',
              data: '9457003800',
            ),
            ProfileFieldDetail(
              fieldName: 'Adhar Number',
              data: '7890 7494 0099',
            ),
            ProfileFieldDetail(
              fieldName: 'Pan Number',
              data: 'BYTP03377',
            ),
            ProfileFieldDetail(
              fieldName: 'Gender',
              data: 'Male',
              isRequired: true,
            ),
            ProfileFieldDetail(
              fieldName: 'Date of Birth',
              data: '23-06-23',
            ),
            ProfileFieldDetail(
              fieldName: 'Landline Number',
              data: '9457003800',
            ),
            ProfileFieldDetail(
              fieldName: 'Fax No.',
              data: '09-05-12',
            ),
            ProfileFieldDetail(
              fieldName: 'Anniversary Date',
              data: '09-05-12',
            ),
          ],
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
