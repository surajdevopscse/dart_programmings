import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/common_widgets/code_widget.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/project_structure_controller.dart';

class ProjectStructurePage extends GetView<ProjectStructureController> {
  const ProjectStructurePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Project Structure'),
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
                                text: 'Project Structure',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/project-structure', pageTitle: 'Project Structure'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'Recommended Folder Structure',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'A well-organized Flutter project separates concerns and makes navigation intuitive. Follow feature-first or layer-first organization depending on project size.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""lib/
  app/          # App-wide config, routes, themes
  modules/      # Feature modules (each with controller, page, model)
  services/     # Shared services (API, storage, auth)
  utils/        # Utilities, constants, helpers
  main.dart

# Feature module example:
modules/auth/
  controllers/
    auth_controller.dart
  pages/
    login_page.dart
    register_page.dart
  models/
    user_model.dart"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Naming Conventions',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use snake_case for file names, PascalCase for class names, camelCase for variables and functions, and SCREAMING_SNAKE_CASE for constants.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Files: snake_case
user_profile_page.dart
auth_controller.dart

// Classes: PascalCase
class UserProfilePage extends GetView<UserController> {}

// Variables: camelCase
final userName = "Alice";
bool isLoggedIn = false;

// Constants: SCREAMING_SNAKE_CASE
const API_BASE_URL = "https://api.example.com";
const MAX_RETRY_COUNT = 3;"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Separation of Concerns',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Keep UI in pages/widgets, business logic in controllers, and data operations in repositories/services. Pages should not contain API calls or complex logic.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// BAD: Logic in widget
class UserPage extends StatelessWidget {
  Future<void> fetchUser() async {
    final response = await http.get(url); // NO!
    // ...
  }
}

// GOOD: Logic in controller
class UserController extends GetxController {
  var user = Rxn<User>();
  Future<void> fetchUser() async {
    user.value = await userRepository.getUser();
  }
}

class UserPage extends GetView<UserController> {
  // Only UI here
}"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<ProjectStructureController>(
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
