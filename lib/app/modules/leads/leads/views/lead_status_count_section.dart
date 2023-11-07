import 'package:flutter/widgets.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';

class LeadStatusCountSection extends StatelessWidget {
  const LeadStatusCountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 300,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        mainAxisExtent: 120,
      ),
      children: const [
        // Total Lead
        LeadItem(
          title: 'Total Lead',
          total: '450',
          image: I.icTotalLead,
          color: C.seconday50,
        ),
        // Pending Leads
        LeadItem(
          title: 'Pending Leads',
          total: '50',
          image: I.icPendingLeads,
          color: C.warning50,
        ),
        // Demo Schedule
        LeadItem(
          title: 'Demo Schedule',
          total: '35',
          image: I.icDemoSchedule,
          color: C.success50,
        ),
        // Call Back Lead
        LeadItem(
          title: 'Follow-up',
          total: '04',
          image: I.icFollowUp,
          color: C.warning50,
        ),
        // Converted
        LeadItem(
          title: 'Converted',
          total: '254',
          image: I.icConverted,
          color: C.success50,
        ),
        // Demo Done
        LeadItem(
          title: 'Demo Done',
          total: '23',
          image: I.icDemoDone,
          color: C.primary50,
        ),
        // Not Interested
        LeadItem(
          title: 'Not Interested',
          total: '04',
          image: I.icNotInterested,
          color: C.warning50,
        ),
        // Not Converted
        LeadItem(
          title: 'Not Converted',
          total: '04',
          image: I.icNotConverted,
          color: C.error50,
        ),
      ]
    );
  }
}

class LeadItem extends StatelessWidget {
  final String title;
  final String total;
  final String image;
  final Color color;
  const LeadItem({
    required this.title,
    required this.total,
    required this.image,
    required this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: color),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: C.bluishGray500),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  total,
                  style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: C.bluishGray500),
                ),
              ],
            ),
          ),
          Expanded(flex: 2, child: SvgPicture.asset(image))
        ],
      ),
    );
  }
}
