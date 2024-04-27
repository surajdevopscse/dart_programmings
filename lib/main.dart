import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/footer.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';
import 'package:dart_programing/utils/extention.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';

import 'package:dart_programing/utils/theme/dark_theme.dart';
import 'package:dart_programing/utils/theme/light_theme.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app/views/side_menu/side_menu_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();
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
                return ScreenUtilInit(
                  minTextAdapt: true,
                  rebuildFactor: (old, data) {
                    final newSize = Size(
                      data.size.width - data.viewPadding.horizontal,
                      data.size.height - data.viewPadding.vertical,
                    );
                    final newScreenType = DeviceScreenType.fromSize(newSize);
                    if (AS.deviceScreenType.isUnidentified) {
                      AS.deviceScreenType = newScreenType;
                      return true;
                    }
                    if (AS.deviceScreenType != newScreenType) {
                      AS.deviceScreenType = newScreenType;
                      FocusScope.of(context).requestFocus(FocusNode());
                      return true;
                    }
                    return PlatformFunc.isDesktop;
                  },
                  builder: (context, _) {
                    return LayoutBuilder(builder: (context, constraints) {
                      final width = constraints.maxWidth.toInt();
                      final tempSideMenuWidth = width * (280 / 1728);
                      final sideMenuWidth = max(tempSideMenuWidth, 150).toInt();
                      return Column(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Expanded(
                                  flex: sideMenuWidth,
                                  child: const SideMenuView(),
                                ),
                                Expanded(
                                  flex: width - sideMenuWidth,
                                  child: child ?? const SizedBox.shrink(),
                                )
                              ],
                            ),
                          ),
                          const AppFooter(),
                        ],
                      );
                    });
                  },
                );
              },
            );
          },
        );
      },
    );
  }
}
