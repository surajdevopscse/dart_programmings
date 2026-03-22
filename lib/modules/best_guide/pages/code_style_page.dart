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
import '../controllers/code_style_controller.dart';

class CodeStylePage extends GetView<CodeStyleController> {
  const CodeStylePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Code Style'),
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
                                text: 'Code Style',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/code-style', pageTitle: 'Code Style'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'Dart Formatting',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use dart format (or flutter format) to auto-format code. Enable format on save in your IDE. Follow the official Dart style guide.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Run formatter
// dart format lib/
// flutter format .

// analysis_options.yaml
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    - always_declare_return_types
    - avoid_print
    - prefer_const_constructors
    - prefer_const_literals_to_create_immutables
    - sort_child_properties_last
    - use_key_in_widget_constructors"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Effective Dart Guidelines',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Follow Effective Dart: use lowerCamelCase for variables/functions, UpperCamelCase for types, prefer final over var, avoid dynamic, use trailing commas for multi-line parameters.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// Prefer final
final name = "Alice";  // GOOD
var name2 = "Bob";     // OK if reassigned later

// Use trailing commas for multi-line
Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(16.0), // trailing comma!
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Hello"),
        const Text("World"),
      ], // trailing comma in list
    ),
  );
}

// Avoid dynamic
void process(dynamic data) {} // BAD
void process(Object data) {}  // GOOD"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Documentation Comments',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Use triple-slash (///) for public API docs. Document all public classes, methods, and properties. Keep comments focused on why, not what.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""/// A service for managing user authentication state.
///
/// Call [signIn] to authenticate and [signOut] to log out.
/// Use [isAuthenticated] to check the current state.
class AuthService extends GetxService {
  /// Whether the user is currently signed in.
  var isAuthenticated = false.obs;

  /// Signs in with the given [email] and [password].
  ///
  /// Throws [AuthException] if credentials are invalid.
  Future<void> signIn(String email, String password) async {
    // implementation
  }
}"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<CodeStyleController>(
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
