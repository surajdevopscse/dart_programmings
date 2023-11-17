import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle globalSmallTextStyle = const TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.normal,
    color: AppColors.appTextColor,
    wordSpacing: 1,
    letterSpacing: 1,
    height: 1.8,
  );

  static TextStyle globalBigTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.appTextColor,
    wordSpacing: 1,
    letterSpacing: 1,
    height: 1.8,
  );
}
