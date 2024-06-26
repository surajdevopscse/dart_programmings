import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/modules/introduction/controllers/install_dart_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';

class InstallDartPage extends GetView<InstallDartController> {
  const InstallDartPage({super.key});

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
                    headerName: SK.installDart,
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
                          text: 'INSTALL DART',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 40,
                            letterSpacing: 1.8,
                            height: 2.5,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                      BigText(
                        text: 'Dart Installation : ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.dartInstall,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Center(
                        child: SvgPicture.asset(I.install),
                      ),
                      BigText(
                        text: 'Dart Window Installation: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var step
                              in controller.dartInstallationStepsWindow)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step['title'],
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 20,
                                    letterSpacing: 1.8,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var substep in step['substeps'])
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      '• $substep',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                      const CommonHeight(
                        height: 40,
                      ),
                      BigText(
                        text: 'Dart MacOS Installation: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var step in controller.installationStepsMac)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step['title'],
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 20,
                                    letterSpacing: 1.8,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var substep in step['substeps'])
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      '• $substep',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                      const CommonHeight(
                        height: 40,
                      ),
                      BigText(
                        text: 'Dart Linux Installation: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          for (var step
                              in controller.dartInstallationStepsLinux)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  step['title'],
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 20,
                                    letterSpacing: 1.8,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                for (var substep in step['substeps'])
                                  Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: Text(
                                      '• $substep',
                                      style: AppStyle.globalSmallTextStyle
                                          .copyWith(
                                        fontSize: 20,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                        ],
                      ),
                      BigText(
                        text: 'Some Useful Commands in Dart: ',
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
                          rows: controller.dartHelpfullCommands.map((command) {
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
                      const CommonHeight(
                        height: 40,
                      ),
                      BigText(
                        text: 'Check Dart Installation: ',
                        style: AppStyle.globalBigTextStyle.copyWith(
                          fontSize: 24,
                          letterSpacing: 1.8,
                          height: 2.5,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      BigText(
                        text: controller.dartCheckVersion,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 20,
                      ),
                      Row(
                        children: [
                          BigText(
                            text: 'Run Dart On Web: ',
                            style: AppStyle.globalBigTextStyle.copyWith(
                              fontSize: 24,
                              letterSpacing: 1.8,
                              height: 2.5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => controller.launchDartPad(),
                            child: Row(
                              children: [
                                Text(
                                  'DartPad',
                                  style: AppStyle.globalBigTextStyle.copyWith(
                                    fontSize: 24,
                                    color: AppColors.stepper,
                                    letterSpacing: 1.8,
                                    height: 2.5,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Icon(
                                  Icons.open_in_browser,
                                  color: AppColors.stepper,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      BigText(
                        text: controller.dartPadWebTool,
                        style: AppStyle.globalSmallTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      const CommonHeight(
                        height: 10,
                      ),
                      PreviousNextButton(
                        back: () {
                          AppPages.router.goNamed(
                              SideNavBarParentEnum.introductionAndSyntax.title);
                        },
                        next: () {
                          AppPages.router
                              .goNamed(SideNavBarChildEnum.dartBasic.title);
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
