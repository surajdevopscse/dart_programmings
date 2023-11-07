import 'package:flutter/material.dart';
import 'package:dart_programing/constants/colors.dart';

class PageHeader extends StatelessWidget {
  final String headerName;
  const PageHeader({super.key, this.headerName = 'Learn Dart Programming'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 1,
            child: Text(
              headerName,
              style: const TextStyle(
                fontSize: 16,
                color: C.primaryText,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
