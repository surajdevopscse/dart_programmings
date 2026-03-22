import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/modules/interview_prep/models/interview_question.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/dart_qa_controller.dart';

class DartQAPage extends GetView<DartQAController> {
  const DartQAPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Dart Interview Q&A'),
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
                                text: 'Dart Interview Q&A',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  letterSpacing: 1.2,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/interview-prep/dart-interview-qa', pageTitle: 'Dart Interview Q&A'),
                          ],
                        ),
                        const CommonHeight(height: 8),
                        SmallText(
                          text: 'Master Dart with these commonly asked interview questions covering beginner to advanced topics.',
                        ),
                        const CommonHeight(height: 16),
                        // Level Filter Chips
                        Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _LevelChip(
                                label: 'All',
                                isSelected: controller.selectedLevel.value == null,
                                onTap: () => controller.filterByLevel(null),
                                color: Colors.grey,
                              ),
                              const SizedBox(width: 8),
                              _LevelChip(
                                label: 'Beginner',
                                isSelected: controller.selectedLevel.value == QuestionLevel.beginner,
                                onTap: () => controller.filterByLevel(QuestionLevel.beginner),
                                color: Colors.green,
                              ),
                              const SizedBox(width: 8),
                              _LevelChip(
                                label: 'Intermediate',
                                isSelected: controller.selectedLevel.value == QuestionLevel.intermediate,
                                onTap: () => controller.filterByLevel(QuestionLevel.intermediate),
                                color: Colors.orange,
                              ),
                              const SizedBox(width: 8),
                              _LevelChip(
                                label: 'Advanced',
                                isSelected: controller.selectedLevel.value == QuestionLevel.advanced,
                                onTap: () => controller.filterByLevel(QuestionLevel.advanced),
                                color: Colors.red,
                              ),
                            ],
                          ),
                        )),
                        const CommonHeight(height: 8),
                        // Question count
                        Obx(() => SmallText(
                          text: '${controller.filteredQuestions.length} questions',
                          style: AppStyle.globalSmallTextStyle.copyWith(
                            color: Colors.grey[600],
                            fontSize: 13,
                          ),
                        )),
                        const CommonHeight(height: 12),
                        // Questions List
                        Obx(() {
                          final questions = controller.filteredQuestions;
                          return Column(
                            children: List.generate(questions.length, (i) {
                              final q = questions[i];
                              return _QuestionTile(
                                question: q,
                                index: i,
                                isExpanded: controller.expandedIndex.value == i,
                                onTap: () => controller.toggleExpand(i),
                              );
                            }),
                          );
                        }),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<DartQAController>(
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

class _LevelChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _LevelChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ),
    );
  }
}

class _QuestionTile extends StatelessWidget {
  final InterviewQuestion question;
  final int index;
  final bool isExpanded;
  final VoidCallback onTap;

  const _QuestionTile({
    required this.question,
    required this.index,
    required this.isExpanded,
    required this.onTap,
  });

  Color get _levelColor {
    switch (question.level) {
      case QuestionLevel.beginner:
        return Colors.green;
      case QuestionLevel.intermediate:
        return Colors.orange;
      case QuestionLevel.advanced:
        return Colors.red;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      elevation: isExpanded ? 3 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: isExpanded
            ? BorderSide(color: AppColors.primary700, width: 1.5)
            : BorderSide.none,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: AppColors.primary700.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Center(
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(
                          color: AppColors.primary700,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question.question,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: _levelColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: _levelColor, width: 1),
                              ),
                              child: Text(
                                question.level.name,
                                style: TextStyle(
                                  color: _levelColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                question.category,
                                style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
            if (isExpanded) ...[
              const Divider(height: 1),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
                child: Text(
                  'Answer',
                  style: TextStyle(
                    color: AppColors.primary700,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: Text(
                  question.answer,
                  style: const TextStyle(fontSize: 14, height: 1.6),
                ),
              ),
              if (question.codeExample != null) ...[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 4),
                  child: Text(
                    'Example',
                    style: TextStyle(
                      color: AppColors.primary700,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                CodeWidget(code: question.codeExample!),
                const SizedBox(height: 8),
              ],
            ],
          ],
        ),
      ),
    );
  }
}
