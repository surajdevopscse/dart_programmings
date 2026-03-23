import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/common_widgets/scroll_to_top_fab.dart';
import 'package:dart_programing/app/common_widgets/topic_complete_btn.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/modules/introduction/controllers/datetime_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DateTimePage extends GetView<DateTimeController> {
  const DateTimePage({super.key});

  static const String _routePath = DateTimeController.routePath;
  static const String _pageTitle = 'DateTime in Dart';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
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
                  flexibleSpace:
                      const PageHeader(headerName: 'DateTime in Dart'),
                  backgroundColor: C.primary50,
                  actions: [
                    BookmarkIconBtn(
                      routePath: _routePath,
                      pageTitle: _pageTitle,
                    ),
                  ],
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: ScreenSpecific(
                    desktop: EdgeInsets.only(left: 54.0.w, right: 54.0.w),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 900),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CommonHeight(height: 20),
                        Row(
                          children: [
                            Expanded(
                              child: BigText(
                                text: _pageTitle,
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(
                              routePath: _routePath,
                              pageTitle: _pageTitle,
                            ),
                          ],
                        ),
                        const CommonHeight(height: 16),
                        SmallText(text: controller.intro),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Creating DateTime Objects',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.creatingCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'DateTime Properties',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.propertiesCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Arithmetic with Duration',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.arithmeticCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Comparing DateTimes',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.comparisonCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Formatting (intl package)',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.formattingCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Tips',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        ...controller.tips.map((tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('• ',
                                      style: TextStyle(fontSize: 16)),
                                  Expanded(child: SmallText(text: tip)),
                                ],
                              ),
                            )),
                        const CommonHeight(height: 30),
                        TopicCompleteBtn(routePath: _routePath),
                        const CommonHeight(height: 16),
                        PreviousNextButton(
                          back: () => AppPages.router.goNamed(
                              SideNavBarChildEnum.finalVSConst.title),
                          next: () => AppPages.router.goNamed(
                              SideNavBarChildEnum.controllFLow.title),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<DateTimeController>(
            builder: (_) => ScrollToTopFab(
              show: controller.showBackToTopButton,
              onPressed: controller.scrollToTop,
            ),
          ),
        ],
      ),
    );
  }
}
