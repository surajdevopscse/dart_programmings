import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../constants/colors.dart';
import '../../../../views/common_text_field_view.dart';
import '../../../../views/drop_down_text_field_view.dart';
import '../../../../views/table/common_table_widget.dart';
import '../controllers/leads_controller.dart';

class AllLeads extends GetView<LeadsController> {
  const AllLeads({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _AllLeadsCountSection(),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 16),
        Expanded(child: _AllLeadTableSection()),
      ],
    );
  }
}

/// TODO : Replace with actual model
///
///
class TempAllLeadCount {
  final String title;
  final int total;
  final Color color;
  const TempAllLeadCount(
      {required this.title, required this.total, required this.color});
}

class _AllLeadsCountSection extends StatelessWidget {
  const _AllLeadsCountSection();
  static const List<TempAllLeadCount> data = [
    TempAllLeadCount(title: 'Total Leads', total: 450, color: C.seconday50),
    TempAllLeadCount(title: 'Pending', total: 50, color: C.warning50),
    TempAllLeadCount(title: 'Demo Schedule', total: 35, color: C.success50),
    TempAllLeadCount(title: 'Follow-up', total: 04, color: C.primary50),
    TempAllLeadCount(title: 'Converted', total: 315, color: C.seconday50),
    TempAllLeadCount(title: 'Demo Done', total: 23, color: C.warning50),
    TempAllLeadCount(title: 'Not Interested', total: 04, color: C.error50),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 160,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        mainAxisExtent: 90,
      ),
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: data[index].color,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                data[index].title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: C.bluishGray500,
                ),
              ),
              Text(
                '${data[index].total}',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: C.bluishGray500,
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

/// All Lead Table Section
///
///
class _AllLeadTableSection extends GetView<LeadsController> {
  const _AllLeadTableSection();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: C.bluishGray50)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Form(
              child: Row(
            children: [
              Wrap(spacing: 24, runSpacing: 24, children: [
                SizedBox(
                  width: 200,
                  child: CommonTextField(
                    // fieldName: '--Search--',
                    fieldName: '',
                    hintText: '--Search--',
                    suffixIcon: const Icon(Icons.search),
                    controller: CommonTextFieldController(),
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: CommonDropDownButton<DropDownItem>(
                    fieldName: '',
                    items: DropDownItem.values,
                    selectedValue: null,
                    hint: '--Select--',
                    onChanged: (value) {},
                    itemAsString: (p0) => p0.title,
                  ),
                ),
              ]),
            ],
          )),
          Expanded(
            child: HbDataTable(
              columnData: controller.leadListingTable,
              currentPageIndex: 1,
              limit: 15,
              totalItems: controller.leadListingTable.length,
              pageCount: 0,
            ),
          ),
        ],
      ),
    );
  }
}
