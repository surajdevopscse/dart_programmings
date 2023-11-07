import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../constants/colors.dart';

class PendingLeadCountTableView extends GetView {
  const PendingLeadCountTableView({Key? key}) : super(key: key);

  static const TextStyle _style = TextStyle(
      color: C.bluishGray300, fontWeight: FontWeight.w500, fontSize: 14);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text(
          'CP Pending Lead Count (Employee wise)',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: C.primaryText),
        ),
        const SizedBox(height: 16),
        //Header
        Container(
          height: 36,
          decoration: BoxDecoration(
              color: C.bluishGray50.withOpacity(0.3),
              border: Border.all(color: C.bluishGray50, width: 1)),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 8),
                  decoration: const BoxDecoration(
                    border: BorderDirectional(
                      end: BorderSide(width: 1, color: C.bluishGray50),
                    ),
                  ),
                  child: const Text(
                    'Employee Name',
                    style: _style,
                  ),
                ),
              ),
              const Expanded(
                  child: Padding(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  'Count',
                  style: _style,
                ),
              )),
            ],
          ),
        ),
        // Data
        Container(
          height: 108,
          decoration: const BoxDecoration(
              border: BorderDirectional(
            start: BorderSide(width: 1, color: C.bluishGray50),
            end: BorderSide(width: 1, color: C.bluishGray50),
            bottom: BorderSide(width: 1, color: C.bluishGray50),
          )),
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return Container(
                height: 36,
                color: index % 2 != 0
                    ? C.bluishGray50.withOpacity(0.2)
                    : Colors.transparent,
                child: const Row(
                  children: [
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        'Aditya Singh',
                        style: TextStyle(
                            color: C.bluishGray400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )),
                    Expanded(
                        child: Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Text(
                        '55',
                        style: TextStyle(
                            color: C.bluishGray400,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    )),
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
