import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBarController extends GetxController {
  String _appBarTitle = 'Learn More';
  String get appBarTitle => _appBarTitle;
  set appBarTitle(String value) {
    _appBarTitle = value;
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        update();
      },
    );
  }
}
