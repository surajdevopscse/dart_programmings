import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/modules/home/views/video_intro.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/dashboard_controller.dart';
import '../views/home_page_widget.dart';
import '../../../common_widgets/page_header.dart';

class HomePage extends GetView<DashboardController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: true,
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
                HomePageWidget(),
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
