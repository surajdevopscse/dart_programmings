import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/leads_controller.dart';
import '../views/all_leads.dart';
import '../views/leads_dashboard.dart';
import '../views/leads_header.dart';

typedef _Screens = List<Widget>;

class LeadsPage extends GetView<LeadsController> {
  const LeadsPage({Key? key}) : super(key: key);

  static const _Screens _screens = [
    LeadsDashboard(),
    AllLeads(),
    Center(child: Text('HB Accounting')),
    Center(child: Text('HB Neo')),
    Center(child: Text('HB Super')),
    Center(child: Text('HB GST')),
    Center(child: Text('HB POS')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: EdgeInsets.symmetric(horizontal: 40, vertical: 48),
        padding: const EdgeInsets.only(
            top: kTextTabBarHeight,
            // bottom: kBottomNavigationBarHeight,
            left: 16,
            right: 16),
        child: GetBuilder<LeadsController>(
          init: controller,
          builder: (_) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const LeadsHeader(),
              Expanded(
                child: IndexedStack(
                  index: controller.selectedTab.value.index,
                  children: _screens,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
