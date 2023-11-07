import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
import '../controllers/partner_profile_controller.dart';
import '../views/address_info_partner_profile_view.dart';
import '../views/personal_info_partner_profile_view.dart';
import '../views/sub_partner_detail_partner_profile_view.dart';

class PartnerProfilePage extends GetView<PartnerProfileController> {
  const PartnerProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 48),
        padding: EdgeInsets.only(
            top: kToolbarHeight / 2,
            bottom: kBottomNavigationBarHeight,
            left: 16,
            right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _Header(),
            _Body(),
          ],
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: C.pureWhite,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: C.border,
        ),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          PersonalInfoPartnerProfileView(),
          SubPartnerDetailPartnerProfileView(),
          AddressInfoPartnerProfileView()
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          'Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        Text(
          'Admin | Partners | SubPartners',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: C.subTitleText,
            letterSpacing: 1.28,
          ),
        ),
        SizedBox(height: 14),
      ],
    );
  }
}
