import 'dart:math';
import 'package:flutter/cupertino.dart';

import 'table_row_type_enum.dart';

class HbTableColumn {
  final String value;
  final String? absPath;
  final String? networkUrl;
  final String? assetPath;
  final bool showLogo;
  final HbDataTableRow type;
  final Color? color;
  final int? flex;
  final TextAlign? align;
  final Widget? widget;
  final Function()? onTap;
  late double width = 0;
  final FontWeight? fontWeight;

  HbTableColumn(
      {required this.value,
      required this.type,
      this.widget,
      this.color,
      this.align,
      this.showLogo = false,
      this.networkUrl,
      this.absPath,
      this.assetPath,
      this.onTap,
      this.fontWeight,
      this.flex}) {
    int length = value.length;

    if (value.contains('\n')) {
      List<String> parts = value.split('\n');

      length = parts.fold(
          0, (previousValue, element) => max(previousValue, element.length));
    }

    if (type == HbDataTableRow.action) {
      width = 100;
    } else if (type == HbDataTableRow.tag) {
      width = length * 16;
    } else {
      width = length * 14 * 1.2;
      if (showLogo) width += 40;
    }
  }
}
