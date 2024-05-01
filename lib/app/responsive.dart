import 'package:dart_programing/app/app_services.dart';
import 'package:flutter/material.dart';

class ResponsivePages extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;
  const ResponsivePages({
    Key? key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (AS.deviceScreenType.isDesktop) {
      return desktop;
    } else if (AS.deviceScreenType.isTablet) {
      return tablet;
    } else if (AS.deviceScreenType.isMobile) {
      return mobile;
    } else {
      return desktop;
    }
  }
}
