import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/best_guide_controller.dart';

class BestGuidePage extends GetView<BestGuideController> {
  const BestGuidePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Best Practices Guide'),
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
                        Center(
                          child: BigText(
                            text: 'Flutter Best Practices',
                            style: AppStyle.globalBigTextStyle.copyWith(
                              fontSize: 34,
                              letterSpacing: 1.5,
                              height: 2.2,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                        const CommonHeight(height: 12),
                        Center(
                          child: SmallText(
                            text: 'Professional tips, patterns, and guidelines for building high-quality Flutter applications.',
                            style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        const CommonHeight(height: 32),
                        _GuideCard(
                          icon: Icons.folder_open,
                          title: 'Project Structure',
                          subtitle: 'Organize your Flutter project for scalability',
                          color: Colors.indigo,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_STRUCTURE}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.architecture,
                          title: 'Clean Architecture',
                          subtitle: 'Separate concerns with layers and patterns',
                          color: Colors.deepPurple,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_CLEAN_ARCH}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.speed,
                          title: 'Performance Tips',
                          subtitle: 'Optimize rendering, memory, and startup time',
                          color: Colors.orange,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_PERFORMANCE}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.devices,
                          title: 'Responsive Design',
                          subtitle: 'Build UIs that adapt to any screen size',
                          color: Colors.teal,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_RESPONSIVE}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.code,
                          title: 'Code Style',
                          subtitle: 'Dart formatting and naming conventions',
                          color: Colors.blue,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_CODE_STYLE}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.warning_amber,
                          title: 'Common Mistakes',
                          subtitle: 'What to avoid and what to do instead',
                          color: Colors.red,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_MISTAKES}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.extension,
                          title: 'Useful Packages',
                          subtitle: 'Essential pub.dev packages for Flutter apps',
                          color: Colors.green,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_PACKAGES}'),
                        ),
                        const SizedBox(height: 12),
                        _GuideCard(
                          icon: Icons.bug_report,
                          title: 'Testing Guide',
                          subtitle: 'Unit, widget, and integration testing strategies',
                          color: Colors.pink,
                          onTap: () => AppPages.router.go('${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_TESTING}'),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<BestGuideController>(
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

class _GuideCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _GuideCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 26),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey[400]),
            ],
          ),
        ),
      ),
    );
  }
}
