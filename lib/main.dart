import 'dart:math';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/services/navigator_observer/custom_navigator_observer.dart';

import 'package:dart_programing/utils/theme/dark_theme.dart';
import 'package:dart_programing/utils/theme/light_theme.dart';

import 'app/routes/app_pages.dart';
import 'app/views/side_menu/side_menu_view.dart';
import 'services/settings/settings_service.dart';
import 'services/shared_preference_service/shared_preference_service.dart';
import 'services/webservice/webservice.dart';
import 'utils/constants/strings/strings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

Future<void> initServices() async {
  debugPrint('starting services ...');
  await Get.putAsync(() => SharedPreferenceService().init());
  await Get.putAsync(() => Webservice().init());
  await Get.putAsync(() => SettingsService().init());
  // Get.lazyPut(() => SideMenuController());
  Get.put(SideMenuController());
  debugPrint('All services started...');
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
          debugShowFloatingThemeButton: true, // <------ add this line
          initial: snapshot.data ?? AdaptiveThemeMode.system,
          builder: (theme, darkTheme) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final tempSideMenuWidth = width * (280 / 1728);
                final sideMenuWidth = max(tempSideMenuWidth, 150).toDouble();
                return Material(
                  color: AppColors.baseWhite,
                  child: Stack(
                    children: [
                      Positioned.fill(
                        left: sideMenuWidth,
                        child: GetMaterialApp(
                          debugShowCheckedModeBanner: false,
                          title: "Learn Dart Programming",
                          initialRoute: AppPages.INITIAL,
                          getPages: AppPages.routes,
                          translations: Strings(),
                          locale: const Locale('en', 'US'),
                          fallbackLocale: const Locale('en', 'US'),
                          theme: theme,
                          darkTheme: darkTheme,
                          navigatorObservers: [
                            CustomNavigatorObserver(),
                          ],
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
                    ],
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
