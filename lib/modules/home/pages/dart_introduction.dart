import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/banner_ad_widget.dart';
import 'package:dart_programing/app/common_widgets/footer.dart';
import 'package:dart_programing/app/common_widgets/web_ad_widget.dart';
import 'package:dart_programing/app/responsive.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_view.dart';
import 'package:dart_programing/modules/home/widgets/app_bar.dart';
import 'package:flutter/material.dart';

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
        body: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
              child: ResponsivePages(
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
            ),
            // Mobile / tablet: AdMob banner (stub on web/desktop).
            // Web: AdSense slot (stub on mobile/desktop).
            // Desktop: both are stubs → no ads rendered.
            const SliverToBoxAdapter(child: BannerAdWidget()),
            // const SliverToBoxAdapter(child: WebAdWidget()),
            const SliverToBoxAdapter(child: AppFooter()),
          ],
        ),
      ),
    );
  }
}
