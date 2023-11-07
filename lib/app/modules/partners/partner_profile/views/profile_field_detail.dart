import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';

class ProfileFieldDetail extends StatelessWidget {
  final String fieldName;
  final String data;
  final bool isRequired;
  const ProfileFieldDetail(
      {required this.fieldName,
      required this.data,
      this.isRequired = false,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Text(
                fieldName,
                style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: C.seconderyText),
              ),
              if (isRequired)
                const Text(
                  '*',
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: C.error),
                )
            ],
          ),
          // const SizedBox(height: 8),
          Text(
            data,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: C.primaryText),
          ),
        ],
      ),
    );
  }
}
