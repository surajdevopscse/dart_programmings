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
import '../controllers/mistakes_controller.dart';

class MistakesPage extends GetView<MistakesController> {
  const MistakesPage({super.key});

  static final List<_Mistake> _mistakes = [
    _Mistake(
      title: 'Calling setState (or update) too broadly',
      dontDesc: 'Calling setState/update on a large widget rebuilds the entire tree unnecessarily.',
      dontCode: '// BAD\nclass MyWidget extends StatefulWidget {\n  @override\n  State<MyWidget> createState() => _MyWidgetState();\n}\nclass _MyWidgetState extends State<MyWidget> {\n  int counter = 0;\n  @override\n  Widget build(BuildContext context) {\n    return Column(children: [\n      ExpensiveList(), // rebuilds every time!\n      Text("\$counter"),\n      ElevatedButton(\n        onPressed: () => setState(() => counter++),\n        child: Text("Increment"),\n      ),\n    ]);\n  }\n}',
      doDesc: 'Scope rebuilds to only the widget that needs to change.',
      doCode: '// GOOD — only Text rebuilds\nclass MyWidget extends GetView<MyController> {\n  @override\n  Widget build(BuildContext context) {\n    return Column(children: [\n      const ExpensiveList(), // const, never rebuilds\n      Obx(() => Text("\${controller.counter}")),\n      ElevatedButton(\n        onPressed: controller.increment,\n        child: const Text("Increment"),\n      ),\n    ]);\n  }\n}',
    ),
    _Mistake(
      title: 'Not using const constructors',
      dontDesc: 'Missing const prevents Flutter from reusing widget instances, causing unnecessary rebuilds.',
      dontCode: '// BAD — rebuilds every time parent rebuilds\nColumn(\n  children: [\n    Text("Static text"),       // no const\n    Icon(Icons.home),          // no const\n    SizedBox(height: 16),      // no const\n    Padding(\n      padding: EdgeInsets.all(8.0), // no const\n      child: Text("More text"),\n    ),\n  ],\n)',
      doDesc: 'Use const wherever possible to help Flutter optimize the widget tree.',
      doCode: '// GOOD — Flutter can reuse these\nconst Column(\n  children: [\n    Text("Static text"),        // const\n    Icon(Icons.home),           // const\n    SizedBox(height: 16),       // const\n    Padding(\n      padding: EdgeInsets.all(8.0),\n      child: Text("More text"), // const\n    ),\n  ],\n)',
    ),
    _Mistake(
      title: 'Performing async work in build()',
      dontDesc: 'Calling async operations inside build() runs them on every rebuild, causing bugs and performance issues.',
      dontCode: '// BAD — fetches on every rebuild!\nWidget build(BuildContext context) {\n  fetchUserData(); // called every rebuild!\n  return Text("...");\n}',
      doDesc: 'Perform async work in controller\'s onInit, or use FutureBuilder/StreamBuilder.',
      doCode: '// GOOD — fetch once in onInit\nclass UserController extends GetxController {\n  var user = Rxn<User>();\n  @override\n  void onInit() {\n    super.onInit();\n    fetchUserData();\n  }\n  Future<void> fetchUserData() async {\n    user.value = await repository.getUser();\n  }\n}',
    ),
    _Mistake(
      title: 'Using dynamic instead of typed models',
      dontDesc: 'dynamic removes type safety, making bugs harder to catch and code harder to understand.',
      dontCode: '// BAD\nMap<String, dynamic> user = {"name": "Alice", "age": 30};\nprint(user["name"].toLowerCase()); // might fail at runtime\nprint(user["nonExistentKey"].length); // NPE at runtime',
      doDesc: 'Create typed model classes with fromJson/toJson for type safety.',
      doCode: '// GOOD\nclass User {\n  final String name;\n  final int age;\n  const User({required this.name, required this.age});\n\n  factory User.fromJson(Map<String, dynamic> json) => User(\n    name: json["name"] as String,\n    age: json["age"] as int,\n  );\n}\n\nfinal user = User(name: "Alice", age: 30);\nprint(user.name.toLowerCase()); // type-safe',
    ),
    _Mistake(
      title: 'Ignoring error handling in async operations',
      dontDesc: 'Unhandled Future errors crash the app or fail silently.',
      dontCode: '// BAD — no error handling\nFuture<void> loadData() async {\n  final data = await api.fetchData(); // can throw!\n  processData(data);\n}',
      doDesc: 'Always handle errors in async code. Show user-friendly error states.',
      doCode: '// GOOD\nvar error = RxString("");\nvar isLoading = false.obs;\n\nFuture<void> loadData() async {\n  isLoading.value = true;\n  error.value = "";\n  try {\n    final data = await api.fetchData();\n    processData(data);\n  } on NetworkException catch (e) {\n    error.value = "Network error: \${e.message}";\n  } catch (e) {\n    error.value = "Unexpected error occurred";\n  } finally {\n    isLoading.value = false;\n  }\n}',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isDesktop = !AS.deviceScreenType.isMobile;
    return Scaffold(
      backgroundColor: AppColors.baseWhite,
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              if (isDesktop)
                SliverAppBar(
                  toolbarHeight: 60,
                  automaticallyImplyLeading: false,
                  elevation: 0,
                  expandedHeight: 60,
                  floating: false,
                  pinned: true,
                  flexibleSpace: PageHeader(headerName: 'Common Mistakes'),
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
                                text: 'Common Mistakes',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/common-mistakes', pageTitle: 'Common Mistakes'),
                          ],
                        ),
                        const CommonHeight(height: 8),
                        SmallText(
                          text: 'Avoid these common pitfalls when building Flutter apps.',
                        ),
                        const CommonHeight(height: 24),
                        ..._mistakes.map((m) => _MistakeTile(
                          mistake: m,
                          isDesktop: isDesktop,
                        )),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<MistakesController>(
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

class _Mistake {
  final String title;
  final String dontDesc;
  final String dontCode;
  final String doDesc;
  final String doCode;

  const _Mistake({
    required this.title,
    required this.dontDesc,
    required this.dontCode,
    required this.doDesc,
    required this.doCode,
  });
}

class _MistakeTile extends StatelessWidget {
  final _Mistake mistake;
  final bool isDesktop;

  const _MistakeTile({required this.mistake, required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.lightbulb_outline, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    mistake.title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (isDesktop)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _DontCard(desc: mistake.dontDesc, code: mistake.dontCode)),
                  const SizedBox(width: 12),
                  Expanded(child: _DoCard(desc: mistake.doDesc, code: mistake.doCode)),
                ],
              )
            else ...[
              _DontCard(desc: mistake.dontDesc, code: mistake.dontCode),
              const SizedBox(height: 12),
              _DoCard(desc: mistake.doDesc, code: mistake.doCode),
            ],
          ],
        ),
      ),
    );
  }
}

class _DontCard extends StatelessWidget {
  final String desc;
  final String code;

  const _DontCard({required this.desc, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.red.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.red.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.close, color: Colors.red, size: 18),
                SizedBox(width: 6),
                Text('Don\'t', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(desc, style: const TextStyle(fontSize: 13, height: 1.5)),
          ),
          CodeWidget(code: code),
        ],
      ),
    );
  }
}

class _DoCard extends StatelessWidget {
  final String desc;
  final String code;

  const _DoCard({required this.desc, required this.code});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.green.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.green.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.green.withOpacity(0.1),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
            ),
            child: const Row(
              children: [
                Icon(Icons.check, color: Colors.green, size: 18),
                SizedBox(width: 6),
                Text('Do', style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text(desc, style: const TextStyle(fontSize: 13, height: 1.5)),
          ),
          CodeWidget(code: code),
        ],
      ),
    );
  }
}
