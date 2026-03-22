import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/responsive_controller.dart';

class ResponsivePage extends GetView<ResponsiveController> {
  const ResponsivePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Responsive Design'),
                  backgroundColor: C.primary50,
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
                                text: 'Responsive Design',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/responsive-design', pageTitle: 'Responsive Design'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'Screen Size Breakpoints',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Define breakpoints for mobile, tablet, and desktop. A common approach: mobile < 600px, tablet 600-1200px, desktop > 1200px.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""class ScreenBreakpoints {
  static bool isMobile(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width < 600;
  static bool isTablet(BuildContext ctx) {
    final w = MediaQuery.of(ctx).size.width;
    return w >= 600 && w < 1200;
  }
  static bool isDesktop(BuildContext ctx) =>
      MediaQuery.of(ctx).size.width >= 1200;
}

// Usage
Widget build(BuildContext context) {
  if (ScreenBreakpoints.isDesktop(context)) {
    return const DesktopLayout();
  } else if (ScreenBreakpoints.isTablet(context)) {
    return const TabletLayout();
  }
  return const MobileLayout();
}"""),

                        const CommonHeight(height: 20),
                        Text(
                          'flutter_screenutil for Scaling',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'flutter_screenutil scales sizes based on a design reference size. Use .w for width-based, .h for height-based, .sp for font sizes.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Initialize in MaterialApp
ScreenUtilInit(
  designSize: const Size(390, 844), // iPhone 14 Pro
  minTextAdapt: true,
  child: MaterialApp(...),
)

// Usage in widgets
Container(
  width: 200.w,    // scales with screen width
  height: 100.h,   // scales with screen height
  child: Text(
    "Hello",
    style: TextStyle(fontSize: 16.sp), // scales font
  ),
)

// Padding
Padding(
  padding: EdgeInsets.symmetric(
    horizontal: 24.w,
    vertical: 16.h,
  ),
)"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Adaptive Layouts',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use LayoutBuilder and MediaQuery to build adaptive layouts. Wrap with ConstrainedBox for max widths on large screens.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""LayoutBuilder(
  builder: (context, constraints) {
    if (constraints.maxWidth > 900) {
      return Row(
        children: [
          SizedBox(width: 280, child: SidebarWidget()),
          Expanded(child: ContentWidget()),
        ],
      );
    }
    return ContentWidget(); // mobile: no sidebar
  },
)

// Constrain width on wide screens
Center(
  child: ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 900),
    child: ContentWidget(),
  ),
)"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<ResponsiveController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(
                    bottom: 20,
                    right: 20,
                    child: FloatingActionButton(
                      backgroundColor: AppColors.primary700,
                      onPressed: controller.scrollToTop,
                      child: const Icon(Icons.arrow_upward, color: Colors.white),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}
