import 'dart:math';

import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/footer.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/responsive.dart';
import 'package:dart_programing/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';

import 'package:url_strategy/url_strategy.dart';

import 'app/views/side_menu/side_menu_view.dart';
import 'modules/home/controllers/app_bar_controller.dart';
import 'modules/home/widgets/app_bar.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppBarController());
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder.put(() => SideMenuController()),
      title: "Dart",
      routeInformationParser: AppPages.router.routeInformationParser,
      routeInformationProvider: AppPages.router.routeInformationProvider,
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
            return true;
          },
          builder: (context, _) {
            return LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth.toInt();
                final tempSideMenuWidth = width * (280 / 1728);
                final sideMenuWidth = max(tempSideMenuWidth, 150).toInt();
                return DartIntroduction(
                  width: width,
                  sideMenuWidth: sideMenuWidth,
                  child: child ?? const SizedBox.shrink(),
                );
              },
            );
          },
        );
      },
    );
  }
}

class DartIntroduction extends StatelessWidget {
  final Widget child;
  final int width;
  final int sideMenuWidth;
  const DartIntroduction({
    super.key,
    required this.child,
    required this.width,
    required this.sideMenuWidth,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: const Drawer(
          child: SideMenuView(),
        ),
        appBar: AS.deviceScreenType.isMobile ? const MyAppBar() : null,
        body: Stack(
          children: [
            ResponsivePages(
              mobile: child,
              desktop: Row(
                children: [
                  Expanded(
                    flex: sideMenuWidth,
                    child: const SideMenuView(),
                  ),
                  Expanded(
                    flex: width - sideMenuWidth,
                    child: child,
                  )
                ],
              ),
              tablet: Row(
                children: [
                  Expanded(
                    flex: sideMenuWidth,
                    child: const SideMenuView(),
                  ),
                  Expanded(
                    flex: width - sideMenuWidth,
                    child: child,
                  )
                ],
              ),
            ),
            const Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: AppFooter(),
            ),
          ],
        ),
      ),
    );
  }
}
