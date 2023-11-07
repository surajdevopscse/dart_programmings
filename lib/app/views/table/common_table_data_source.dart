import 'package:flutter/material.dart';
import 'package:dart_programing/app/views/table/table_row_type_enum.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../constants/colors.dart';
import 'common_table_column.dart';

class CommonTableRowSelection extends RowSelectionManager {
  CommonTableRowSelection({required this.onRowTap});

  final void Function(int index) onRowTap;

  @override
  void handleTap(RowColumnIndex rowColumnIndex) {
    super.handleTap(rowColumnIndex);
    onRowTap(rowColumnIndex.rowIndex);
  }
}

class CommonDataSource extends DataGridSource {
  CommonDataSource({
    required this.columnData,
    required this.totalItems,
    this.containsFooter = false,
    this.onRowColor,
  }) {
    _rowsData = List.generate(totalItems, (index) {
      return DataGridRow(
          cells: columnData.keys.map((header) {
        HbTableColumn data = columnData[header]!.elementAt(index);

        return DataGridCell<Widget>(
          columnName: header,
          value: IntrinsicWidth(
            child: Container(
              alignment: data.type.dataGridCellAlignment,
              padding: const EdgeInsets.fromLTRB(16, 0, 16.0, 0),
              child: data.type.generateWidget(
                  data, index == totalItems - 1 && containsFooter),
            ),
          ),
        );
      }).toList());
    });
  }

  final Map<String, List<HbTableColumn>> columnData;
  final int totalItems;
  final bool containsFooter;
  final Color Function(int)? onRowColor;

  List<DataGridRow> _rowsData = [];

  @override
  List<DataGridRow> get rows => _rowsData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final index = rows.indexOf(row);

    return DataGridRowAdapter(
      cells: row.getCells().map<Widget>((e) => e.value).toList(),
      color: onRowColor != null
          ? onRowColor!(index)
          : (index == totalItems - 1 && containsFooter)
              ? C.bluishGray400
              : (index % 2 != 0)
                  ? C.bluishGray50.withOpacity(0.3)
                  : null,
    );
  }
}
