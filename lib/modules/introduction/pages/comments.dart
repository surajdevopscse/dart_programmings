import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/modules/introduction/controllers/comments_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import 'package:go_router/go_router.dart';

class CommentsPage extends GetView<CommentsController> {
  const CommentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
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
                    headerName: SK.comments,
                  ),
                  backgroundColor: AppColors.primary50,
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
                          text: 'COMMENTS IN DART',
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
                        text: 'What are Comments?',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          height: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Comments are the set of statements that are ignored by the Dart compiler during program execution. They are used to explain the code so that you or other people can understand it easily.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Types of Comments in Dart:',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'Dart supports three types of comments:',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(height: 20),
                     const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:  [
                          SmallText(
                            text: '\u2022 Single-line comment',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SmallText(
                            text: '\u2022 Multi-line comment',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                          SmallText(
                            text: '\u2022 Documentation comment',
                            style: TextStyle(fontSize: 18),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Single-line Comment',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'A single-line comment starts with // and continues to the end of the line.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const CodeWidget(
                        code: '// This is a single-line comment\nvoid main() {\n  print(\'Hello World\'); // This prints Hello World\n}',
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Multi-line Comment',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'A multi-line comment starts with /* and ends with */. It can span multiple lines.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const CodeWidget(
                        code: '/*\n This is a multi-line comment\n It can span multiple lines\n*/\nvoid main() {\n  print(\'Hello World\');\n}',
                      ),
                      const CommonHeight(height: 20),
                      BigText(
                        text: 'Documentation Comment',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'Documentation comments are used to generate documentation for your code. They start with /// or /** */ and are usually placed before classes, methods, or functions.',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const CodeWidget(
                        code: '/// This is a documentation comment\n/// It describes the main function\nvoid main() {\n  print(\'Hello World\');\n}',
                      ),
                      const CommonHeight(height: 30),
                      PreviousNextButton(
                        back: () => context.goNamed(SideNavBarChildEnum.dataTypes.title),
                        next: () => context.goNamed(SideNavBarChildEnum.oprators.title),
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
