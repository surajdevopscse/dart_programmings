import 'package:dart_programing/app/common_widgets/page_header.dart';
import 'package:dart_programing/modules/introduction/controllers/install_dart_controller.dart';
import 'package:dart_programing/utils/constants/colors.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InstallDart extends GetView<InstallDartController> {
  const InstallDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: controller.scrollController,
            slivers: [
              SliverAppBar(
                toolbarHeight: 60,
                automaticallyImplyLeading: false,
                elevation: 0,
                expandedHeight: 60,
                floating: false,
                pinned: true,
                flexibleSpace: PageHeader(
                  headerName: SK.installDart,
                ),
                backgroundColor: C.primary50,
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
