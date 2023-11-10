// ignore_for_file: non_constant_identifier_names

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum DeviceScreenType {
  unidentified(null),
  desktop(6000),
  tablet(800),
  mobile(500);

  final double? thresholdWidth;
  const DeviceScreenType(this.thresholdWidth);
  bool get isUnidentified => this == DeviceScreenType.unidentified;
  bool get isDesktop => this == DeviceScreenType.desktop;
  bool get isMobile => this == DeviceScreenType.mobile;
  bool get isTablet => this == DeviceScreenType.tablet;
  static DeviceScreenType fromSize(Size size) {
    if (size.isMobile) {
      return DeviceScreenType.mobile;
    } else if (size.isTablet) {
      return DeviceScreenType.tablet;
    } else {
      return DeviceScreenType.desktop;
    }
  }
}

class Responsive<T> extends StatelessWidget {
  final Widget mobile;
  final Widget? mobileLarge;
  final Widget? tablet;
  final Widget desktop;

  const Responsive({
    required this.mobile,
    required this.desktop,
    this.tablet,
    Key? key,
    this.mobileLarge,
  }) : super(key: key);

  static bool isMobile() => Get.size.isMobile;

  static bool isTablet() => Get.size.isTablet;

  static bool isDesktop() => Get.size.isDesktop;

  @override
  Widget build(BuildContext context) {
    if (Get.size.isDesktop) {
      return desktop;
    } else if (Get.size.isTablet && tablet != null) {
      return tablet!;
    } else if (Get.size.isMobile && mobileLarge != null) {
      return mobileLarge!;
    } else {
      return mobile;
    }
  }
}

T ScreenSpecific<T>({
  required T fallback,
  T? fullScreenDesktop,
  T? desktop,
  T? tablet,
  T? mobile,
}) {
  if (Get.size.isDesktop && desktop != null) {
    return desktop;
  } else if (Get.size.isTablet && tablet != null) {
    return tablet;
  } else if (mobile != null) {
    return mobile;
  } else {
    return fallback;
  }
}

extension _SizeFunctions on Size {
  bool get isMobile {
    if (kIsWeb) {
      return width <= (DeviceScreenType.mobile.thresholdWidth ?? 0);
    } else {
      return true;
    }
  }

  bool get isTablet {
    if (kIsWeb) {
      return !isMobile &&
          width <= (DeviceScreenType.tablet.thresholdWidth ?? 0);
    } else {
      return false;
    }
  }

  bool get isDesktop {
    if (kIsWeb) {
      return !isMobile &&
          !isTablet &&
          width <= (DeviceScreenType.desktop.thresholdWidth ?? 0);
    } else {
      return false;
    }
  }
}
