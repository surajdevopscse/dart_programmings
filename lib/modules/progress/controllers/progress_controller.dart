import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProgressController extends GetxController {
  late ScrollController scrollController;
  bool showBackToTopButton = false;

  final ProgressService _progressService = Get.find();

  static const Map<String, List<String>> _sections = {
    'Introduction': [
      AppPath.INTRODUCION,
      '${AppPath.INTRODUCION}/${AppPath.INSTALL_DART}',
      '${AppPath.INTRODUCION}/${AppPath.VARIABLE_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.DATA_TYPES_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.COMMENTS_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.OPRATOR_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.USER_INPUT_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.STRING_IN_DART}',
      '${AppPath.INTRODUCION}/${AppPath.FINAL_VS_CONST}',
    ],
    'Control Flow': [
      AppPath.CONDITIONS,
      '${AppPath.CONDITIONS}/${AppPath.ASSERT}',
      '${AppPath.CONDITIONS}/${AppPath.SWITCH}',
      '${AppPath.CONDITIONS}/${AppPath.TERNERY}',
      '${AppPath.CONDITIONS}/${AppPath.LOOPS}',
      '${AppPath.CONDITIONS}/${AppPath.EXCEPTION}',
    ],
    'Functions': [
      AppPath.FUNCTIONS,
      '${AppPath.FUNCTIONS}/${AppPath.TYPESOFFUNCTIONS}',
      '${AppPath.FUNCTIONS}/${AppPath.FUNCTIONPARAMETER}',
      '${AppPath.FUNCTIONS}/${AppPath.ANONYMOUSFUNCTIONS}',
      '${AppPath.FUNCTIONS}/${AppPath.ARROWFUNCTIONS}',
    ],
    'OOP': [
      AppPath.OOPSINDART,
      AppPath.CLASINDART,
      AppPath.OBJECTINDART,
      AppPath.INHERITENCE,
      AppPath.POLYMORPHISM,
      AppPath.ENCAPSULATION,
      AppPath.MIXINDART,
      AppPath.GENERIC,
      AppPath.EXTENSION,
    ],
    'Null Safety': [
      AppPath.NullSAFETY,
      AppPath.TYPEPROMOTIONS,
      AppPath.LATE,
    ],
    'Async Programming': [
      AppPath.ASYNCPROGRAMMING,
      AppPath.FUTURE,
      AppPath.ASYNCANDAWAIT,
      AppPath.STREAM,
      AppPath.ISOLATE,
    ],
    'Flutter Tutorials': [
      AppPath.FLUTTER_INTRO,
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_SETUP}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_WIDGETS}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATELESS}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATEFUL}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_LAYOUTS}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_NAVIGATION}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_GOROUTER}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATE_MGMT}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_GETX}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_NETWORKING}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_DIO}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_SHARED_PREF}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_FIREBASE}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_ANIMATIONS}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_TESTING}',
      '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_PUBLISHING}',
    ],
  };

  Map<String, List<String>> get sections => _sections;

  double get overallProgress {
    final all = _sections.values.expand((e) => e).toList();
    return _progressService.sectionProgress(all);
  }

  double sectionProgress(String sectionName) {
    final routes = _sections[sectionName];
    if (routes == null) return 0;
    return _progressService.sectionProgress(routes);
  }

  int completedCount(String sectionName) {
    final routes = _sections[sectionName] ?? [];
    return routes.where((r) => _progressService.isCompleted(r)).length;
  }

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.progress,
      child: SideNavBarChildEnum.progressPage,
    );
    Get.find<AppBarController>().appBarTitle = SK.progress;
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
