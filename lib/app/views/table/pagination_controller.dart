import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class PaginationController extends GetxController {
  final searchController = TextEditingController();
  final scrollController = ScrollController();
  final searchFocusNode = FocusNode();

  bool isPaginating = false;
  String prevQuery = '';

  int totalItems = 0;
  int currentPage = 0;
  int currentPageLength = 0;
  int limit = 20;

  bool isMobile = false;

  @override
  void onInit() {
    scrollController.addListener(() async {
      double maxScroll = scrollController.position.maxScrollExtent;
      double currentScroll = scrollController.position.pixels;
      double delta = 120;
      if (maxScroll - currentScroll <= delta) {
        if (!isPaginating && totalItems > currentPageLength) {
          isPaginating = true;

          await onPageChange(currentPage + 1);

          isPaginating = false;

          update();
        }
      }
    });
    super.onInit();
  }

  void onRowTap(int index) {}

  onPageChange(int page) async {
    currentPage = page;
    await reloadData();
  }

  reloadData() async {
    currentPage = (searchController.text == prevQuery) ? currentPage : 0;

    if (isMobile) {
      currentPage = isPaginating ? currentPage : 0;
    }

    prevQuery = searchController.text;
  }
}
