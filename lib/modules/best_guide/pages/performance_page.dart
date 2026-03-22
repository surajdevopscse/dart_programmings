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
import '../controllers/performance_controller.dart';

class PerformancePage extends GetView<PerformanceController> {
  const PerformancePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Performance Tips'),
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
                                text: 'Performance Tips',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/performance-tips', pageTitle: 'Performance Tips'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'Avoid Rebuilding Widgets Unnecessarily',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use const constructors, split large build methods into smaller widgets, and use GetX Obx/GetBuilder wisely to scope rebuilds.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// BAD: Entire tree rebuilds
class MyPage extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
      children: [
        ExpensiveWidget(), // rebuilds even if unchanged!
        Text(controller.count.toString()),
      ],
    ));
  }
}

// GOOD: Only Text rebuilds
class MyPage extends GetView<MyController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ExpensiveWidget(), // const = no rebuild
        Obx(() => Text(controller.count.toString())),
      ],
    );
  }
}"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Use ListView.builder for Long Lists',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'ListView.builder creates items lazily (only visible items). ListView creates all items at once. For large data sets, always use .builder or .separated.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// BAD: All 10000 items built immediately
ListView(
  children: items.map((item) => ItemTile(item: item)).toList(),
)

// GOOD: Only visible items built
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => ItemTile(item: items[index]),
)

// BETTER: With separators
ListView.separated(
  itemCount: items.length,
  separatorBuilder: (_, __) => const Divider(),
  itemBuilder: (context, index) => ItemTile(item: items[index]),
)"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Image Optimization',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Cache images with cached_network_image. Use appropriate resolutions. Compress images. Avoid large images in memory.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""dependencies:
  cached_network_image: ^3.3.0

// Usage
CachedNetworkImage(
  imageUrl: "https://example.com/photo.jpg",
  placeholder: (context, url) => const CircularProgressIndicator(),
  errorWidget: (context, url, error) => const Icon(Icons.error),
  width: 200,
  height: 200,
  fit: BoxFit.cover,
  memCacheWidth: 400, // limit memory cache resolution
)"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<PerformanceController>(
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
