import 'package:dart_programing/modules/blog/controllers/blog_controller.dart';
import 'package:dart_programing/modules/blog/controllers/shuffled_blog_controller.dart';
import 'package:dart_programing/modules/home/pages/dart_introduction.dart';
import 'package:flutter/material.dart';
import 'package:dart_programing/app/common_widgets/empty_screen.dart';
import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/modules/home/controllers/home_controller.dart';
import 'package:dart_programing/modules/home/pages/home_page.dart';
import 'package:dart_programing/modules/introduction/controllers/basic_dart_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/comments_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/data_types_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/install_dart_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/introduction_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/oprators_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/user_input_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/variables_coontroller.dart';
import 'package:dart_programing/modules/introduction/pages/basic_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/comments.dart';
import 'package:dart_programing/modules/introduction/pages/data_types.dart';
import 'package:dart_programing/modules/introduction/pages/install_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/introduction_to_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/oprators.dart';
import 'package:dart_programing/modules/introduction/pages/user_input.dart';
import 'package:dart_programing/modules/introduction/pages/variables_page.dart';
import 'package:dart_programing/modules/introduction/controllers/metadata_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/libraries_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/string_dart_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/keywords_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/final_vs_const_controller.dart';
import 'package:dart_programing/modules/introduction/controllers/datetime_controller.dart';
import 'package:dart_programing/modules/introduction/pages/metadata_page.dart';
import 'package:dart_programing/modules/introduction/pages/libraries_page.dart';
import 'package:dart_programing/modules/introduction/pages/string_dart_page.dart';
import 'package:dart_programing/modules/introduction/pages/keywords_page.dart';
import 'package:dart_programing/modules/introduction/pages/final_vs_const_page.dart';
import 'package:dart_programing/modules/introduction/pages/datetime_page.dart';
import 'package:dart_programing/modules/blog/pages/blog_details_page.dart';
import 'package:dart_programing/modules/blog/pages/blog_list_page.dart';

// Control Flow and Loops
import 'package:dart_programing/modules/control_flow_and_loops/controllers/conditions_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/assert_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/switch_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/ternary_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/loops_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/for_loop_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/for_each_loop_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/while_loop_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/do_while_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/break_continue_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/controllers/exception_controller.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/conditions_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/assert_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/switch_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/ternary_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/loops_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/for_loop_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/for_each_loop_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/while_loop_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/do_while_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/break_continue_page.dart';
import 'package:dart_programing/modules/control_flow_and_loops/pages/exception_page.dart';

// Functions
import 'package:dart_programing/modules/functions/controllers/functions_controller.dart';
import 'package:dart_programing/modules/functions/controllers/types_of_functions_controller.dart';
import 'package:dart_programing/modules/functions/controllers/function_parameter_controller.dart';
import 'package:dart_programing/modules/functions/controllers/anonymous_functions_controller.dart';
import 'package:dart_programing/modules/functions/controllers/arrow_functions_controller.dart';
import 'package:dart_programing/modules/functions/controllers/scope_controller.dart';
import 'package:dart_programing/modules/functions/controllers/math_in_dart_controller.dart';
import 'package:dart_programing/modules/functions/pages/functions_page.dart';
import 'package:dart_programing/modules/functions/pages/types_of_functions_page.dart';
import 'package:dart_programing/modules/functions/pages/function_parameter_page.dart';
import 'package:dart_programing/modules/functions/pages/anonymous_functions_page.dart';
import 'package:dart_programing/modules/functions/pages/arrow_functions_page.dart';
import 'package:dart_programing/modules/functions/pages/scope_page.dart';
import 'package:dart_programing/modules/functions/pages/math_in_dart_page.dart';

// Collections
import 'package:dart_programing/modules/collections/controllers/list_controller.dart';
import 'package:dart_programing/modules/collections/controllers/set_controller.dart';
import 'package:dart_programing/modules/collections/controllers/map_controller.dart';
import 'package:dart_programing/modules/collections/controllers/where_controller.dart';
import 'package:dart_programing/modules/collections/pages/list_page.dart';
import 'package:dart_programing/modules/collections/pages/set_page.dart';
import 'package:dart_programing/modules/collections/pages/map_page.dart';
import 'package:dart_programing/modules/collections/pages/where_page.dart';

// File Handling
import 'package:dart_programing/modules/file_handling/controllers/read_file_controller.dart';
import 'package:dart_programing/modules/file_handling/controllers/write_file_controller.dart';
import 'package:dart_programing/modules/file_handling/controllers/delete_file_controller.dart';
import 'package:dart_programing/modules/file_handling/pages/read_file_page.dart';
import 'package:dart_programing/modules/file_handling/pages/write_file_page.dart';
import 'package:dart_programing/modules/file_handling/pages/delete_file_page.dart';

// OOPs in Dart
import 'package:dart_programing/modules/oops/controllers/oops_controller.dart';
import 'package:dart_programing/modules/oops/controllers/class_controller.dart';
import 'package:dart_programing/modules/oops/controllers/object_controller.dart';
import 'package:dart_programing/modules/oops/controllers/class_and_object_controller.dart';
import 'package:dart_programing/modules/oops/controllers/constructor_controller.dart';
import 'package:dart_programing/modules/oops/controllers/default_constructor_controller.dart';
import 'package:dart_programing/modules/oops/controllers/parameterized_constructor_controller.dart';
import 'package:dart_programing/modules/oops/controllers/named_constructor_controller.dart';
import 'package:dart_programing/modules/oops/controllers/constant_constructor_controller.dart';
import 'package:dart_programing/modules/oops/controllers/encapsulation_controller.dart';
import 'package:dart_programing/modules/oops/controllers/getter_controller.dart';
import 'package:dart_programing/modules/oops/controllers/setter_controller.dart';
import 'package:dart_programing/modules/oops/controllers/inheritance_controller.dart';
import 'package:dart_programing/modules/oops/controllers/polymorphism_controller.dart';
import 'package:dart_programing/modules/oops/controllers/static_controller.dart';
import 'package:dart_programing/modules/oops/controllers/super_controller.dart';
import 'package:dart_programing/modules/oops/controllers/enum_controller.dart';
import 'package:dart_programing/modules/oops/controllers/abstract_controller.dart';
import 'package:dart_programing/modules/oops/controllers/interface_controller.dart';
import 'package:dart_programing/modules/oops/controllers/mixin_controller.dart';
import 'package:dart_programing/modules/oops/controllers/generic_controller.dart';
import 'package:dart_programing/modules/oops/controllers/extension_controller.dart';
import 'package:dart_programing/modules/oops/controllers/callable_object_controller.dart';
import 'package:dart_programing/modules/oops/controllers/factory_constructor_controller.dart';
import 'package:dart_programing/modules/oops/pages/oops_page.dart';
import 'package:dart_programing/modules/oops/pages/class_page.dart';
import 'package:dart_programing/modules/oops/pages/object_page.dart';
import 'package:dart_programing/modules/oops/pages/class_and_object_page.dart';
import 'package:dart_programing/modules/oops/pages/constructor_page.dart';
import 'package:dart_programing/modules/oops/pages/default_constructor_page.dart';
import 'package:dart_programing/modules/oops/pages/parameterized_constructor_page.dart';
import 'package:dart_programing/modules/oops/pages/named_constructor_page.dart';
import 'package:dart_programing/modules/oops/pages/constant_constructor_page.dart';
import 'package:dart_programing/modules/oops/pages/encapsulation_page.dart';
import 'package:dart_programing/modules/oops/pages/getter_page.dart';
import 'package:dart_programing/modules/oops/pages/setter_page.dart';
import 'package:dart_programing/modules/oops/pages/inheritance_page.dart';
import 'package:dart_programing/modules/oops/pages/polymorphism_page.dart';
import 'package:dart_programing/modules/oops/pages/static_page.dart';
import 'package:dart_programing/modules/oops/pages/super_page.dart';
import 'package:dart_programing/modules/oops/pages/enum_page.dart';
import 'package:dart_programing/modules/oops/pages/abstract_page.dart';
import 'package:dart_programing/modules/oops/pages/interface_page.dart';
import 'package:dart_programing/modules/oops/pages/mixin_page.dart';
import 'package:dart_programing/modules/oops/pages/generic_page.dart';
import 'package:dart_programing/modules/oops/pages/extension_page.dart';
import 'package:dart_programing/modules/oops/pages/callable_object_page.dart';
import 'package:dart_programing/modules/oops/pages/factory_constructor_page.dart';

// Null Safety
import 'package:dart_programing/modules/null_safety/controllers/null_safety_controller.dart';
import 'package:dart_programing/modules/null_safety/controllers/type_promotion_controller.dart';
import 'package:dart_programing/modules/null_safety/controllers/late_controller.dart';
import 'package:dart_programing/modules/null_safety/pages/null_safety_page.dart';
import 'package:dart_programing/modules/null_safety/pages/type_promotion_page.dart';
import 'package:dart_programing/modules/null_safety/pages/late_page.dart';

// Async Programming
import 'package:dart_programing/modules/async_programming/controllers/async_programming_controller.dart';
import 'package:dart_programing/modules/async_programming/controllers/future_controller.dart';
import 'package:dart_programing/modules/async_programming/controllers/async_await_controller.dart';
import 'package:dart_programing/modules/async_programming/controllers/stream_controller.dart';
import 'package:dart_programing/modules/async_programming/controllers/isolate_controller.dart';
import 'package:dart_programing/modules/async_programming/pages/async_programming_page.dart';
import 'package:dart_programing/modules/async_programming/pages/future_page.dart';
import 'package:dart_programing/modules/async_programming/pages/async_await_page.dart';
import 'package:dart_programing/modules/async_programming/pages/stream_page.dart';
import 'package:dart_programing/modules/async_programming/pages/isolate_page.dart';

// Flutter Tutorials
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_intro_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_setup_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_widgets_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_stateless_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_stateful_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_layouts_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_row_column_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_stack_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_listview_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_gridview_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_navigation_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_gorouter_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_state_mgmt_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_provider_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_riverpod_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_getx_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_bloc_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_networking_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_http_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_dio_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_local_storage_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_shared_pref_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_hive_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_sqlite_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_firebase_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_animations_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_implicit_anim_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_explicit_anim_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_hero_anim_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_testing_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_unit_test_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_widget_test_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_publishing_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/controllers/flutter_web_desktop_controller.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_intro_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_setup_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_widgets_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_stateless_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_stateful_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_layouts_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_row_column_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_stack_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_listview_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_gridview_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_navigation_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_gorouter_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_state_mgmt_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_provider_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_riverpod_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_getx_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_bloc_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_networking_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_http_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_dio_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_local_storage_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_shared_pref_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_hive_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_sqlite_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_firebase_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_animations_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_implicit_anim_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_explicit_anim_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_hero_anim_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_testing_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_unit_test_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_widget_test_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_publishing_page.dart';
import 'package:dart_programing/modules/flutter_tutorials/pages/flutter_web_desktop_page.dart';

// Interview Prep
import 'package:dart_programing/modules/interview_prep/controllers/interview_home_controller.dart';
import 'package:dart_programing/modules/interview_prep/controllers/dart_qa_controller.dart';
import 'package:dart_programing/modules/interview_prep/controllers/flutter_qa_controller.dart';
import 'package:dart_programing/modules/interview_prep/controllers/mock_interview_controller.dart';
import 'package:dart_programing/modules/interview_prep/pages/interview_home_page.dart';
import 'package:dart_programing/modules/interview_prep/pages/dart_qa_page.dart';
import 'package:dart_programing/modules/interview_prep/pages/flutter_qa_page.dart';
import 'package:dart_programing/modules/interview_prep/pages/mock_interview_page.dart';

// Best Guide
import 'package:dart_programing/modules/best_guide/controllers/best_guide_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/project_structure_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/clean_arch_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/performance_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/responsive_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/code_style_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/mistakes_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/packages_controller.dart';
import 'package:dart_programing/modules/best_guide/controllers/testing_guide_controller.dart';
import 'package:dart_programing/modules/best_guide/pages/best_guide_home_page.dart';
import 'package:dart_programing/modules/best_guide/pages/project_structure_page.dart';
import 'package:dart_programing/modules/best_guide/pages/clean_arch_page.dart';
import 'package:dart_programing/modules/best_guide/pages/performance_page.dart';
import 'package:dart_programing/modules/best_guide/pages/responsive_page.dart';
import 'package:dart_programing/modules/best_guide/pages/code_style_page.dart';
import 'package:dart_programing/modules/best_guide/pages/mistakes_page.dart';
import 'package:dart_programing/modules/best_guide/pages/packages_page.dart';
import 'package:dart_programing/modules/best_guide/pages/testing_guide_page.dart';

// Search
import 'package:dart_programing/modules/search/controllers/search_controller.dart';
import 'package:dart_programing/modules/search/pages/search_page.dart';

// Progress
import 'package:dart_programing/modules/progress/controllers/progress_controller.dart';
import 'package:dart_programing/modules/progress/pages/progress_page.dart';

// Bookmarks
import 'package:dart_programing/modules/bookmarks/controllers/bookmarks_controller.dart';
import 'package:dart_programing/modules/bookmarks/pages/bookmarks_page.dart';

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
    ShellRoute(
      builder: (context, state, child) {
        final width = MediaQuery.of(context).size.width.toInt();
        final tempSideMenuWidth = width * (280 / 1728);
        final sideMenuWidth =
            tempSideMenuWidth < 150 ? 150 : tempSideMenuWidth.toInt();
        return DartIntroduction(
          width: width,
          sideMenuWidth: sideMenuWidth,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: '/',
          redirect: (_, __) => SideNavBarParentEnum.home.parentPath,
          builder: (context, state) {
            return const HomePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
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
                Get.delete<CommentsController>();
                return true;
              },
              name: SideNavBarChildEnum.comments.title,
              path: SideNavBarChildEnum.comments.childPath!,
              builder: (context, state) {
                Get.put(CommentsController());
                return const CommentsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<OpratorsController>();
                return true;
              },
              name: SideNavBarChildEnum.oprators.title,
              path: SideNavBarChildEnum.oprators.childPath!,
              builder: (context, state) {
                Get.put(OpratorsController());
                return const OperatorsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<UserInputController>();
                return true;
              },
              name: SideNavBarChildEnum.userInput.title,
              path: SideNavBarChildEnum.userInput.childPath!,
              builder: (context, state) {
                Get.put(UserInputController());
                return const UserInputPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<MetadataController>();
                return true;
              },
              name: SideNavBarChildEnum.metaData.title,
              path: SideNavBarChildEnum.metaData.childPath!,
              builder: (context, state) {
                Get.put(MetadataController());
                return const MetadataPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<LibrariesController>();
                return true;
              },
              name: SideNavBarChildEnum.libraries.title,
              path: SideNavBarChildEnum.libraries.childPath!,
              builder: (context, state) {
                Get.put(LibrariesController());
                return const LibrariesPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<StringDartController>();
                return true;
              },
              name: SideNavBarChildEnum.string.title,
              path: SideNavBarChildEnum.string.childPath!,
              builder: (context, state) {
                Get.put(StringDartController());
                return const StringDartPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<KeywordsController>();
                return true;
              },
              name: SideNavBarChildEnum.keywords.title,
              path: SideNavBarChildEnum.keywords.childPath!,
              builder: (context, state) {
                Get.put(KeywordsController());
                return const KeywordsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<FinalVsConstController>();
                return true;
              },
              name: SideNavBarChildEnum.finalVSConst.title,
              path: SideNavBarChildEnum.finalVSConst.childPath!,
              builder: (context, state) {
                Get.put(FinalVsConstController());
                return const FinalVsConstPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<DateTimeController>();
                return true;
              },
              name: SideNavBarChildEnum.dateTimeInDart.title,
              path: SideNavBarChildEnum.dateTimeInDart.childPath!,
              builder: (context, state) {
                Get.put(DateTimeController());
                return const DateTimePage();
              },
            ),
          ],
        ),

        // Control Flow and Loops
        GoRoute(
          onExit: (context, state) {
            Get.delete<ConditionsController>();
            return true;
          },
          path: AppPath.CONDITIONS,
          builder: (context, state) {
            Get.put(ConditionsController());
            return const ConditionsPage();
          },
          routes: [
            GoRoute(
              onExit: (context, state) {
                Get.delete<AssertController>();
                return true;
              },
              path: AppPath.ASSERT,
              builder: (context, state) {
                Get.put(AssertController());
                return const AssertPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<SwitchController>();
                return true;
              },
              path: AppPath.SWITCH,
              builder: (context, state) {
                Get.put(SwitchController());
                return const SwitchPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<TernaryController>();
                return true;
              },
              path: AppPath.TERNERY,
              builder: (context, state) {
                Get.put(TernaryController());
                return const TernaryPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<LoopsController>();
                return true;
              },
              path: AppPath.LOOPS,
              builder: (context, state) {
                Get.put(LoopsController());
                return const LoopsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<ForLoopController>();
                return true;
              },
              path: AppPath.FORLOOP,
              builder: (context, state) {
                Get.put(ForLoopController());
                return const ForLoopPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<ForEachLoopController>();
                return true;
              },
              path: AppPath.FOREACHLOOP,
              builder: (context, state) {
                Get.put(ForEachLoopController());
                return const ForEachLoopPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<WhileLoopController>();
                return true;
              },
              path: AppPath.WHILE,
              builder: (context, state) {
                Get.put(WhileLoopController());
                return const WhileLoopPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<DoWhileController>();
                return true;
              },
              path: AppPath.DOWHILE,
              builder: (context, state) {
                Get.put(DoWhileController());
                return const DoWhilePage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<BreakContinueController>();
                return true;
              },
              path: AppPath.BREAK,
              builder: (context, state) {
                Get.put(BreakContinueController());
                return const BreakContinuePage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<ExceptionController>();
                return true;
              },
              path: AppPath.EXCEPTION,
              builder: (context, state) {
                Get.put(ExceptionController());
                return const ExceptionPage();
              },
            ),
          ],
        ),

        // Functions
        GoRoute(
          onExit: (context, state) {
            Get.delete<FunctionsController>();
            return true;
          },
          path: AppPath.FUNCTIONS,
          builder: (context, state) {
            Get.put(FunctionsController());
            return const FunctionsPage();
          },
          routes: [
            GoRoute(
              onExit: (context, state) {
                Get.delete<TypesOfFunctionsController>();
                return true;
              },
              path: AppPath.TYPESOFFUNCTIONS,
              builder: (context, state) {
                Get.put(TypesOfFunctionsController());
                return const TypesOfFunctionsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<FunctionParameterController>();
                return true;
              },
              path: AppPath.FUNCTIONPARAMETER,
              builder: (context, state) {
                Get.put(FunctionParameterController());
                return const FunctionParameterPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<AnonymousFunctionsController>();
                return true;
              },
              path: AppPath.ANONYMOUSFUNCTIONS,
              builder: (context, state) {
                Get.put(AnonymousFunctionsController());
                return const AnonymousFunctionsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<ArrowFunctionsController>();
                return true;
              },
              path: AppPath.ARROWFUNCTIONS,
              builder: (context, state) {
                Get.put(ArrowFunctionsController());
                return const ArrowFunctionsPage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<ScopeController>();
                return true;
              },
              path: AppPath.SCOPE,
              builder: (context, state) {
                Get.put(ScopeController());
                return const ScopePage();
              },
            ),
            GoRoute(
              onExit: (context, state) {
                Get.delete<MathInDartController>();
                return true;
              },
              path: AppPath.MATHINDART,
              builder: (context, state) {
                Get.put(MathInDartController());
                return const MathInDartPage();
              },
            ),
          ],
        ),

        // Collections
        GoRoute(
          onExit: (context, state) {
            Get.delete<ListController>();
            return true;
          },
          path: AppPath.LISTINDART,
          builder: (context, state) {
            Get.put(ListController());
            return const ListPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<SetController>();
            return true;
          },
          path: AppPath.SETINDART,
          builder: (context, state) {
            Get.put(SetController());
            return const SetPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<MapController>();
            return true;
          },
          path: AppPath.MAPINDART,
          builder: (context, state) {
            Get.put(MapController());
            return const MapPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<WhereController>();
            return true;
          },
          path: AppPath.WHERE,
          builder: (context, state) {
            Get.put(WhereController());
            return const WherePage();
          },
        ),

        // File Handling
        GoRoute(
          onExit: (context, state) {
            Get.delete<ReadFileController>();
            return true;
          },
          path: AppPath.READFILE,
          builder: (context, state) {
            Get.put(ReadFileController());
            return const ReadFilePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<WriteFileController>();
            return true;
          },
          path: AppPath.WRITEFILE,
          builder: (context, state) {
            Get.put(WriteFileController());
            return const WriteFilePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<DeleteFileController>();
            return true;
          },
          path: AppPath.DELETEFILE,
          builder: (context, state) {
            Get.put(DeleteFileController());
            return const DeleteFilePage();
          },
        ),

        // OOPs in Dart
        GoRoute(
          onExit: (context, state) {
            Get.delete<OopsController>();
            return true;
          },
          path: AppPath.OOPSINDART,
          builder: (context, state) {
            Get.put(OopsController());
            return const OopsPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ClassController>();
            return true;
          },
          path: AppPath.CLASINDART,
          builder: (context, state) {
            Get.put(ClassController());
            return const ClassPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ObjectController>();
            return true;
          },
          path: AppPath.OBJECTINDART,
          builder: (context, state) {
            Get.put(ObjectController());
            return const ObjectPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ClassAndObjectController>();
            return true;
          },
          path: AppPath.CLASSANDOBJECT,
          builder: (context, state) {
            Get.put(ClassAndObjectController());
            return const ClassAndObjectPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ConstructorController>();
            return true;
          },
          path: AppPath.CONSTRUCTOR,
          builder: (context, state) {
            Get.put(ConstructorController());
            return const ConstructorPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<DefaultConstructorController>();
            return true;
          },
          path: AppPath.DEFAULTCONSTRUCTOR,
          builder: (context, state) {
            Get.put(DefaultConstructorController());
            return const DefaultConstructorPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ParameterizedConstructorController>();
            return true;
          },
          path: AppPath.PARAMETERIZEDCONSTRUCTOR,
          builder: (context, state) {
            Get.put(ParameterizedConstructorController());
            return const ParameterizedConstructorPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<NamedConstructorController>();
            return true;
          },
          path: AppPath.NAMEDCONSTRUCTOR,
          builder: (context, state) {
            Get.put(NamedConstructorController());
            return const NamedConstructorPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ConstantConstructorController>();
            return true;
          },
          path: AppPath.CONSTANTCONTRUCTOR,
          builder: (context, state) {
            Get.put(ConstantConstructorController());
            return const ConstantConstructorPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<EncapsulationController>();
            return true;
          },
          path: AppPath.ENCAPSULATION,
          builder: (context, state) {
            Get.put(EncapsulationController());
            return const EncapsulationPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<GetterController>();
            return true;
          },
          path: AppPath.GETTER,
          builder: (context, state) {
            Get.put(GetterController());
            return const GetterPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<SetterController>();
            return true;
          },
          path: AppPath.SETTER,
          builder: (context, state) {
            Get.put(SetterController());
            return const SetterPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<InheritanceController>();
            return true;
          },
          path: AppPath.INHERITENCE,
          builder: (context, state) {
            Get.put(InheritanceController());
            return const InheritancePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<PolymorphismController>();
            return true;
          },
          path: AppPath.POLYMORPHISM,
          builder: (context, state) {
            Get.put(PolymorphismController());
            return const PolymorphismPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<StaticController>();
            return true;
          },
          path: AppPath.STATIS,
          builder: (context, state) {
            Get.put(StaticController());
            return const StaticPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<SuperInDartController>();
            return true;
          },
          path: AppPath.SUPERINDART,
          builder: (context, state) {
            Get.put(SuperInDartController());
            return const SuperPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<EnumController>();
            return true;
          },
          path: AppPath.ENUM,
          builder: (context, state) {
            Get.put(EnumController());
            return const EnumPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<AbstractController>();
            return true;
          },
          path: AppPath.ABSTRACTINDSRT,
          builder: (context, state) {
            Get.put(AbstractController());
            return const AbstractPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<InterfaceController>();
            return true;
          },
          path: AppPath.INTERFACE,
          builder: (context, state) {
            Get.put(InterfaceController());
            return const InterfacePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<MixinController>();
            return true;
          },
          path: AppPath.MIXINDART,
          builder: (context, state) {
            Get.put(MixinController());
            return const MixinPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<GenericController>();
            return true;
          },
          path: AppPath.GENERIC,
          builder: (context, state) {
            Get.put(GenericController());
            return const GenericPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<ExtensionController>();
            return true;
          },
          path: AppPath.EXTENSION,
          builder: (context, state) {
            Get.put(ExtensionController());
            return const ExtensionPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<CallableObjectController>();
            return true;
          },
          path: AppPath.CALLABLEOBJECT,
          builder: (context, state) {
            Get.put(CallableObjectController());
            return const CallableObjectPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<FactoryConstructorController>();
            return true;
          },
          path: AppPath.FACTORYCONSTRUCTOR,
          builder: (context, state) {
            Get.put(FactoryConstructorController());
            return const FactoryConstructorPage();
          },
        ),

        // Null Safety
        GoRoute(
          onExit: (context, state) {
            Get.delete<NullSafetyController>();
            return true;
          },
          path: AppPath.NullSAFETY,
          builder: (context, state) {
            Get.put(NullSafetyController());
            return const NullSafetyPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<TypePromotionController>();
            return true;
          },
          path: AppPath.TYPEPROMOTIONS,
          builder: (context, state) {
            Get.put(TypePromotionController());
            return const TypePromotionPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<LateController>();
            return true;
          },
          path: AppPath.LATE,
          builder: (context, state) {
            Get.put(LateController());
            return const LatePage();
          },
        ),

        // Async Programming
        GoRoute(
          onExit: (context, state) {
            Get.delete<AsyncProgrammingController>();
            return true;
          },
          path: AppPath.ASYNCPROGRAMMING,
          builder: (context, state) {
            Get.put(AsyncProgrammingController());
            return const AsyncProgrammingPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<FutureController>();
            return true;
          },
          path: AppPath.FUTURE,
          builder: (context, state) {
            Get.put(FutureController());
            return const FuturePage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<AsyncAwaitController>();
            return true;
          },
          path: AppPath.ASYNCANDAWAIT,
          builder: (context, state) {
            Get.put(AsyncAwaitController());
            return const AsyncAwaitPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<DartStreamController>();
            return true;
          },
          path: AppPath.STREAM,
          builder: (context, state) {
            Get.put(DartStreamController());
            return const StreamPage();
          },
        ),
        GoRoute(
          onExit: (context, state) {
            Get.delete<IsolateController>();
            return true;
          },
          path: AppPath.ISOLATE,
          builder: (context, state) {
            Get.put(IsolateController());
            return const IsolatePage();
          },
        ),

        // Flutter Tutorials
        GoRoute(
          onExit: (context, state) {
            Get.delete<FlutterIntroController>();
            return true;
          },
          path: AppPath.FLUTTER_INTRO,
          builder: (context, state) {
            Get.put(FlutterIntroController());
            return const FlutterIntroPage();
          },
          routes: [
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterSetupController>(); return true; },
              path: AppPath.FLUTTER_SETUP,
              builder: (context, state) { Get.put(FlutterSetupController()); return const FlutterSetupPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterWidgetsController>(); return true; },
              path: AppPath.FLUTTER_WIDGETS,
              builder: (context, state) { Get.put(FlutterWidgetsController()); return const FlutterWidgetsPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterStatelessController>(); return true; },
              path: AppPath.FLUTTER_STATELESS,
              builder: (context, state) { Get.put(FlutterStatelessController()); return const FlutterStatelessPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterStatefulController>(); return true; },
              path: AppPath.FLUTTER_STATEFUL,
              builder: (context, state) { Get.put(FlutterStatefulController()); return const FlutterStatefulPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterLayoutsController>(); return true; },
              path: AppPath.FLUTTER_LAYOUTS,
              builder: (context, state) { Get.put(FlutterLayoutsController()); return const FlutterLayoutsPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterRowColumnController>(); return true; },
              path: AppPath.FLUTTER_ROW_COLUMN,
              builder: (context, state) { Get.put(FlutterRowColumnController()); return const FlutterRowColumnPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterStackController>(); return true; },
              path: AppPath.FLUTTER_STACK,
              builder: (context, state) { Get.put(FlutterStackController()); return const FlutterStackPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterListViewController>(); return true; },
              path: AppPath.FLUTTER_LISTVIEW,
              builder: (context, state) { Get.put(FlutterListViewController()); return const FlutterListViewPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterGridViewController>(); return true; },
              path: AppPath.FLUTTER_GRIDVIEW,
              builder: (context, state) { Get.put(FlutterGridViewController()); return const FlutterGridViewPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterNavigationController>(); return true; },
              path: AppPath.FLUTTER_NAVIGATION,
              builder: (context, state) { Get.put(FlutterNavigationController()); return const FlutterNavigationPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterGoRouterController>(); return true; },
              path: AppPath.FLUTTER_GOROUTER,
              builder: (context, state) { Get.put(FlutterGoRouterController()); return const FlutterGoRouterPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterStateMgmtController>(); return true; },
              path: AppPath.FLUTTER_STATE_MGMT,
              builder: (context, state) { Get.put(FlutterStateMgmtController()); return const FlutterStateMgmtPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterProviderController>(); return true; },
              path: AppPath.FLUTTER_PROVIDER,
              builder: (context, state) { Get.put(FlutterProviderController()); return const FlutterProviderPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterRiverpodController>(); return true; },
              path: AppPath.FLUTTER_RIVERPOD,
              builder: (context, state) { Get.put(FlutterRiverpodController()); return const FlutterRiverpodPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterGetXController>(); return true; },
              path: AppPath.FLUTTER_GETX,
              builder: (context, state) { Get.put(FlutterGetXController()); return const FlutterGetXPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterBlocController>(); return true; },
              path: AppPath.FLUTTER_BLOC,
              builder: (context, state) { Get.put(FlutterBlocController()); return const FlutterBlocPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterNetworkingController>(); return true; },
              path: AppPath.FLUTTER_NETWORKING,
              builder: (context, state) { Get.put(FlutterNetworkingController()); return const FlutterNetworkingPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterHttpController>(); return true; },
              path: AppPath.FLUTTER_HTTP,
              builder: (context, state) { Get.put(FlutterHttpController()); return const FlutterHttpPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterDioController>(); return true; },
              path: AppPath.FLUTTER_DIO,
              builder: (context, state) { Get.put(FlutterDioController()); return const FlutterDioPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterLocalStorageController>(); return true; },
              path: AppPath.FLUTTER_LOCAL_STORAGE,
              builder: (context, state) { Get.put(FlutterLocalStorageController()); return const FlutterLocalStoragePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterSharedPrefController>(); return true; },
              path: AppPath.FLUTTER_SHARED_PREF,
              builder: (context, state) { Get.put(FlutterSharedPrefController()); return const FlutterSharedPrefPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterHiveController>(); return true; },
              path: AppPath.FLUTTER_HIVE,
              builder: (context, state) { Get.put(FlutterHiveController()); return const FlutterHivePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterSqliteController>(); return true; },
              path: AppPath.FLUTTER_SQLITE,
              builder: (context, state) { Get.put(FlutterSqliteController()); return const FlutterSqlitePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterFirebaseController>(); return true; },
              path: AppPath.FLUTTER_FIREBASE,
              builder: (context, state) { Get.put(FlutterFirebaseController()); return const FlutterFirebasePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterAnimationsController>(); return true; },
              path: AppPath.FLUTTER_ANIMATIONS,
              builder: (context, state) { Get.put(FlutterAnimationsController()); return const FlutterAnimationsPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterImplicitAnimController>(); return true; },
              path: AppPath.FLUTTER_IMPLICIT_ANIM,
              builder: (context, state) { Get.put(FlutterImplicitAnimController()); return const FlutterImplicitAnimPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterExplicitAnimController>(); return true; },
              path: AppPath.FLUTTER_EXPLICIT_ANIM,
              builder: (context, state) { Get.put(FlutterExplicitAnimController()); return const FlutterExplicitAnimPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterHeroAnimController>(); return true; },
              path: AppPath.FLUTTER_HERO_ANIM,
              builder: (context, state) { Get.put(FlutterHeroAnimController()); return const FlutterHeroAnimPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterTestingController>(); return true; },
              path: AppPath.FLUTTER_TESTING,
              builder: (context, state) { Get.put(FlutterTestingController()); return const FlutterTestingPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterUnitTestController>(); return true; },
              path: AppPath.FLUTTER_UNIT_TEST,
              builder: (context, state) { Get.put(FlutterUnitTestController()); return const FlutterUnitTestPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterWidgetTestController>(); return true; },
              path: AppPath.FLUTTER_WIDGET_TEST,
              builder: (context, state) { Get.put(FlutterWidgetTestController()); return const FlutterWidgetTestPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterPublishingController>(); return true; },
              path: AppPath.FLUTTER_PUBLISHING,
              builder: (context, state) { Get.put(FlutterPublishingController()); return const FlutterPublishingPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterWebDesktopController>(); return true; },
              path: AppPath.FLUTTER_WEB_DESKTOP,
              builder: (context, state) { Get.put(FlutterWebDesktopController()); return const FlutterWebDesktopPage(); },
            ),
          ],
        ),

        // Interview Prep
        GoRoute(
          onExit: (context, state) {
            Get.delete<InterviewHomeController>();
            return true;
          },
          path: AppPath.INTERVIEW_HOME,
          builder: (context, state) {
            Get.put(InterviewHomeController());
            return const InterviewHomePage();
          },
          routes: [
            GoRoute(
              onExit: (context, state) { Get.delete<DartQAController>(); return true; },
              path: AppPath.INTERVIEW_DART_QA,
              builder: (context, state) { Get.put(DartQAController()); return const DartQAPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<FlutterQAController>(); return true; },
              path: AppPath.INTERVIEW_FLUTTER_QA,
              builder: (context, state) { Get.put(FlutterQAController()); return const FlutterQAPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<MockInterviewController>(); return true; },
              path: AppPath.INTERVIEW_MOCK,
              builder: (context, state) {
                Get.put(DartQAController());
                Get.put(FlutterQAController());
                Get.put(MockInterviewController());
                return const MockInterviewPage();
              },
            ),
          ],
        ),

        // Best Guide
        GoRoute(
          onExit: (context, state) {
            Get.delete<BestGuideController>();
            return true;
          },
          path: AppPath.BEST_GUIDE_HOME,
          builder: (context, state) {
            Get.put(BestGuideController());
            return const BestGuidePage();
          },
          routes: [
            GoRoute(
              onExit: (context, state) { Get.delete<ProjectStructureController>(); return true; },
              path: AppPath.BEST_GUIDE_STRUCTURE,
              builder: (context, state) { Get.put(ProjectStructureController()); return const ProjectStructurePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<CleanArchController>(); return true; },
              path: AppPath.BEST_GUIDE_CLEAN_ARCH,
              builder: (context, state) { Get.put(CleanArchController()); return const CleanArchPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<PerformanceController>(); return true; },
              path: AppPath.BEST_GUIDE_PERFORMANCE,
              builder: (context, state) { Get.put(PerformanceController()); return const PerformancePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<ResponsiveController>(); return true; },
              path: AppPath.BEST_GUIDE_RESPONSIVE,
              builder: (context, state) { Get.put(ResponsiveController()); return const ResponsivePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<CodeStyleController>(); return true; },
              path: AppPath.BEST_GUIDE_CODE_STYLE,
              builder: (context, state) { Get.put(CodeStyleController()); return const CodeStylePage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<MistakesController>(); return true; },
              path: AppPath.BEST_GUIDE_MISTAKES,
              builder: (context, state) { Get.put(MistakesController()); return const MistakesPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<PackagesController>(); return true; },
              path: AppPath.BEST_GUIDE_PACKAGES,
              builder: (context, state) { Get.put(PackagesController()); return const PackagesPage(); },
            ),
            GoRoute(
              onExit: (context, state) { Get.delete<TestingGuideController>(); return true; },
              path: AppPath.BEST_GUIDE_TESTING,
              builder: (context, state) { Get.put(TestingGuideController()); return const TestingGuidePage(); },
            ),
          ],
        ),

        // Search
        GoRoute(
          onExit: (context, state) {
            Get.delete<GlobalSearchController>();
            return true;
          },
          path: AppPath.SEARCH,
          builder: (context, state) {
            Get.put(GlobalSearchController());
            return const SearchPage();
          },
        ),

        // Progress
        GoRoute(
          onExit: (context, state) {
            Get.delete<ProgressController>();
            return true;
          },
          path: AppPath.PROGRESS,
          builder: (context, state) {
            Get.put(ProgressController());
            return const ProgressPage();
          },
        ),

        // Bookmarks
        GoRoute(
          onExit: (context, state) {
            Get.delete<BookmarksController>();
            return true;
          },
          path: AppPath.BOOKMARKS,
          builder: (context, state) {
            Get.put(BookmarksController());
            return const BookmarksPage();
          },
        ),
      ],
    ),
    GoRoute(
      path: '/blogs',
      builder: (context, state) {
        Get.put(HomeController());
        return const BlogListPage();
      },
    ),
    GoRoute(
      path: '/blogs/:id',
      name: 'blogDetails',
      builder: (context, state) {
        Get.put(BlogController());
        Get.put(ShuffledBlogController());
        final id = state.pathParameters['id']!;
        return BlogDetailsApiPage(blogId: id);
      },
    ),
  ];
}
