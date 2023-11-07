import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leads_controller.dart';
import 'lead_analysis_table_view.dart';
import 'lead_status_action.dart';
import 'lead_status_count_section.dart';
import 'pending_lead_count_table_view.dart';
import 'total_lead_table_view.dart';

class LeadsDashboard extends GetView<LeadsController> {
  const LeadsDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          LeadStatusCountSection(),
          SizedBox(height: 16),
          Divider(),
          SizedBox(height: 16),
          LeadStatusAction(),
          SizedBox(height: 26),
          LeadAnalysisTableView(),
          SizedBox(height: 26),
          Row(
            children: [
              Expanded(
                child: PendingLeadCountTableView(),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TotalLeadTableView(),
              ),
            ],
          )
        ],
      ),
    );
  }
}
