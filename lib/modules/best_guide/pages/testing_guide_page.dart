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
import '../controllers/testing_guide_controller.dart';

class TestingGuidePage extends GetView<TestingGuideController> {
  const TestingGuidePage({super.key});

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
                  flexibleSpace: PageHeader(headerName: 'Testing Guide'),
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
                                text: 'Testing Guide',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/testing-guide', pageTitle: 'Testing Guide'),
                          ],
                        ),
                        const CommonHeight(height: 20),
                        Text(
                          'Unit Tests',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Test individual functions, classes, and controllers in isolation. Use mockito or mocktail for mocking dependencies. Run with flutter test.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// pubspec.yaml dev_dependencies
// flutter_test: sdk: flutter
// mocktail: ^1.0.0

import "package:flutter_test/flutter_test.dart";
import "package:mocktail/mocktail.dart";

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("UserController", () {
    late UserController controller;
    late MockUserRepository mockRepo;

    setUp(() {
      mockRepo = MockUserRepository();
      controller = UserController(mockRepo);
    });

    test("fetchUser updates user state", () async {
      final user = User(id: "1", name: "Alice");
      when(() => mockRepo.getUser("1")).thenAnswer((_) async => user);

      await controller.fetchUser("1");

      expect(controller.user.value, equals(user));
    });
  });
}"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Widget Tests',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Test widget rendering, interactions, and state changes using WidgetTester. Use find to locate widgets and tester.tap/tester.enterText for interactions.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""testWidgets("Counter increments on tap", (tester) async {
  await tester.pumpWidget(
    const MaterialApp(home: CounterPage()),
  );

  // Verify initial state
  expect(find.text("0"), findsOneWidget);
  expect(find.text("1"), findsNothing);

  // Tap the button
  await tester.tap(find.byIcon(Icons.add));
  await tester.pump(); // trigger rebuild

  // Verify new state
  expect(find.text("0"), findsNothing);
  expect(find.text("1"), findsOneWidget);
});"""),

                        const CommonHeight(height: 20),
                        Text(
                          'Integration Tests',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const CommonHeight(height: 8),
                        SmallText(text: 'Test complete user flows end-to-end using integration_test package. These run on a real device or emulator.'),
                        const CommonHeight(height: 8),
                        CodeWidget(code: r"""// integration_test/app_test.dart
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import "package:my_app/main.dart" as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("Full login flow", (tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Enter credentials
    await tester.enterText(find.byKey(Key("email")), "user@test.com");
    await tester.enterText(find.byKey(Key("password")), "pass123");

    // Submit
    await tester.tap(find.byKey(Key("loginButton")));
    await tester.pumpAndSettle();

    // Verify home page loaded
    expect(find.text("Welcome"), findsOneWidget);
  });
}"""),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<TestingGuideController>(
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
