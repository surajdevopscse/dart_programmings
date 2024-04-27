import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/modules/home/controllers/home_controller.dart';
import 'package:dart_programing/modules/home/pages/home_page.dart';
import 'package:dart_programing/modules/introduction/controllers/basic_dart_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/data_types_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/install_dart_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/introduction_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/variables_coontroller.dart';
import 'package:dart_programing/modules/introduction/pages/basic_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/data_types.dart';
import 'package:dart_programing/modules/introduction/pages/install_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/introduction_to_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/variables_page.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class AppPages {
  AppPages._();

  static GoRouter router = GoRouter(
    navigatorKey: Get.key,
    initialLocation: AppPath.HOME,
    routes: routes,
  );

  static final routes = [
    GoRoute(
      path: AppPath.HOME,
      builder: (context, state) {
        Get.put(HomeController());
        return const HomePage();
      },
    ),
    GoRoute(
        path: AppPath.INTRODUCION,
        builder: (context, state) {
          Get.put(IntroductionController());
          return const IntroductionToDartPage();
        },
        routes: [
          GoRoute(
            path: AppPath.INSTALL_DART,
            builder: (context, state) {
              Get.put(InstallDartController());
              return const InstallDartPage();
            },
          ),
          GoRoute(
            path: AppPath.DART_BASIC,
            builder: (context, state) {
              Get.put(BasicDartController());
              return const BasicDartPage();
            },
          ),
          GoRoute(
            path: AppPath.VARIABLE_IN_DART,
            builder: (context, state) {
              Get.put(VaribalesController());
              return const VariablesDart();
            },
          ),
          GoRoute(
            path: AppPath.DATA_TYPES_IN_DART,
            builder: (context, state) {
              Get.put(DataTypesController());
              return const DataTypes();
            },
          ),
          GoRoute(
            path: AppPath.COMMENTS_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.OPRATOR_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.USER_INPUT_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.METADATA_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.LIBRARIES_AND_IMPORTS_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.STRING_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.KEYWORDS_IN_DART,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.FINAL_VS_CONST,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
          GoRoute(
            path: AppPath.DATETIME,
            builder: (context, state) {
              return const ComingSoonPage();
            },
          ),
        ]),
  ];
}
