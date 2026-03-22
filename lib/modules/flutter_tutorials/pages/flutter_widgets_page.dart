import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/common_widgets/topic_complete_btn.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/flutter_widgets_controller.dart';

class FlutterWidgetsPage extends GetView<FlutterWidgetsController> {
  const FlutterWidgetsPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: SK.flutterWidgets),
                  backgroundColor: C.primary50,
                  actions: [
                    BookmarkIconBtn(routePath: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_WIDGETS}', pageTitle: SK.flutterWidgets),
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
                        Center(child: BigText(text: 'Flutter Widgets', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 38, letterSpacing: 1.8, height: 2.5, fontWeight: FontWeight.normal))),
                        const CommonHeight(height: 16),
                        BigText(text: controller.intro, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 18)),
                        const CommonHeight(height: 20),
                        BigText(text: 'Widget Tree', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        SmallText(text: controller.widgetTreeDesc),
                        const CommonHeight(height: 20),
                        BigText(text: 'Everything is a Widget', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.everythingIsWidgetCode),
                        const CommonHeight(height: 20),
                        BigText(text: 'Widget Types', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        SmallText(text: controller.widgetTypesDesc),
                        const CommonHeight(height: 16),
                        BigText(text: 'Common Widgets', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        ...controller.commonWidgets.map((w) => Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Text('• ', style: TextStyle(fontSize: 16)),
                            Expanded(child: SmallText(text: w)),
                          ]),
                        )),
                        const CommonHeight(height: 30),
                        TopicCompleteBtn(routePath: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_WIDGETS}'),
                        const CommonHeight(height: 16),
                        PreviousNextButton(
                          back: () => AppPages.router.go('${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_SETUP}'),
                          next: () => AppPages.router.go('${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATELESS}'),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<FlutterWidgetsController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(bottom: 20, right: 20, child: FloatingActionButton(backgroundColor: AppColors.primary700, onPressed: controller.scrollToTop, child: const Icon(Icons.arrow_upward, color: Colors.white)))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
