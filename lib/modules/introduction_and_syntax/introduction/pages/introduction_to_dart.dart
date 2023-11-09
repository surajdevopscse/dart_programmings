import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/footter.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/modules/home/views/home_page_widget.dart';
import 'package:dart_programing/modules/home/views/video_intro.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../utils/constants/colors.dart';
import '../controllers/introduction_controller.dart';

class IntroductionToDart extends GetView<IntroductionController> {
  const IntroductionToDart({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 8.0),
            child: CustomScrollView(
              controller: controller.scrollController,
              slivers: [
                SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  flexibleSpace: PageHeader(
                    headerName: SK.introductionToDart,
                  ),
                  backgroundColor: AppColors.baseWhite,
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
                          text: AppConstant.dartWhy,
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 28),
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      const CommonHeight(
                        height: 30,
                      ),
                      BigText(
                        text: AppConstant.summaryTitle,
                        style:
                            AppStyle.globalBigTextStyle.copyWith(fontSize: 26),
                      ),
                      BigText(
                        text: AppConstant.summary,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 20),
                      ),
                      const CommonHeight(
                        height: 30,
                      ),
                      const AppFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  controller.scrollToTop();
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.yellow,
                  child: Icon(
                    Icons.arrow_upward,
                    color: AppColors.primary700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
