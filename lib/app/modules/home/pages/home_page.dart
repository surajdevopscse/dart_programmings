import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/modules/home/views/video_intro.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/common_text_style/app_style.dart';
import 'package:dart_programing/constants/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/home_page_widget.dart';
import '../../../common_widgets/page_header.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            toolbarHeight: 60,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CommonHeight(
                  height: 40,
                ),
                const Center(child: HomePageWidget()),
                const CommonHeight(
                  height: 20,
                ),
                const Center(
                  child: SizedBox(
                    height: 600,
                    width: 1400,
                    child: VideoApp(),
                  ),
                ),
                const CommonHeight(
                  height: 40,
                ),
                Center(
                  child: BigText(
                    text: 'Why Should You Learn Dart?',
                    style: AppStyle.globalBigTextStyle.copyWith(fontSize: 28),
                  ),
                ),
                const CommonHeight(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: controller.whyShouldLearnList
                      .map(
                        (point) => SmallText(
                          textAlign: TextAlign.start,
                          text: '• $point',
                          style: AppStyle.globalSmallTextStyle.copyWith(
                            fontSize: 20,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const CommonHeight(),
                BigText(
                  text: 'Flutter for Cross-Platform App Development:',
                  style: AppStyle.globalBigTextStyle.copyWith(fontSize: 24),
                ),
                SmallText(
                  textAlign: TextAlign.start,
                  text:
                      '${AppConstant.tabBar} Dart is the primary programming language used in Flutter, a popular open-source framework for building natively compiled applications for mobile, web, and desktop from a single codebase. Learning Dart is essential if you want to develop cross-platform mobile apps efficiently',
                  style: AppStyle.globalSmallTextStyle.copyWith(
                    fontSize: 20,
                    letterSpacing: 0,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
