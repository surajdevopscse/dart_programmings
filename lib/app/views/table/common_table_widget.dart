import 'dart:math';

import 'package:flutter/material.dart';
import 'package:number_paginator/number_paginator.dart';
import 'package:dart_programing/app/views/table/pagination_controller.dart';
import 'package:dart_programing/app/views/table/table_row_type_enum.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings/string_keys.dart';
import 'common_table_column.dart';
import 'common_table_data_source.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class HbDataTable extends StatelessWidget {
  final Map<String, List<HbTableColumn>> columnData;
  final bool containsFooter;
  final int currentPageIndex;
  final PaginationController? controller;
  final int pageCount;
  final int totalItems;
  final int limit;
  final int frozeStartColumns;
  final int frozeEndColumns;
  final String? emptyMessage;
  final Function(int)? onPageChange;
  final Function(int)? onRowTap;
  final Color Function(int)? onRowColor;

  const HbDataTable(
      {super.key,
      required this.columnData,
      required this.currentPageIndex,
      required this.limit,
      required this.totalItems,
      this.onPageChange,
      this.controller,
      this.emptyMessage,
      this.onRowColor,
      this.containsFooter = false,
      this.frozeStartColumns = 0,
      this.frozeEndColumns = 0,
      this.onRowTap,
      required this.pageCount});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(child: _buildGridTableView(context)),
        // _buildGridTableView(context),
        // if (pageCount > 1) const Divider(),
        if (pageCount > 1)
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 8,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text:
                              "${SK.showing} ${currentPageIndex * limit + 1} - ${min((currentPageIndex + 1) * limit, totalItems)}",
                        ),
                        TextSpan(
                          text: " ${SK.of} $totalItems",
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 4,
                  child: NumberPaginator(
                    numberPages: pageCount,
                    initialPage: currentPageIndex,
                    config: NumberPaginatorUIConfig(
                        buttonSelectedBackgroundColor: C.primary600,
                        buttonUnselectedForegroundColor: C.bluishGray500,
                        buttonShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        mode: ContentDisplayMode.numbers),
                    onPageChange: onPageChange ?? controller?.onPageChange,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildGridTableView(BuildContext context) {
    if (columnData.isEmpty || columnData.values.first.isEmpty) {
      return const Text('No Data Found');
    }

    int length = columnData.values.first.length;

    double maxWidth = double.negativeInfinity;

    for (int i = 0; i < length; i++) {
      double width = 0;

      for (String key in columnData.keys) {
        HbDataTableRow type = columnData[key]![i].type;

        double cellWidth = max(key.length * 14, columnData[key]![i].width);

        if (cellWidth < type.gridColumnMinimumWidth) {
          cellWidth = type.gridColumnMinimumWidth;
        }

        if (cellWidth > type.gridColumnMaximumWidth) {
          cellWidth = type.gridColumnMaximumWidth;
        }

        width += cellWidth;
      }

      maxWidth = max(width, maxWidth);
    }

    return ClipRRect(
      borderRadius: const BorderRadius.vertical(
        top: Radius.circular(4),
      ),
      child: SfDataGridTheme(
        data: SfDataGridThemeData(
          // headerColor: C.bluishGray50.withOpacity(0.5),
          headerColor: C.bluishGray50,
          gridLineStrokeWidth: 0.5,
          gridLineColor: C.bluishGray50,
          // gridLineColor: C.bluishGray50.withOpacity(0.5),
          rowHoverColor: C.bluishGray50.withOpacity(0.5),
          selectionColor: C.bluishGray50.withOpacity(0.7),
          frozenPaneElevation: 0,
          frozenPaneLineColor: C.pureWhite,
          frozenPaneLineWidth: 0,
        ),
        child: SfDataGrid(
          key: UniqueKey(),
          controller: DataGridController(),
          source: CommonDataSource(
              containsFooter: containsFooter,
              onRowColor: onRowColor,
              columnData: columnData,
              totalItems: columnData.values.first.length),
          isScrollbarAlwaysShown: true,
          rowsPerPage: limit,
          allowFiltering: true,
          allowSorting: true,
          allowTriStateSorting: true,
          selectionMode: SelectionMode.singleDeselect,
          columnWidthMode: ColumnWidthMode.auto,
          headerGridLinesVisibility: GridLinesVisibility.both,
          gridLinesVisibility: GridLinesVisibility.horizontal,
          selectionManager: CommonTableRowSelection(
            onRowTap: onRowTap ?? controller?.onRowTap ?? (index) {},
          ),
          frozenColumnsCount: frozeStartColumns,
          footerFrozenColumnsCount: frozeEndColumns,
          footerHeight: 0,
          onQueryRowHeight: (details) {
            double height = 40;

            if (details.rowIndex == 0) {
              return height;
            }

            int index = details.rowIndex - 1;

            int maxLength = 0;

            for (String key in columnData.keys) {
              String value = columnData[key]![index].value;
              maxLength = max(value.length, maxLength);
            }

            int dividend = (maxLength / 20).ceil();

            if (dividend >= 3) {
              height = dividend * 14;
            }

            return height;
          },
          footer: const SizedBox.shrink(),
          columns: columnData.keys.map((e) {
            // double padding = drawerViewType == DrawerViewType.auto
            //     ? HomeDrawer.collapseWidth
            //     : HomeDrawer.expandedWidth;
            double padding = 20;

            padding += 20;

            double screenWidth = MediaQuery.of(context).size.width - padding;

            double width = columnData[e]!
                .reduce((value, element) =>
                    value.width > element.width ? value : element)
                .width;

            HbDataTableRow type = columnData[e]!.first.type;
            width = max(e.length * 14, width);
            if (width < type.gridColumnMinimumWidth) {
              width = type.gridColumnMinimumWidth;
            }
            if (width > type.gridColumnMaximumWidth) {
              width = type.gridColumnMaximumWidth;
            }

            if (maxWidth < screenWidth) {
              if (type.gridColumnWidthMode == ColumnWidthMode.fill) {
                width = double.nan;
              }
            }

            return type.gridColumn(context, e, width);
          }).toList(),
        ),
      ),
    );
  }
}
