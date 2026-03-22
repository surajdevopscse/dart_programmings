import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/progress_controller.dart';

class ProgressPage extends GetView<ProgressController> {
  const ProgressPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'My Progress'),
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
                    child: GetBuilder<ProgressController>(
                      builder: (ctrl) => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonHeight(height: 20),
                          BigText(
                            text: 'My Progress',
                            style: AppStyle.globalBigTextStyle.copyWith(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const CommonHeight(height: 8),
                          SmallText(
                            text: 'Track your learning journey across all topics.',
                          ),
                          const CommonHeight(height: 24),
                          // Overall progress card
                          Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [AppColors.primary700, AppColors.primary700.withOpacity(0.7)],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Overall Progress',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    '${(ctrl.overallProgress * 100).toStringAsFixed(0)}%',
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 12),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: LinearProgressIndicator(
                                      value: ctrl.overallProgress,
                                      minHeight: 8,
                                      backgroundColor: Colors.white.withOpacity(0.3),
                                      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const CommonHeight(height: 24),
                          const Text(
                            'By Section',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const CommonHeight(height: 12),
                          ...ctrl.sections.entries.map((entry) {
                            final sectionName = entry.key;
                            final routes = entry.value;
                            final progress = ctrl.sectionProgress(sectionName);
                            final completed = ctrl.completedCount(sectionName);
                            final total = routes.length;
                            return _SectionProgressTile(
                              name: sectionName,
                              progress: progress,
                              completed: completed,
                              total: total,
                            );
                          }),
                          const CommonHeight(height: 40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<ProgressController>(
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

class _SectionProgressTile extends StatelessWidget {
  final String name;
  final double progress;
  final int completed;
  final int total;

  const _SectionProgressTile({
    required this.name,
    required this.progress,
    required this.completed,
    required this.total,
  });

  Color get _progressColor {
    if (progress >= 1.0) return Colors.green;
    if (progress >= 0.5) return Colors.orange;
    return AppColors.primary700;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                ),
                Row(
                  children: [
                    if (progress >= 1.0)
                      const Icon(Icons.check_circle, color: Colors.green, size: 18),
                    const SizedBox(width: 4),
                    Text(
                      '$completed / $total',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: LinearProgressIndicator(
                      value: progress,
                      minHeight: 6,
                      backgroundColor: Colors.grey[200],
                      valueColor: AlwaysStoppedAnimation<Color>(_progressColor),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  '${(progress * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color: _progressColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
