import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/strings/string_keys.dart';
import '../../../../views/enum/side_menu_enum.dart';
import '../../../../views/side_menu/side_menu_controller.dart';
import '../controllers/leads_controller.dart';

/// TODO: Replace from here
///
///
enum LeadsEnum {
  dashboard,
  allLeads,
  hbAccounting,
  hbNeo,
  hbSuper,
  hbGST,
  hbPOS;

  String get title {
    switch (this) {
      case LeadsEnum.allLeads:
        return SK.allLeads;
      case LeadsEnum.dashboard:
        return SK.home;
      case LeadsEnum.hbAccounting:
        return SK.hbAccounting;
      case LeadsEnum.hbNeo:
        return SK.hbNeo;
      case LeadsEnum.hbSuper:
        return SK.hbSuper;
      case LeadsEnum.hbGST:
        return SK.hbGst;
      case LeadsEnum.hbPOS:
        return SK.hbPos;
    }
  }
}

class LeadsHeader extends GetView<LeadsController> {
  const LeadsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Leads',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w700,
            color: C.primaryText,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() {
                return Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  runSpacing: 10,
                  children: List.generate(
                    LeadsEnum.values.length,
                    (index) => _LeadsButtons(
                      onPressed: () {
                        controller.changeTab(LeadsEnum.values[index]);
                      },
                      text: LeadsEnum.values[index].title,
                      isSelected: controller.selectedTab.value ==
                          LeadsEnum.values[index],
                    ),
                  ),
                );
              }),
            ),
            SizedBox(
              width: 160,
              child: FilterButton(
                items: Period.values,
                selectedValue: Period.thisMonth,
                onChanged: (value) {},
                itemAsString: (p0) {
                  return p0.title;
                },
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
                onPressed: () {
                  Get.find<SideMenuController>().navigate(
                      parent: SideNavBarParentEnum.lead,
                      child: SideNavBarChildEnum.addLead);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      // const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
                      const EdgeInsets.symmetric(
                          vertical: 13.5, horizontal: 16),
                  backgroundColor: C.background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                // icon: const Icon(Icons.add),
                icon: SvgPicture.asset(I.icAdd),
                label: const Text('Add Leads'))
          ],
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
      ],
    );
  }
}

class _LeadsButtons extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onPressed;
  const _LeadsButtons({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return isSelected
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: C.button,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
          )
        : OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                width: 1,
                color: C.seconderyButtonBorder,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: C.seconderyButtonText),
            ),
          );
  }
}

/// TODO : Replace from here
///
///
enum Period {
  thisMonth(title: 'This Month'),
  previousMonth(title: 'Previous Month'),
  lastMonth(title: 'Last Month');

  final String title;
  const Period({required this.title});
}

class FilterButton<T> extends StatelessWidget {
  final List<T> items;
  final T selectedValue;
  final ValueChanged<T?> onChanged;
  final String Function(T)? itemAsString;
  final bool isRequired;

  const FilterButton({
    super.key,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.itemAsString,
    this.isRequired = false,
  });
  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.all(8),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(color: C.bluishGray50),
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          isDense: true,
          focusColor: Colors.transparent,
          value: selectedValue,
          icon: SvgPicture.asset(
            I.icArrowDown,
            colorFilter: const ColorFilter.mode(C.blue800, BlendMode.srcIn),
          ),
          onChanged: onChanged,
          items: items.map<DropdownMenuItem<T>>(
            (T value) {
              return DropdownMenuItem<T>(
                value: value,
                child: Text(
                  itemAsString?.call(value) ?? value.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: C.blue800, fontWeight: FontWeight.w600),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}



// Test Example
// GridView.builder(
//   physics: const NeverScrollableScrollPhysics(),
//   shrinkWrap: true,
//   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
//     maxCrossAxisExtent: 300,
//     crossAxisSpacing: 16,
//     mainAxisSpacing: 16,
//     mainAxisExtent: 120,
//   ),
//   itemCount: 8, // Total number of items
//   itemBuilder: (BuildContext context, int index) {
//     return const LeadItem(
//       title: 'Total Lead',
//       total: '450',
//       image: I.icTotalLead,
//       color: C.seconday50,
//     );
//   },
// ),
