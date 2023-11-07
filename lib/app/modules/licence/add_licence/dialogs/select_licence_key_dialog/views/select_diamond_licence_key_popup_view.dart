import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectDiamondLicenceKeyPopupView extends GetView {
  const SelectDiamondLicenceKeyPopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectDiamondLicenceKeyPopupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectDiamondLicenceKeyPopupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
