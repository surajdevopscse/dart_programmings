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
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/interview_home_controller.dart';

class InterviewHomePage extends GetView<InterviewHomeController> {
  const InterviewHomePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: SK.interviewHome),
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
                        Center(child: BigText(text: 'Interview Preparation', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 38, letterSpacing: 1.8, height: 2.5, fontWeight: FontWeight.normal))),
                        const CommonHeight(height: 16),
                        BigText(text: controller.intro, style: AppStyle.globalSmallTextStyle.copyWith(fontSize: 18)),
                        const CommonHeight(height: 24),
                        BigText(text: 'What\'s Included', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 12),
                        ...controller.features.map((f) => Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            const Icon(Icons.check_circle, color: Colors.green, size: 20),
                            const SizedBox(width: 8),
                            Expanded(child: SmallText(text: f)),
                          ]),
                        )),
                        const CommonHeight(height: 32),
                        BigText(text: 'Categories', style: AppStyle.globalBigTextStyle.copyWith(fontSize: 22)),
                        const CommonHeight(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: _CategoryCard(
                                icon: Icons.code,
                                title: 'Dart Q&A',
                                subtitle: '30+ Questions',
                                color: Colors.blue,
                                onTap: () => AppPages.router.go('${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_DART_QA}'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _CategoryCard(
                                icon: Icons.flutter_dash,
                                title: 'Flutter Q&A',
                                subtitle: '30+ Questions',
                                color: Colors.teal,
                                onTap: () => AppPages.router.go('${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_FLUTTER_QA}'),
                              ),
                            ),
                          ],
                        ),
                        const CommonHeight(height: 12),
                        _CategoryCard(
                          icon: Icons.record_voice_over,
                          title: 'Mock Interview',
                          subtitle: 'Practice one question at a time',
                          color: Colors.purple,
                          onTap: () => AppPages.router.go('${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_MOCK}'),
                        ),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<InterviewHomeController>(
            builder: (_) => controller.showBackToTopButton
                ? Positioned(bottom: 20, right: 20, child: FloatingActionButton(backgroundColor: AppColors.primary700, onPressed: controller.scrollToTop, child: const Icon(Icons.arrow_upward, color: Colors.white)))
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _CategoryCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _CategoryCard({
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: color.withOpacity(0.15), child: Icon(icon, color: color)),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
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
