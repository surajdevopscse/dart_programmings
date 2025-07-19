import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';

import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/utils/app_constants.dart';

import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../../../utils/constants/colors.dart';
import '../controllers/introduction_controller.dart';

class IntroductionToDartPage extends GetView<IntroductionController> {
  const IntroductionToDartPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              if (!AS.deviceScreenType.isMobile)
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
                  backgroundColor: C.primary50,
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: ScreenSpecific(
                    desktop: EdgeInsets.only(
                      left: 54.0.w,
                      right: 54.0.w,
                    ),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BigText(
                          text: 'INTRODUCTION TO DART',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 44,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Dart : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.dart,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      BigText(
                        text:
                            'If you know languages like C, Java, C#, Javascript, etc. Dart will be easy for you. This tutorial covers Dart from basic to advance.\nThe concept you will learn here will give you a solid understanding of Dart and improve your coding career.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(),
                      Center(
                        child: SvgPicture.asset(I.diffrence),
                      ),
                      BigText(
                        text: 'Key features of Dart include:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.keyFeatures
                            .map(
                              (point) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: point[0],
                                    style: AppStyle.globalBigTextStyle
                                        .copyWith(fontSize: 24),
                                  ),
                                  Wrap(
                                    children: [
                                      SmallText(
                                        textAlign: TextAlign.start,
                                        text: point[1],
                                        style: AppStyle.globalSmallTextStyle
                                            .copyWith(
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CommonHeight(),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      BigText(
                        text: 'Difference Between Dart & Flutter',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 28,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.diffrence
                            .map((e) => Column(
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: AppStyle.globalSmallTextStyle
                                            .copyWith(
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text:
                                            '${AppConstant.getBullet()} ${e[0]}',
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: e[1],
                                            style: AppStyle.globalSmallTextStyle
                                                .copyWith(
                                              fontSize: 20,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const CommonHeight(
                                      height: 20,
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      BigText(
                        text: 'Basic Programming Terms',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 28,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(),
                      BigText(
                        text:
                            '• Here are some basic programming terms that are commonly used in the world of software development, Important words that you often hear while learning programming languages.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.programingTerms
                            .map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        style: AppStyle.globalBigTextStyle
                                            .copyWith(
                                          fontSize: 20,
                                          letterSpacing: 0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        text: e[0],
                                        children: <InlineSpan>[
                                          TextSpan(
                                            text: e[1],
                                            style: AppStyle.globalSmallTextStyle
                                                .copyWith(
                                              fontSize: 18,
                                              letterSpacing: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (e[0] == 'Expressions: ')
                                      CodeWidget(code: controller.expresion),
                                    const CommonHeight(
                                      height: 10,
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      BigText(
                        text: 'Key Points ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 28,
                          letterSpacing: 1.8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.keyPoints
                            .map((point) => Column(
                                  children: [
                                    SmallText(
                                      textAlign: TextAlign.start,
                                      text: '• $point',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 20,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                    const CommonHeight(
                                      height: 10,
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      PreviousNextButton(
                        back: () {
                          AppPages.router
                              .goNamed(SideNavBarParentEnum.home.title);
                        },
                        next: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.installDart.title);
                        },
                      ),
                      const CommonHeight(
                        height: 70,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: AS.deviceScreenType.isDesktop ? 40.h : 60.h,
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
