import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        BigText(
          text: 'Dart Programming',
          style: AppStyle.globalBigTextStyle.copyWith(
            fontSize: 44,
          ),
        ),
        const CommonHeight(
          height: 20,
        ),
        SmallText(
          text:
              'This page provides a brief introduction to the Dart language through samples of its main features\n A solid understanding of Dart helps to build quality apps with flutter.\nStart your journey with this dart tutorial.',
          style: AppStyle.globalSmallTextStyle.copyWith(
            fontSize: 18,
            wordSpacing: 2,
            letterSpacing: 2,
          ),
        ),
        const CommonHeight(
          height: 40,
        ),
      ],
    );
  }
}
