
import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/device_screen_type.dart';
import 'package:dart_programing/app/routes/app_pages.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';

import 'package:url_strategy/url_strategy.dart';

import 'modules/home/controllers/app_bar_controller.dart';


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
            return child ?? const SizedBox.shrink();
           
          },
        );
      },
    );
  }
}

