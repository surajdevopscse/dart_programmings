import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';

class ComingSoonPage extends StatelessWidget {
  const ComingSoonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.timer,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'Coming Soon',
              style: AppStyle.globalBigTextStyle.copyWith(
                fontSize: 28,
                color: AppColors.yellow,
              ),
            ),
            Text(
              'Page is under development.',
              style: AppStyle.globalBigTextStyle.copyWith(
                fontSize: 20,
                color: AppColors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
