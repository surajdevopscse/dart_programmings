import 'dart:io';

import 'package:flutter/material.dart';

extension PlatformFunc on Platform {
  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  static EdgeInsets desktopPortraitBodyPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: isDesktop ? MediaQuery.of(context).size.width * 0.3 : 0,
    );
  }
}
