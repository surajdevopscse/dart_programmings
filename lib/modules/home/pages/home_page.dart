import 'package:dart_programing/app/common_widgets/big_text.dart';
import 'package:dart_programing/app/common_widgets/common_height.dart';
import 'package:dart_programing/app/common_widgets/small_text.dart';
import 'package:dart_programing/utils/app_constants.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/common_text_style/app_style.dart';
import 'package:dart_programing/utils/constants/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg_flutter.dart';
import '../controllers/home_controller.dart';
import '../widgets/home_page_widget.dart';
import '../../../app/common_widgets/page_header.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              const SliverAppBar(
                toolbarHeight: 60,
                automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 60,
                floating: false,
                pinned: true,
                flexibleSpace: PageHeader(),
                backgroundColor: C.primary50,
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 60.0.w,
                    right: 60.0.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CommonHeight(
                              height: 40,
                            ),
                            const Center(
                              child: HomePageWidget(),
                            ),
                            const CommonHeight(
                              height: 20,
                            ),
                            Center(
                              child: SvgPicture.asset(I.homeSvg),
                            ),
                            const CommonHeight(
                              height: 40,
                            ),
                            Center(
                              child: BigText(
                                text: AppConstant.dartWhy,
                                style: AppStyle.globalBigTextStyle
                                    .copyWith(fontSize: 28),
                              ),
                            ),
                            const CommonHeight(
                              height: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: controller.featureList
                                  .map(
                                    (point) => Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        BigText(
                                          text: point[0],
                                          style: AppStyle.globalBigTextStyle
                                              .copyWith(fontSize: 24),
                                        ),
                                        Wrap(
                                          children: [
                                            SmallText(
                                              textAlign: TextAlign.start,
                                              text: point[1],
                                              style: AppStyle
                                                  .globalSmallTextStyle
                                                  .copyWith(
                                                fontSize: 20,
                                                letterSpacing: 0,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const CommonHeight(),
                                      ],
                                    ),
                                  )
                                  .toList(),
                            ),
                            const CommonHeight(
                              height: 30,
                            ),
                            BigText(
                              text: AppConstant.summaryTitle,
                              style: AppStyle.globalBigTextStyle
                                  .copyWith(fontSize: 26),
                            ),
                            BigText(
                              text: AppConstant.summary,
                              style: AppStyle.globalSmallTextStyle
                                  .copyWith(fontSize: 20),
                            ),
                            const CommonHeight(
                              height: 30,
                            ),
                          ],
                        ),
                      ),
                      const CommonHeight(
                        height: 80,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  controller.scrollToTop();
                },
                child: const CircleAvatar(
                  radius: 25,
                  backgroundColor: AppColors.yellow,
                  child: Icon(
                    Icons.arrow_upward,
                    color: AppColors.primary700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
