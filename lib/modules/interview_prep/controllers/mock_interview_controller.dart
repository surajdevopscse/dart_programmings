import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/modules/interview_prep/controllers/dart_qa_controller.dart';
import 'package:dart_programing/modules/interview_prep/controllers/flutter_qa_controller.dart';
import 'package:dart_programing/modules/interview_prep/models/interview_question.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MockInterviewController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  var currentIndex = RxInt(0);
  var showAnswer = RxBool(false);
  var selectedCategory = RxString('All');

  List<InterviewQuestion> get allQuestions {
    final dartQs = Get.find<DartQAController>().allQuestions;
    final flutterQs = Get.find<FlutterQAController>().allQuestions;
    return [...dartQs, ...flutterQs];
  }

  List<InterviewQuestion> get filteredQuestions {
    switch (selectedCategory.value) {
      case 'Dart':
        return Get.find<DartQAController>().allQuestions;
      case 'Flutter':
        return Get.find<FlutterQAController>().allQuestions;
      default:
        return allQuestions;
    }
  }

  InterviewQuestion? get currentQuestion {
    final questions = filteredQuestions;
    if (questions.isEmpty) return null;
    return questions[currentIndex.value % questions.length];
  }

  void nextQuestion() {
    showAnswer.value = false;
    final questions = filteredQuestions;
    if (questions.isEmpty) return;
    currentIndex.value = (currentIndex.value + 1) % questions.length;
  }

  void previousQuestion() {
    showAnswer.value = false;
    final questions = filteredQuestions;
    if (questions.isEmpty) return;
    currentIndex.value =
        (currentIndex.value - 1 + questions.length) % questions.length;
  }

  void toggleAnswer() {
    showAnswer.value = !showAnswer.value;
  }

  void resetSession() {
    currentIndex.value = 0;
    showAnswer.value = false;
  }

  void setCategory(String category) {
    selectedCategory.value = category;
    currentIndex.value = 0;
    showAnswer.value = false;
  }

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.interviewPrep,
      child: SideNavBarChildEnum.mockInterview,
    );
    Get.find<AppBarController>().appBarTitle = SK.mockInterview;
    update();
    super.onInit();
  }

  void scrollToTop() => scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
