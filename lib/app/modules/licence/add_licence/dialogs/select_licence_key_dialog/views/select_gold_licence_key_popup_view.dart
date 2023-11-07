import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectGoldLicenceKeyPopupView extends GetView {
  const SelectGoldLicenceKeyPopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectGoldLicenceKeyPopupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectGoldLicenceKeyPopupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
