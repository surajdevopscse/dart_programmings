import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/modules/introduction/controllers/user_input_controller.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NoteWidget extends StatelessWidget {
  final String message;
  final Color? color;
  final Color? iconColor;
  const NoteWidget(
      {super.key, required this.message, this.color, this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color ?? Colors.yellow[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: iconColor ?? Colors.orange),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: TextStyle(
                fontSize: 16,
                color: iconColor ?? Colors.orange[900],
              ),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }
}

class UserInputPage extends GetView<UserInputController> {
  const UserInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              if (!AS.deviceScreenType.isMobile)
                // ignore: prefer_const_constructors
                SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  flexibleSpace: const PageHeader(
                    headerName: 'User Input in Dart',
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
                      const CommonHeight(height: 10),
                      BigText(
                        text: controller.whyInputMatters,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.whyInputMattersDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 10),
                      NoteWidget(message: controller.infoNote),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.howToTakeInput,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.howToTakeInputDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.exampleStringInput,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.codeStringInput,
                      ),
                      BigText(
                        text: 'Output:',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.outputStringInput,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Explanation:',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text: controller.explanationStringInput,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.readingNumbers,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text: controller.readingNumbersDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      CodeWidget(
                        code: controller.codeNumberInput,
                      ),
                      BigText(
                        text: 'Output:',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.outputNumberInput,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.tipsTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.exampleAddNumbers,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.codeAddNumbers,
                      ),
                      BigText(
                        text: 'Output:',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(
                        code: controller.outputAddNumbers,
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: controller.summaryTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text: controller.summaryDesc,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const CommonHeight(height: 30),
                      PreviousNextButton(
                        back: () => AppPages.router.go(AppPath.OPRATOR_IN_DART),
                        next: () =>
                            AppPages.router.go(AppPath.METADATA_IN_DART),
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
