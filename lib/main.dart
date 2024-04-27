import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dart_programing/app/common_widgets/footer.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';

import 'package:dart_programing/utils/theme/dark_theme.dart';
import 'package:dart_programing/utils/theme/light_theme.dart';

import 'app/views/side_menu/side_menu_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AdaptiveThemeMode?>(
      future: AdaptiveTheme.getThemeMode(),
      builder: (context, snapshot) {
        return AdaptiveTheme(
          light: AppLightTheme.data,
          dark: AppDarkTheme.data,
          debugShowFloatingThemeButton: true,
          initial: snapshot.data ?? AdaptiveThemeMode.system,
          builder: (theme, darkTheme) {
            return GetMaterialApp.router(
              debugShowCheckedModeBanner: false,
              initialBinding: BindingsBuilder.put(() => SideMenuController()),
              title: "Dart",
              routeInformationParser: AppPages.router.routeInformationParser,
              routeInformationProvider:
                  AppPages.router.routeInformationProvider,
              routerDelegate: AppPages.router.routerDelegate,
              backButtonDispatcher: AppPages.router.backButtonDispatcher,
              defaultTransition: Transition.noTransition,
              builder: (context, child) {
                return LayoutBuilder(builder: (context, constraints) {
                  final width = constraints.maxWidth;
                  final tempSideMenuWidth = width * (280 / 1728);
                  final sideMenuWidth = max(tempSideMenuWidth, 260).toDouble();

                  return Stack(
                    children: [
                      Positioned.fill(
                        left: sideMenuWidth,
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: width / 8,
                            right: width / 8,
                          ),
                          child: child,
                        ),
                      ),
                      Positioned.directional(
                        textDirection: TextDirection.ltr,
                        top: 0,
                        bottom: 0,
                        start: 0,
                        width: sideMenuWidth,
                        child: const SideMenuView(),
                      ),
                      Positioned(
                        bottom: 0,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: const AppFooter(),
                        ),
                      ),
                    ],
                  );
                });
              },
            );
          },
        );
      },
    );
  }
}
