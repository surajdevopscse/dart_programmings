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
import 'package:dart_programing/modules/introduction/controllers/basic_dart_controller.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BasicDartPage extends GetView<BasicDartController> {
  const BasicDartPage({super.key});

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
                    headerName: SK.dartBasic,
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
                          text: 'BASIC DART PROGRAM',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 40,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Basic Dart Program : ',
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
                      CodeWidget(code: controller.helloWorld),
                      Center(child: Image.asset(I.basicDart)),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.helloWorldOutput),
                      BigText(
                        text: 'Explained : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.explainationBasic
                            .map(
                              (point) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      SmallText(
                                        textAlign: TextAlign.start,
                                        text:
                                            '${AppConstant.getBullet()} $point',
                                        style: AppStyle.globalSmallTextStyle
                                            .copyWith(
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CommonHeight(
                                    height: 8,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      BigText(
                        text: 'Basic Dart Program For Printing Name : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.printingName),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.printingNameOutput),
                      BigText(
                        text:
                            'Basic Dart Program To Join One Or More Variables : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                          text:
                              'Here \$ using with any variable name is used to join variables. This joining process in dart is called string interpolation',
                          style: AppStyle.globalSmallTextStyle
                              .copyWith(fontSize: 16)),
                      CodeWidget(code: controller.joinVaribaleName),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.joinVaribaleNameOutput),
                      BigText(
                        text: 'Dart Program For Basic Calculation : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'Performing addition, subtraction, multiplication, and division in dart.',
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 16),
                      ),
                      CodeWidget(code: controller.basicCalculation),
                      BigText(
                        text: 'Output : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 18,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CodeWidget(code: controller.basicCalculationOutput),
                      BigText(
                        text: 'Create Full Dart Project : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'It’s nice to work on a single file, but if your project gets bigger, you need to manage configurations, packages, and assets files. So creating a dart project will help you to manage this all.',
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 16),
                      ),
                      CodeWidget(code: controller.createFullProject),
                      SmallText(
                          text:
                              'This will create a simple dart project with some ready-made code.',
                          style: AppStyle.globalSmallTextStyle
                              .copyWith(fontSize: 16)),
                      BigText(
                        text: 'Steps To Create Dart Project : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: controller.stepsToCreateProject
                            .map(
                              (point) => Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                    children: [
                                      SmallText(
                                        textAlign: TextAlign.start,
                                        text:
                                            '${AppConstant.getBullet()} $point',
                                        style: AppStyle.globalSmallTextStyle
                                            .copyWith(
                                          fontSize: 18,
                                          letterSpacing: 0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const CommonHeight(
                                    height: 8,
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                      BigText(
                        text: 'Run Dart Project : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SmallText(
                        text:
                            'First, open the project location on the command/terminal and run the project with this command.',
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 16),
                      ),
                      CodeWidget(code: controller.dartRun),
                      BigText(
                        text: 'Convert Dart Code To Javascript : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: DataTable(
                          columns: [
                            DataColumn(
                                label: Text(
                              'Command',
                              style: AppStyle.globalBigTextStyle.copyWith(
                                fontSize: 20,
                                letterSpacing: 1.8,
                                height: 2.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                            DataColumn(
                                label: Text(
                              'Description',
                              style: AppStyle.globalBigTextStyle.copyWith(
                                fontSize: 20,
                                letterSpacing: 1.8,
                                height: 2.5,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                          ],
                          rows:
                              controller.convertDartToJavaScript.map((command) {
                            return DataRow(
                              cells: [
                                DataCell(Text(
                                  command['Command'] ?? '',
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 16,
                                    letterSpacing: 1.8,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )),
                                DataCell(Text(
                                  command['Description'] ?? '',
                                  style: AppStyle.globalSmallTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                )),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      const CommonHeight(),
                      BigText(
                        text: AppConstant.summaryTitle,
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text:
                            'The provided Dart code snippets cover the basics of Dart programming, from a simple "Hello World" program to more complex examples. Here\'s a summary of the key concepts like Hello World Program, Printing Name, Joining Variables (String Interpolation), Basic Calculation, Create Full Dart Project, Run Dart Project and Convert Dart Code To Javascript.',
                        style: AppStyle.globalSmallTextStyle
                            .copyWith(fontSize: 16),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      PreviousNextButton(
                        back: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.installDart.title);
                        },
                        next: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.variables.title);
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
