import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../controllers/add_sub_partner_controller.dart';
import '../views/add_address_info_sub_partner_view.dart';
import '../views/add_login_cred_sub_partner_view.dart';
import '../views/add_personal_info_sub_partner_view.dart';
import '../views/add_sub_partner_details_view.dart';

/// TODO : Remove from Here
typedef Pages = List<Widget>;

class AddSubPartnerPage extends GetView<AddSubPartnerController> {
  const AddSubPartnerPage({Key? key}) : super(key: key);

  static const Pages pages = [
    AddPersonalInfoSubPartnerView(),
    AddSubPartnerDetailsView(),
    AddAddressInfoSubPartnerView(),
    AddLoginCredSubPartnerView(),
  ];

  Padding dottedline(bool isSelected) {
    return Padding(
      padding: const EdgeInsets.only(left: 19),
      child: DottedLine(
        dashLength: 8,
        dashGapLength: 8,
        lineThickness: 2,
        dashColor: isSelected ? C.stepper : const Color(0xFFDDD1CB),
        dashGapColor: Colors.transparent,
        direction: Axis.vertical,
        lineLength: 70,
      ),
    );
  }

  Row stepper(int index, String text, bool isSelected) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isSelected ? C.stepper : null,
            border: Border.all(
              color: C.stepper.withOpacity(0.3),
            ),
          ),
          child: isSelected
              ? const Icon(
                  Icons.check,
                  color: C.pureWhite,
                )
              : Text('${index + 1}'),
        ),
        const SizedBox(width: 8),
        Flexible(
            child: Text(
          text,
          style: const TextStyle(color: C.bluishGray300, fontSize: 16),
        ))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.backgroundColor,
      body: GetBuilder<AddSubPartnerController>(
        init: controller,
        builder: (_) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Card(
                  margin: EdgeInsets.zero,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: AddSubPartnerView.values.map((e) {
                        final isSelected =
                            (controller.currentView.value == null) ||
                                (e.i < (controller.currentView.value?.i ?? 0));
                        if (e.index == AddSubPartnerView.values.last.index) {
                          return stepper(e.i, e.title, isSelected);
                        }
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            stepper(e.i, e.title, isSelected),
                            dottedline(isSelected)
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 14,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: IndexedStack(
                      index: controller.currentView.value?.i ??
                          AddSubPartnerView.values.last.i,
                      children: pages,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
