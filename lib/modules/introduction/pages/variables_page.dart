import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/modules/introduction/controllers/variables_coontroller.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VariablesDart extends GetView<VaribalesController> {
  const VariablesDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                toolbarHeight: 60,
                automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 60,
                floating: false,
                pinned: true,
                flexibleSpace: PageHeader(
                  headerName: SK.variables,
                ),
                backgroundColor: C.primary50,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: BigText(
                          text: 'VARIABLES IN DART',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 40,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Dive into Dart — Variables : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.varibales,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.variableExample),
                      BigText(
                        text: 'Variable Types : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      SmallText(
                        textAlign: TextAlign.start,
                        text:
                            'They are called data types. We will learn more about data types later in this dart tutorial',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 0,
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.typesOfVariables
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
                                  ],
                                ))
                            .toList(),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      BigText(
                        text: 'Syntax : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: 'This is syntax for creating a variable in dart',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CodeWidget(code: 'type variableName = value;'),
                      const CommonHeight(),
                      BigText(
                        text: 'Using Variables In Dart : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'In this example, you will learn how to declare variables and print their values',
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.variableUseExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.varibaleUseExampleOutput),
                      const CodeWidget(
                        code:
                            'Note: Always use the descriptive variable name. Don’t use a variable name like a, b, c because this will make your code more complex.',
                      ),
                      BigText(
                        text: 'Rules For Creating Variables In Dart : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.rulesForVariblesCreating
                            .map((e) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    SmallText(
                                      textAlign: TextAlign.start,
                                      text: '${AppConstant.getBullet()} $e',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 18,
                                        letterSpacing: 0,
                                      ),
                                    ),
                                  ],
                                ))
                            .toList(),
                      ),
                      BigText(
                        text: 'Dart Constant : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.constants,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      CodeWidget(code: controller.constantsExample),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const CodeWidget(
                        code: 'Constant variables can not be assigned a value.',
                      ),
                      BigText(
                        text: 'Naming Convention For Variables In Dart : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.nameingConvention,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                       BigText(
                        text: 'Naming Convention Example : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       CodeWidget(
                        code: controller.nameingConvetionExample,
                      ),
                      const CommonHeight(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
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
