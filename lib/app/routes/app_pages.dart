import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
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
      onExit: (context, state) {
        Get.delete<HomeController>();
        return true;
      },
      name: SideNavBarParentEnum.home.title,
      path: SideNavBarParentEnum.home.parentPath,
      builder: (context, state) {
        Get.put(HomeController());
        return const HomePage();
      },
    ),
    GoRoute(
      onExit: (context, state) {
        Get.delete<IntroductionController>();
        return true;
      },
      name: SideNavBarParentEnum.introductionAndSyntax.title,
      path: SideNavBarParentEnum.introductionAndSyntax.parentPath,
      builder: (context, state) {
        Get.put(IntroductionController());
        return const IntroductionToDartPage();
      },
      routes: [
        GoRoute(
          onExit: (context, state) {
            Get.delete<InstallDartController>();
            return true;
          },
          name: SideNavBarChildEnum.installDart.title,
          path: SideNavBarChildEnum.installDart.childPath!,
          builder: (context, state) {
            Get.put(InstallDartController());
            return const InstallDartPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<BasicDartController>();
            return true;
          },
          name: SideNavBarChildEnum.dartBasic.title,
          path: SideNavBarChildEnum.dartBasic.childPath!,
          builder: (context, state) {
            Get.put(BasicDartController());
            return const BasicDartPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<VaribalesController>();
            return true;
          },
          name: SideNavBarChildEnum.variables.title,
          path: SideNavBarChildEnum.variables.childPath!,
          builder: (context, state) {
            Get.put(VaribalesController());
            return const VariablesDart();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<DataTypesController>();
            return true;
          },
          name: SideNavBarChildEnum.dataTypes.title,
          path: SideNavBarChildEnum.dataTypes.childPath!,
          builder: (context, state) {
            Get.put(DataTypesController());
            return const DataTypes();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.comments.title,
          path: SideNavBarChildEnum.comments.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.oprators.title,
          path: SideNavBarChildEnum.oprators.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.userInput.title,
          path: SideNavBarChildEnum.userInput.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.metaData.title,
          path: SideNavBarChildEnum.metaData.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.libraries.title,
          path: SideNavBarChildEnum.libraries.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.string.title,
          path: SideNavBarChildEnum.string.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.keywords.title,
          path: SideNavBarChildEnum.keywords.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.finalVSConst.title,
          path: SideNavBarChildEnum.finalVSConst.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<HomeController>();
            return true;
          },
          name: SideNavBarChildEnum.dateTimeInDart.title,
          path: SideNavBarChildEnum.dateTimeInDart.childPath!,
          builder: (context, state) {
            return const ComingSoonPage();
          },
        ),
      ],
    ),
  ];
}
