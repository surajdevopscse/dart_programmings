import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:auto_size_text/auto_size_text.dart';

import '../../../constants/colors.dart';
import 'common_table_column.dart';

enum HbDataTableRow { name, text, amount, tag, action, avatar, number }

extension HbDataTableRowMapping on HbDataTableRow {
  Color get color {
    switch (this) {
      case HbDataTableRow.name:
        return C.bluishGray400;
      case HbDataTableRow.text:
      case HbDataTableRow.number:
        // return kGrey500;
        return Colors.grey;
      case HbDataTableRow.amount:
        // return kGrey500;
        return Colors.grey;
      case HbDataTableRow.tag:
        // return kSuccess500;
        return Colors.green;
      case HbDataTableRow.action:
        // return kPureBlack;
        return Colors.amber;
      case HbDataTableRow.avatar:
        // return kblue800;
        return Colors.blue;
    }
  }

  TextAlign get align {
    switch (this) {
      case HbDataTableRow.name:
      case HbDataTableRow.text:
      case HbDataTableRow.avatar:
        return TextAlign.left;
      case HbDataTableRow.amount:
        return TextAlign.right;
      case HbDataTableRow.tag:
      case HbDataTableRow.number:
      case HbDataTableRow.action:
        return TextAlign.center;
    }
  }

  Alignment get dataGridCellAlignment {
    switch (this) {
      case HbDataTableRow.name:
      case HbDataTableRow.text:
      case HbDataTableRow.tag:
      case HbDataTableRow.avatar:
        return Alignment.centerLeft;
      case HbDataTableRow.amount:
        return Alignment.centerRight;
      case HbDataTableRow.number:
      case HbDataTableRow.action:
        return Alignment.center;
    }
  }

  int get flex {
    switch (this) {
      case HbDataTableRow.name:
        return 3;
      case HbDataTableRow.text:
      case HbDataTableRow.avatar:
        return 2;
      case HbDataTableRow.amount:
        return 2;
      case HbDataTableRow.tag:
        return 1;
      case HbDataTableRow.number:
        return 2;
      case HbDataTableRow.action:
        return 1;
    }
  }

  GridColumn gridColumn(BuildContext context, String title, double width) {
    return GridColumn(
      columnName: title,
      label: Container(
        alignment: dataGridCellAlignment,
        padding: const EdgeInsets.fromLTRB(16, 0, 16.0, 0),
        child: AutoSizeText(
          title,
          maxLines: 1,
          style: const TextStyle(
              color: C.bluishGray300, fontWeight: FontWeight.w500),
        ),
      ),
      columnWidthMode: gridColumnWidthMode,
      width: width,
      allowEditing: false,
      allowFiltering: false,
      allowSorting: false,
    );
  }

  ColumnWidthMode get gridColumnWidthMode {
    switch (this) {
      case HbDataTableRow.name:
        return ColumnWidthMode.fill;
      case HbDataTableRow.text:
      case HbDataTableRow.amount:
      case HbDataTableRow.tag:
      case HbDataTableRow.action:
      case HbDataTableRow.avatar:
      case HbDataTableRow.number:
        return ColumnWidthMode.none;
    }
  }

  double get gridColumnMinimumWidth {
    // return ScreenSpecific(fallback: 80, desktop: 100);
    return 100;
  }

  double get gridColumnMaximumWidth {
    // return ScreenSpecific(fallback: 160, desktop: 300);
    return 300;
  }

  Widget generateWidget(HbTableColumn data, bool isFooter) {
    switch (this) {
      case HbDataTableRow.number:
      case HbDataTableRow.name:
      case HbDataTableRow.text:
      case HbDataTableRow.amount:
        return _TextWidget(
            text: data.value,
            textAlign: data.align ?? align,
            color: data.color ?? color,
            networkUrl: data.networkUrl,
            assetPath: data.assetPath,
            absPath: data.absPath,
            showLogo: data.showLogo,
            isFooter: isFooter,
            fontWeight: data.fontWeight,
            onTap: data.onTap);
      case HbDataTableRow.tag:
        return _TagWidget(
            text: data.value,
            textAlign: data.align ?? align,
            color: data.color ?? color,
            onTap: data.onTap);
      case HbDataTableRow.action:
        return data.widget ?? const SizedBox();
      case HbDataTableRow.avatar:
        break;
    }

    return const SizedBox();
  }
}

/// Text Widget
/// -
class _TextWidget extends StatelessWidget {
  const _TextWidget(
      {required this.text,
      required this.textAlign,
      required this.onTap,
      required this.color,
      this.absPath,
      this.fontWeight,
      this.networkUrl,
      this.assetPath,
      this.isFooter = false,
      this.showLogo = false});

  final String text;
  final TextAlign textAlign;
  final Color color;
  final FontWeight? fontWeight;
  final String? absPath;
  final String? networkUrl;
  final String? assetPath;
  final bool showLogo;
  final bool isFooter;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          if (showLogo)
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 8),
              child: Visibility(
                visible:
                    absPath != null || networkUrl != null || assetPath == null,
                replacement: (assetPath?.contains('.svg') ?? false)
                    ? SvgPicture.asset(
                        assetPath ?? '',
                        width: 16,
                        height: 16,
                      )
                    : Image.asset(
                        assetPath ?? '',
                        width: 20,
                        height: 20,
                      ),
                // child: BaseImage(
                //   tag: text,
                //   size: 32,
                //   networkUrl: networkUrl,
                //   absUrl: absPath,
                //   key: UniqueKey(),
                // ),
                child: const SizedBox.shrink(),
              ),
            ),
          Expanded(
            child: Text(
              text,
              textAlign: textAlign,
              style: TextStyle(
                color: color,
                fontSize: 14,
                // fontWeight: isFooter ? FontWeight.bold : FontWeight.normal,
                fontWeight: isFooter ? FontWeight.bold : fontWeight,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Tag Widget
/// -
class _TagWidget extends StatelessWidget {
  const _TagWidget({
    required this.text,
    required this.textAlign,
    required this.onTap,
    required this.color,
  });

  final String text;
  final TextAlign textAlign;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: SelectableText(
        text,
        style: TextStyle(color: color),
      ),
      backgroundColor: color.withOpacity(0.2),
    );
  }
}
