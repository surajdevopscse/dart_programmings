import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../views/dashboard_analytics.dart';
import '../views/dashboard_demo_scheduled_sub_partners.dart';
import '../views/dashboard_header.dart';
import '../views/dashboard_leads_myteams.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DeshboardHeader(),
            Divider(),
            DashboardAnalytics(),
            DashboardLeadsMyteams(),
            DemoScheduledSubPartners()
          ],
        ),
      ),
    );
  }
}
