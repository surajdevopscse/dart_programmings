import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/previous_next_btn.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/common_widgets/scroll_to_top_fab.dart';
import 'package:dart_programing/app/common_widgets/topic_complete_btn.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/modules/introduction/controllers/libraries_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LibrariesPage extends GetView<LibrariesController> {
  const LibrariesPage({super.key});

  static const String _routePath = LibrariesController.routePath;
  static const String _pageTitle = 'Libraries & Imports';

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
                  flexibleSpace: const PageHeader(
                      headerName: 'Libraries & Imports'),
                  backgroundColor: C.primary50,
                  actions: [
                    BookmarkIconBtn(
                      routePath: _routePath,
                      pageTitle: _pageTitle,
                    ),
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
                        Row(
                          children: [
                            Expanded(
                              child: BigText(
                                text: _pageTitle,
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(
                              routePath: _routePath,
                              pageTitle: _pageTitle,
                            ),
                          ],
                        ),
                        const CommonHeight(height: 16),
                        SmallText(text: controller.intro),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Import Types',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: controller.importTypesDesc),
                        const CommonHeight(height: 12),
                        ...controller.importTypes.map((t) => Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: 160,
                                        child: Text(
                                          t['scheme']!,
                                          style: const TextStyle(
                                            fontFamily: 'monospace',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          child: SmallText(text: t['desc']!)),
                                    ],
                                  ),
                                ),
                                const Divider(height: 1),
                              ],
                            )),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Basic Import',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.basicImportCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: "Import Aliases (as)",
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.aliasCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'show and hide',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.showHideCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Exporting from Libraries',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.exportCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'part / part of (Legacy)',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        CodeWidget(code: controller.partCode),
                        const CommonHeight(height: 24),
                        BigText(
                          text: 'Tips',
                          style: AppStyle.globalBigTextStyle
                              .copyWith(fontSize: 22),
                        ),
                        const CommonHeight(height: 8),
                        ...controller.tips.map((tip) => Padding(
                              padding: const EdgeInsets.only(bottom: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('• ',
                                      style: TextStyle(fontSize: 16)),
                                  Expanded(child: SmallText(text: tip)),
                                ],
                              ),
                            )),
                        const CommonHeight(height: 30),
                        TopicCompleteBtn(routePath: _routePath),
                        const CommonHeight(height: 16),
                        PreviousNextButton(
                          back: () => AppPages.router.goNamed(
                              SideNavBarChildEnum.metaData.title),
                          next: () => AppPages.router.goNamed(
                              SideNavBarChildEnum.string.title),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<LibrariesController>(
            builder: (_) => ScrollToTopFab(
              show: controller.showBackToTopButton,
              onPressed: controller.scrollToTop,
            ),
          ),
        ],
      ),
    );
  }
}
