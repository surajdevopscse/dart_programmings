import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterGoRouterController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'GoRouter is Flutter\'s official declarative routing package. It supports deep linking, URL-based navigation (web), path parameters, query parameters, redirect, and nested navigation with ShellRoute.';
  String setupCode = '''// pubspec.yaml
// dependencies:
//   go_router: ^13.0.0

import 'package:go_router/go_router.dart';

// Define router
final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return DetailsPage(id: id);
      },
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => const ProfilePage(),
      routes: [
        GoRoute(
          path: 'edit',
          builder: (context, state) => const EditProfilePage(),
        ),
      ],
    ),
  ],
);

// In MaterialApp
MaterialApp.router(
  routerConfig: router,
)''';
  String routesCode = '''// Navigation with GoRouter
// Push (adds to history)
context.push('/details/42');

// Go (replaces current — no back button for web)
context.go('/home');

// Pop
context.pop();

// Named routes (type-safe navigation)
GoRoute(
  path: '/user/:id',
  name: 'user',
  builder: (context, state) {
    final userId = state.pathParameters['id']!;
    return UserPage(userId: userId);
  },
)

// Navigate to named route
context.goNamed('user', pathParameters: {'id': '123'});

// With query parameters
context.go('/search?q=flutter&page=1');

// Read query params in builder
GoRoute(
  path: '/search',
  builder: (context, state) {
    final query = state.uri.queryParameters['q'] ?? '';
    final page = int.tryParse(state.uri.queryParameters['page'] ?? '1') ?? 1;
    return SearchPage(query: query, page: page);
  },
)''';
  String pathParamsCode = '''// Path parameters
GoRoute(
  path: '/product/:productId/review/:reviewId',
  builder: (context, state) {
    final productId = state.pathParameters['productId']!;
    final reviewId = state.pathParameters['reviewId']!;
    return ReviewPage(productId: productId, reviewId: reviewId);
  },
)

// Extra data (non-URL data)
context.go('/details', extra: myObject);

GoRoute(
  path: '/details',
  builder: (context, state) {
    final data = state.extra as MyDataClass;
    return DetailsPage(data: data);
  },
)''';
  String shellRouteCode = '''// ShellRoute — persistent navigation shell (bottom nav, sidebar)
final router = GoRouter(
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScaffoldWithNav(child: child);
      },
      routes: [
        GoRoute(path: '/home', builder: (_, __) => const HomePage()),
        GoRoute(path: '/search', builder: (_, __) => const SearchPage()),
        GoRoute(path: '/profile', builder: (_, __) => const ProfilePage()),
      ],
    ),
  ],
);

// Redirect — authentication guard
final router = GoRouter(
  redirect: (context, state) {
    final isLoggedIn = authService.isAuthenticated;
    final isLoginPage = state.matchedLocation == '/login';
    if (!isLoggedIn && !isLoginPage) return '/login';
    if (isLoggedIn && isLoginPage) return '/home';
    return null;  // no redirect
  },
  routes: [...],
);''';
  List<String> tips = [
    'Use GoRouter.of(context).go() or context.go() for navigation',
    'GoRouter supports URL-based navigation and deep linking out of the box',
    'Use refreshListenable to re-evaluate redirects when auth state changes',
    'ShellRoute is perfect for persistent navigation elements like bottom nav bars',
    'errorBuilder allows you to show a custom 404 page',
    'Use GoRouterState to access current route parameters in any widget',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterGoRouter,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterGoRouter;
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
