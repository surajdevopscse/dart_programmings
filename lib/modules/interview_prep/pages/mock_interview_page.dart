import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
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
import '../controllers/mock_interview_controller.dart';

class MockInterviewPage extends GetView<MockInterviewController> {
  const MockInterviewPage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Mock Interview'),
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
                        BigText(
                          text: 'Mock Interview',
                          style: AppStyle.globalBigTextStyle.copyWith(
                            fontSize: 28,
                            letterSpacing: 1.2,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(
                          text: 'Practice one question at a time. Think through your answer, then reveal the solution.',
                        ),
                        const CommonHeight(height: 20),
                        // Category selector
                        Obx(() => SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              _CategoryChip(
                                label: 'All',
                                isSelected: controller.selectedCategory.value == 'All',
                                onTap: () => controller.setCategory('All'),
                                color: Colors.purple,
                              ),
                              const SizedBox(width: 8),
                              _CategoryChip(
                                label: 'Dart',
                                isSelected: controller.selectedCategory.value == 'Dart',
                                onTap: () => controller.setCategory('Dart'),
                                color: Colors.blue,
                              ),
                              const SizedBox(width: 8),
                              _CategoryChip(
                                label: 'Flutter',
                                isSelected: controller.selectedCategory.value == 'Flutter',
                                onTap: () => controller.setCategory('Flutter'),
                                color: Colors.teal,
                              ),
                            ],
                          ),
                        )),
                        const CommonHeight(height: 24),
                        // Progress indicator
                        Obx(() {
                          final questions = controller.filteredQuestions;
                          if (questions.isEmpty) return const SizedBox.shrink();
                          final current = controller.currentIndex.value + 1;
                          final total = questions.length;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Question $current of $total',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  TextButton.icon(
                                    onPressed: controller.resetSession,
                                    icon: const Icon(Icons.refresh, size: 16),
                                    label: const Text('Reset'),
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.grey[600],
                                      padding: const EdgeInsets.symmetric(horizontal: 8),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: LinearProgressIndicator(
                                  value: current / total,
                                  minHeight: 6,
                                  backgroundColor: Colors.grey[200],
                                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary700),
                                ),
                              ),
                            ],
                          );
                        }),
                        const CommonHeight(height: 20),
                        // Question card
                        Obx(() {
                          final question = controller.currentQuestion;
                          if (question == null) {
                            return const Center(
                              child: Padding(
                                padding: EdgeInsets.all(40),
                                child: Text('No questions available.'),
                              ),
                            );
                          }
                          return _QuestionCard(
                            question: question,
                            showAnswer: controller.showAnswer.value,
                            onToggleAnswer: controller.toggleAnswer,
                          );
                        }),
                        const CommonHeight(height: 24),
                        // Navigation buttons
                        Obx(() {
                          if (controller.currentQuestion == null) return const SizedBox.shrink();
                          return Row(
                            children: [
                              Expanded(
                                child: OutlinedButton.icon(
                                  onPressed: controller.previousQuestion,
                                  icon: const Icon(Icons.arrow_back),
                                  label: const Text('Previous'),
                                  style: OutlinedButton.styleFrom(
                                    foregroundColor: AppColors.primary700,
                                    side: BorderSide(color: AppColors.primary700),
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: controller.nextQuestion,
                                  icon: const Icon(Icons.arrow_forward),
                                  label: const Text('Next'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primary700,
                                    foregroundColor: Colors.white,
                                    padding: const EdgeInsets.symmetric(vertical: 14),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
          GetBuilder<MockInterviewController>(
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

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color color;

  const _CategoryChip({
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? color : color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : color,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}

class _QuestionCard extends StatelessWidget {
  final InterviewQuestion question;
  final bool showAnswer;
  final VoidCallback onToggleAnswer;

  const _QuestionCard({
    required this.question,
    required this.showAnswer,
    required this.onToggleAnswer,
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Question header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.purple.withOpacity(0.05),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: _levelColor.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _levelColor),
                      ),
                      child: Text(
                        question.level.name.toUpperCase(),
                        style: TextStyle(
                          color: _levelColor,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.8,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.purple.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        question.category,
                        style: const TextStyle(
                          color: Colors.purple,
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  question.question,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
          // Show answer button / answer area
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!showAnswer) ...[
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: onToggleAnswer,
                      icon: const Icon(Icons.visibility),
                      label: const Text('Show Answer'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Center(
                    child: Text(
                      'Think through your answer first, then reveal it.',
                      style: TextStyle(color: Colors.grey, fontSize: 13, fontStyle: FontStyle.italic),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ] else ...[
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: onToggleAnswer,
                      icon: const Icon(Icons.visibility_off),
                      label: const Text('Hide Answer'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.purple,
                        side: const BorderSide(color: Colors.purple),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Answer',
                    style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    question.answer,
                    style: const TextStyle(fontSize: 15, height: 1.7),
                  ),
                  if (question.codeExample != null) ...[
                    const SizedBox(height: 16),
                    const Text(
                      'Code Example',
                      style: TextStyle(
                        color: Colors.purple,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 8),
                    CodeWidget(code: question.codeExample!),
                  ],
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
