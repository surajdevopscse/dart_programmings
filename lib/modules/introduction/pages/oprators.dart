import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:dart_programing/modules/introduction/controllers/oprators_controller.dart';

class OperatorsPage extends GetView<OpratorsController> {
  const OperatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
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
                    headerName: controller.title,
                  ),
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
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 10),
                      SmallText(
                        text: controller.beforeLearning,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      SmallText(
                        text: controller.operands,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      SmallText(
                        text: controller.operatorText,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.typesOfOperators,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(height: 10),
                      SmallText(
                        text: controller.typesList,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.arithmeticTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.arithmeticDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.arithmeticExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.assignmentTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.assignmentDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.assignmentExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.relationalTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.relationalDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.relationalExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.logicalTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.logicalDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.logicalExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.typeTestTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.typeTestDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.typeTestExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.bitwiseTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.bitwiseDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.bitwiseExample,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.conditionalTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.conditionalDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 10),
                      CodeWidget(
                        code: controller.conditionalExample,
                      ),
                      const CommonHeight(height: 30),
                      BigText(
                        text: controller.summaryTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      SmallText(
                        text: controller.summaryDesc,
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 18),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 30),
                      PreviousNextButton(
                        back: () => Get.toNamed(AppPath.COMMENTS_IN_DART),
                        next: () => Get.toNamed(AppPath.USER_INPUT_IN_DART),
                        isEnableBack: true,
                        isEnableNext: true,
                      ),
                      const CommonHeight(height: 30),
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
