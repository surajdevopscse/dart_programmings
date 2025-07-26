import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension PlatformFunc on Platform {
  static bool get isDesktop =>
      Platform.isMacOS || Platform.isWindows || Platform.isLinux;
  static EdgeInsets desktopPortraitBodyPadding(BuildContext context) {
    return EdgeInsets.symmetric(
      horizontal: isDesktop ? MediaQuery.of(context).size.width * 0.3 : 0,
    );
  }
}

extension DateFormatting on DateTime {
  String toFormattedString({String format = 'dd MMM yyyy'}) {
    return DateFormat(format).format(this);
  }
}

extension StringDateFormatting on String {
  String toFormattedDate({String format = 'dd MMM yyyy'}) {
    try {
      final dt = DateTime.parse(this);
      return DateFormat(format).format(dt);
    } catch (e) {
      return this;
    }
  }
}
