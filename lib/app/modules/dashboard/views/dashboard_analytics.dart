import 'package:flutter/material.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../constants/colors.dart';

class DashboardAnalytics extends StatelessWidget {
  const DashboardAnalytics({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Row(
          children: [
            const Text(
              'Analytics',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: C.primaryText,
              ),
            ),
            const SizedBox(width: 8),
            CircleAvatar(
              child: SvgPicture.asset(
                I.icCandle,
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: C.button,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  dropdownColor: C.button,
                  isDense: true,
                  style: const TextStyle(color: C.pureWhite),
                  value: 'January 2023',
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: SvgPicture.asset(I.icArrowDown),
                  ),
                  onChanged: (String? newValue) {},
                  items: <String>['January 2023', 'March 2023', 'April 2023']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Row(
          children: [
            _CustomBox(color: C.blue50, text: 'Sales', num: '5670'),
            SizedBox(width: 16),
            _CustomBox(color: C.purple50, text: 'Earnings', num: '₹1,15,670'),
            SizedBox(width: 16),
            _CustomBox(color: C.error50, text: 'Leads', num: '670'),
            SizedBox(width: 16),
            _CustomBox(color: C.green50, text: 'Target Achieved', num: '15670'),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
class _CustomBox extends StatelessWidget {
  final Color color;
  final String text;
  final String num;

  const _CustomBox(
      {required this.color, required this.text, required this.num, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(12)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: C.primaryText),
            ),
            Text(
              num,
              style: const TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w600,
                  color: C.primaryText),
            ),
          ],
        ),
      ),
    );
  }
}
