import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/modules/dashboard/views/video_intro.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../views/dashboard_home_page.dart';
import '../views/dashboard_header.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 60, // Adjust the height as needed
            floating: false,
            pinned: true,
            flexibleSpace: PageHeader(),
            backgroundColor: AppColors.baseWhite, // Your header widget
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CommonHeight(
                  height: 40,
                ),
                DashboardHomePage(),
                CommonHeight(
                  height: 40,
                ),
                SizedBox(
                  height: 500,
                  width: 1000,
                  child: VideoApp(),
                ),
                CommonHeight(
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
