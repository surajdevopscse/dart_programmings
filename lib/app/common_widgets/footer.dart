import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/modules/home/controllers/home_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:get/get.dart';

class AppFooter extends GetView<HomeController> {
  const AppFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Footer(
      backgroundColor: AppColors.primary700,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FittedBox(
            child: Text.rich(
              TextSpan(
                style: AppStyle.globalSmallTextStyle.copyWith(
                  color: AppColors.baseWhite,
                ),
                text: 'Copyright © ',
                children: <InlineSpan>[
                  TextSpan(
                    text: 'Learn Dart Programming',
                    style: AppStyle.globalSmallTextStyle.copyWith(
                      color: AppColors.baseWhite,
                    ),
                  ),
                  TextSpan(
                    text:
                        ' ${DateTime.now().year.toString()} All Right Reserved',
                    style: AppStyle.globalSmallTextStyle.copyWith(
                      color: AppColors.baseWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SmallText(
            text: 'Developed With ❤️ by Flutter',
            style: AppStyle.globalSmallTextStyle.copyWith(
              color: AppColors.baseWhite,
            ),
          ),
        ],
      ),
    );
  }
}
