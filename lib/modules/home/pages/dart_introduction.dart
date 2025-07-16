import 'package:dart_programing/app/app_services.dart';
import 'package:dart_programing/app/common_widgets/footer.dart';
import 'package:dart_programing/app/common_widgets/global_blog_cards_section.dart';
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
            const SliverToBoxAdapter(child: GlobalBlogCardsSection()),
            const SliverToBoxAdapter(child: AppFooter()),
          ],
        ),
      ),
    );
  }
}
