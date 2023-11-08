import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/footter.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/modules/home/views/home_page_widget.dart';
import 'package:dart_programing/app/modules/home/views/video_intro.dart';
import 'package:dart_programing/constants/common_text_style/app_style.dart';
import 'package:dart_programing/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';
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
                  expandedHeight: 60, // Adjust the height as needed
                  floating: false,
                  pinned: true,
                  flexibleSpace: PageHeader(
                    headerName: SK.introductionToDart,
                  ),
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
