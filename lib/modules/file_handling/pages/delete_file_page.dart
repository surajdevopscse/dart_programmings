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
import '../controllers/delete_file_controller.dart';

class DeleteFilePage extends GetView<DeleteFileController> {
  const DeleteFilePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: SK.deleteFile),
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
                      Center(child: BigText(text: controller.title, style: AppStyle.globalBigTextStyle.copyWith(fontSize: 40, letterSpacing: 1.8, height: 2.5, fontWeight: FontWeight.normal))),
                      const CommonHeight(height: 20),
                      BigText(text: controller.intro, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 18, fontWeight: FontWeight.normal)),
                      const CommonHeight(height: 20),
                      BigText(text: controller.deleteTitle, style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                      const CommonHeight(height: 8),
                      BigText(text: controller.deleteDesc, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.deleteCode),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.deleteOutput),
                      const CommonHeight(height: 20),
                      BigText(text: controller.safeDeleteTitle, style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                      const CommonHeight(height: 8),
                      BigText(text: controller.safeDeleteDesc, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.safeDeleteCode),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.safeDeleteOutput),
                      const CommonHeight(height: 20),
                      BigText(text: controller.asyncDeleteTitle, style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                      const CommonHeight(height: 8),
                      BigText(text: controller.asyncDeleteDesc, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 16, fontWeight: FontWeight.normal)),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.asyncDeleteCode),
                      const CommonHeight(height: 8),
                      CodeWidget(code: controller.asyncDeleteOutput),
                      const CommonHeight(height: 20),
                      BigText(text: 'Tips', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22, fontWeight: FontWeight.bold)),
                      const CommonHeight(height: 8),
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: controller.tips.map((tip) => SmallText(text: '${AppConstant.getBullet()} $tip', style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 16), textAlign: TextAlign.start)).toList()),
                      const CommonHeight(height: 30),
                      PreviousNextButton(
                        back: () => AppPages.router.go(AppPath.WRITEFILE),
                        next: () => AppPages.router.go(AppPath.OOPSINDART),
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
          GetBuilder<DeleteFileController>(builder: (_) => controller.showBackToTopButton ? Positioned(bottom: 20, right: 20, child: FloatingActionButton(backgroundColor: AppColors.primary700, onPressed: controller.scrollToTop, child: const Icon(Icons.arrow_upward, color: Colors.white))) : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
