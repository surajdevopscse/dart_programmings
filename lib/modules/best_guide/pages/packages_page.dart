import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/bookmark_icon_btn.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controllers/packages_controller.dart';

class PackagesPage extends GetView<PackagesController> {
  const PackagesPage({super.key});

  static const List<_PackageGroup> _groups = [
    _PackageGroup(
      name: 'State Management',
      icon: Icons.storage,
      color: Colors.blue,
      packages: [
        _Package('get', 'GetX: state management, routing, and dependency injection in one package'),
        _Package('provider', 'Lightweight InheritedWidget wrapper by the Flutter team'),
        _Package('flutter_bloc', 'BLoC pattern implementation with Cubit support'),
        _Package('riverpod', 'Improved provider with compile-time safety and no context needed'),
      ],
    ),
    _PackageGroup(
      name: 'Networking',
      icon: Icons.wifi,
      color: Colors.teal,
      packages: [
        _Package('dio', 'Powerful HTTP client with interceptors, FormData, and request cancellation'),
        _Package('http', 'Official Dart HTTP package — simple and lightweight'),
        _Package('retrofit', 'Type-safe HTTP client generator using dio and build_runner'),
        _Package('web_socket_channel', 'WebSocket support for real-time communication'),
      ],
    ),
    _PackageGroup(
      name: 'Local Storage',
      icon: Icons.save,
      color: Colors.orange,
      packages: [
        _Package('shared_preferences', 'Key-value storage backed by NSUserDefaults / SharedPreferences'),
        _Package('hive', 'Fast, lightweight NoSQL database for Flutter and Dart'),
        _Package('sqflite', 'SQLite plugin for structured relational data'),
        _Package('isar', 'High-performance NoSQL database with full-text search and ACID transactions'),
      ],
    ),
    _PackageGroup(
      name: 'UI & Styling',
      icon: Icons.palette,
      color: Colors.purple,
      packages: [
        _Package('flutter_screenutil', 'Screen adaptation for different sizes using .w/.h/.sp'),
        _Package('google_fonts', 'Easy access to all Google Fonts in Flutter'),
        _Package('lottie', 'Render Adobe After Effects animations natively'),
        _Package('shimmer', 'Shimmer effect for loading placeholders'),
        _Package('cached_network_image', 'Network image caching with placeholder and error widgets'),
      ],
    ),
    _PackageGroup(
      name: 'Navigation',
      icon: Icons.navigation,
      color: Colors.indigo,
      packages: [
        _Package('go_router', 'Declarative routing package officially supported by Flutter team'),
        _Package('auto_route', 'Code-generation based routing with deep linking support'),
      ],
    ),
    _PackageGroup(
      name: 'Code Generation',
      icon: Icons.build,
      color: Colors.brown,
      packages: [
        _Package('freezed', 'Code generator for immutable classes, union types, and pattern matching'),
        _Package('json_serializable', 'Generates fromJson/toJson code for model classes'),
        _Package('build_runner', 'Build system for running code generators'),
        _Package('hive_generator', 'Generates Hive type adapters automatically'),
      ],
    ),
    _PackageGroup(
      name: 'Testing',
      icon: Icons.bug_report,
      color: Colors.pink,
      packages: [
        _Package('flutter_test', 'Official Flutter testing framework (built-in)'),
        _Package('integration_test', 'End-to-end integration testing on real devices'),
        _Package('mocktail', 'Mock objects for Dart testing without code generation'),
        _Package('golden_toolkit', 'Golden file testing for pixel-perfect UI tests'),
      ],
    ),
    _PackageGroup(
      name: 'Firebase',
      icon: Icons.cloud,
      color: Colors.amber,
      packages: [
        _Package('firebase_core', 'Required core package for all Firebase plugins'),
        _Package('firebase_auth', 'Authentication with email, Google, Apple, and more'),
        _Package('cloud_firestore', 'Scalable NoSQL cloud database with real-time updates'),
        _Package('firebase_storage', 'Store and serve user-generated content like images'),
        _Package('firebase_messaging', 'Push notifications via Firebase Cloud Messaging'),
      ],
    ),
  ];

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
                  flexibleSpace: PageHeader(headerName: 'Useful Packages'),
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
                                text: 'Useful Packages',
                                style: AppStyle.globalBigTextStyle.copyWith(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            BookmarkIconBtn(routePath: '/best-guide/useful-packages', pageTitle: 'Useful Packages'),
                          ],
                        ),
                        const CommonHeight(height: 8),
                        SmallText(
                          text: 'Essential pub.dev packages to accelerate your Flutter development.',
                        ),
                        const CommonHeight(height: 24),
                        ..._groups.map((group) => _PackageGroupSection(group: group)),
                        const CommonHeight(height: 40),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          GetBuilder<PackagesController>(
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

class _Package {
  final String name;
  final String description;
  const _Package(this.name, this.description);
}

class _PackageGroup {
  final String name;
  final IconData icon;
  final Color color;
  final List<_Package> packages;
  const _PackageGroup({
    required this.name,
    required this.icon,
    required this.color,
    required this.packages,
  });
}

class _PackageGroupSection extends StatelessWidget {
  final _PackageGroup group;

  const _PackageGroupSection({required this.group});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(group.icon, color: group.color, size: 20),
            const SizedBox(width: 8),
            Text(
              group.name,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: group.color,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...group.packages.map((pkg) => Card(
          margin: const EdgeInsets.only(bottom: 8),
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: group.color.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: group.color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    pkg.name,
                    style: TextStyle(
                      color: group.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      fontFamily: 'monospace',
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    pkg.description,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        )),
        const CommonHeight(height: 20),
      ],
    );
  }
}
