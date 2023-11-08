import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/footter.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/modules/home/views/video_intro.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../views/home_page_widget.dart';
import '../../../app/common_widgets/page_header.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

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
                const SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
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
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 28),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.featureList
                            .map(
                              (point) => Wrap(
                                children: [
                                  BigText(
                                    text: point[0],
                                    style: AppStyle.globalBigTextStyle
                                        .copyWith(fontSize: 24),
                                  ),
                                  SmallText(
                                    textAlign: TextAlign.start,
                                    text: point[1],
                                    style:
                                        AppStyle.globalSmallTextStyle.copyWith(
                                      fontSize: 20,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  const CommonHeight(),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 30,
                      ),
                      BigText(
                        text: 'Summary',
                        style:
                            AppStyle.globalBigTextStyle.copyWith(fontSize: 26),
                      ),
                      BigText(
                        text:
                            'In summary, learning Dart can be a strategic decision if you\'re interested in mobile app development, web development, or concurrent programming. It\'s a versatile language that offers good performance, developer-friendly features, and a growing ecosystem. Additionally, Dart\'s strong ties to Flutter make it an excellent choice for cross-platform mobile app development',
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
                    color: AppColors.baseWhite,
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
