import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../../constants/colors.dart';

class LeadAnalysisTableView extends GetView {
  const LeadAnalysisTableView({Key? key}) : super(key: key);

  Widget tableData(int index) {
    return const SizedBox(
      height: 36,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                '02-06-23',
                style: TextStyle(
                    color: C.primaryText,
                    fontWeight: FontWeight.w600,
                    fontSize: 12),
              ),
            ),
          ),
          TableCell(
            flex: 2,
            cell1: '-',
            cell2: '-',
          ),
          TableCell(
            flex: 3,
            cell1: '450',
            cell2: '50',
            cell3: '20%',
          ),
          TableCell(
            flex: 2,
            cell1: '50',
            cell2: '20%',
          ),
          TableCell(
            flex: 2,
            cell1: '50',
            cell2: '20%',
          ),
          TableCell(
            flex: 2,
            cell1: '50',
            cell2: '20%',
          ),
          TableCell(
            flex: 2,
            cell1: '50',
            cell2: '30%',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'Lead Analysis',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: C.primaryText),
        ),
        const SizedBox(height: 16),
        //Header
        Container(
          height: 72,
          decoration: BoxDecoration(
            // color: C.bgHeader,
            color: C.bluishGray50.withOpacity(0.3),
            border: const BorderDirectional(
              top: BorderSide(width: 1, color: C.bluishGray50),
              start: BorderSide(width: 1, color: C.bluishGray50),
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomLeft,
                  decoration: const BoxDecoration(
                      border: BorderDirectional(
                    end: BorderSide(width: 1, color: C.bluishGray50),
                  )),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Data',
                      style: TextStyle(
                          color: C.bluishGray300, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              const TableHeader(
                flex: 2,
                title: 'TGT vs Act',
                cell1: 'TGT',
                cell2: 'Act',
              ),
              const TableHeader(
                flex: 3,
                title: 'Leads',
                cell1: 'Total',
                cell2: 'Pending',
                cell3: 'Ach%',
              ),
              const TableHeader(
                flex: 2,
                title: 'Accepted',
                cell1: 'Count',
                cell2: '%',
              ),
              const TableHeader(
                flex: 2,
                title: 'Rejected',
                cell1: 'Count',
                cell2: '%',
              ),
              const TableHeader(
                flex: 2,
                title: 'Auto Rejected',
                cell1: 'Count',
                cell2: '%',
              ),
              const TableHeader(
                flex: 2,
                title: 'Follow-up',
                cell1: 'Count',
                cell2: '%',
              ),
            ],
          ),
        ),
        // Data
        Container(
          height: 108,
          decoration: BoxDecoration(
              border: Border.all(width: 1, color: C.bluishGray50)),
          child: ListView.builder(
            // physics: NeverScrollableScrollPhysics(),
            // shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => tableData(index),
          ),
        ),
      ],
    );
  }
}

class TableHeader extends StatelessWidget {
  final String title;
  final int flex;
  final String cell1;
  final String cell2;
  final String? cell3;
  const TableHeader({
    required this.title,
    required this.flex,
    required this.cell1,
    required this.cell2,
    this.cell3,
    super.key,
  });

  static const TextStyle _style =
      TextStyle(color: C.bluishGray300, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        height: double.maxFinite,
        decoration: const BoxDecoration(
            border: BorderDirectional(
          end: BorderSide(width: 1, color: C.bluishGray50),
        )),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.maxFinite,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                    border: BorderDirectional(
                  bottom: BorderSide(width: 1, color: C.bluishGray50),
                )),
                child: Text(
                  title,
                  style: _style,
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          border: BorderDirectional(
                        end: BorderSide(width: 1, color: C.bluishGray50),
                      )),
                      child: Text(
                        cell1,
                        style: _style,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        cell2,
                        style: _style,
                      ),
                    ),
                  ),
                  if (flex == 3)
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        decoration: const BoxDecoration(
                            border: BorderDirectional(
                          start: BorderSide(width: 1, color: C.bluishGray50),
                        )),
                        child: Text(
                          cell3 ?? '',
                          style: _style,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class TableCell extends StatelessWidget {
  final int flex;
  final String cell1;
  final String cell2;
  final String? cell3;
  const TableCell({
    required this.flex,
    required this.cell1,
    required this.cell2,
    this.cell3,
    super.key,
  });

  static const TextStyle _style = TextStyle(
      color: C.primaryText, fontWeight: FontWeight.w500, fontSize: 12);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        color: Colors.transparent,
        height: double.maxFinite,
        child: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8),
                      child: Text(
                        cell1,
                        style: _style,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      alignment: Alignment.center,
                      child: Text(
                        cell2,
                        style: _style,
                      ),
                    ),
                  ),
                  if (flex == 3)
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          cell3 ?? '',
                          style: _style,
                        ),
                      ),
                    ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
