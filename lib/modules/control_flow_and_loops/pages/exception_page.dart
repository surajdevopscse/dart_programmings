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
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/exception_controller.dart';

class ExceptionPage extends GetView<ExceptionController> {
  const ExceptionPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: SK.exception),
                  backgroundColor: C.primary50,
                ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: ScreenSpecific(
                    desktop: EdgeInsets.only(left: 54.0.w, right: 54.0.w),
                    fallback: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CommonHeight(height: 20),
                      Center(
                        child: BigText(
                          text: controller.title,
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 40,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.intro,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.tryCatchTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      BigText(
                        text: controller.tryCatchDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.tryCatchCode),
                      const CommonHeight(height: 8),
                      CodeWidget(
                          code: controller.tryCatchOutput),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.onKeywordTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      BigText(
                        text: controller.onKeywordDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.onKeywordCode),
                      const CommonHeight(height: 8),
                      CodeWidget(
                          code: controller.onKeywordOutput),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.finallyTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      BigText(
                        text: controller.finallyDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.finallyCode),
                      const CommonHeight(height: 8),
                      CodeWidget(
                          code: controller.finallyOutput),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.customExceptionTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      BigText(
                        text: controller.customExceptionDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.customExceptionCode),
                      const CommonHeight(height: 8),
                      CodeWidget(
                          code: controller.customExceptionOutput),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Tips',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 8),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: controller.tips
                            .map((tip) => SmallText(
                                  text: '${AppConstant.getBullet()} $tip',
                                  style: AppStyle.globalSmallTextStyle
                                      .copyWith(fontSize: 16),
                                  textAlign: TextAlign.start,
                                ))
                            .toList(),
                      ),
                      const CommonHeight(height: 30),
                      PreviousNextButton(
                        back: () => AppPages.router
                            .go('${AppPath.CONDITIONS}/${AppPath.BREAK}'),
                        next: () => AppPages.router.go(AppPath.FUNCTIONS),
                        isEnableBack: true,
                        isEnableNext: false,
                      ),
                      const CommonHeight(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<ExceptionController>(
            builder: (_) {
              return controller.showBackToTopButton
                  ? Positioned(
                      bottom: 20,
                      right: 20,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.primary700,
                        onPressed: controller.scrollToTop,
                        child: const Icon(Icons.arrow_upward,
                            color: Colors.white),
                      ),
                    )
                  : const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
