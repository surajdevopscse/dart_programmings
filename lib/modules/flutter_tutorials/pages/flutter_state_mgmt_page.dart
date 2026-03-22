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
import '../controllers/flutter_state_mgmt_controller.dart';

class FlutterStateMgmtPage extends GetView<FlutterStateMgmtController> {
  const FlutterStateMgmtPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: SK.flutterStateMgmt),
                  backgroundColor: C.primary50,
                  actions: [
                    BookmarkIconBtn(routePath: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATE_MGMT}', pageTitle: SK.flutterStateMgmt),
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
                        Center(child: BigText(text: 'State Management', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 38, letterSpacing: 1.8, height: 2.5, fontWeight: FontWeight.normal))),
                        const CommonHeight(height: 16),
                        BigText(text: controller.intro, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 18)),
                        const CommonHeight(height: 20),
                        BigText(text: 'setState Example', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.setStateCode),
                        const CommonHeight(height: 20),
                        BigText(text: 'When to Use', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 8),
                        SmallText(text: controller.whenToUse),
                        const CommonHeight(height: 20),
                        const CommonHeight(height: 30),
                        TopicCompleteBtn(routePath: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATE_MGMT}'),
                        const CommonHeight(height: 16),
                        PreviousNextButton(
                          back: () => AppPages.router.go('${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_GOROUTER}'),
                          next: () => AppPages.router.go('${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_PROVIDER}'),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<FlutterStateMgmtController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(bottom: 20, right: 20, child: FloatingActionButton(backgroundColor: AppColors.primary700, onPressed: controller.scrollToTop, child: const Icon(Icons.arrow_upward, color: Colors.white)))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
