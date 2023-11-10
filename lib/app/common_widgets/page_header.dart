import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  final String headerName;
  const PageHeader({super.key, this.headerName = 'Learn Dart Programming'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: BigText(
              style: AppStyle.globalBigTextStyle,
              text: headerName,
            ),
          ),
        ],
      ),
    );
  }
}
