import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class PreviousNextButton extends StatelessWidget {
  final Callback back;
  final Callback next;
  final bool isEnableBack;
  final bool isEnableNext;
  const PreviousNextButton(
      {super.key,
      required this.back,
      required this.next,
      this.isEnableBack = true,
      this.isEnableNext = true});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: isEnableBack ? back : null,
          child: Icon(
            Icons.arrow_back_ios,
            color:
                isEnableBack ? AppColors.primary700 : AppColors.bluishGray200,
            size: 24,
          ),
        ),
        GestureDetector(
          onTap: isEnableNext ? next : null,
          child: Icon(
            Icons.arrow_forward_ios,
            color:
                isEnableNext ? AppColors.primary700 : AppColors.bluishGray200,
            size: 24,
          ),
        ),
      ],
    );
  }
}
