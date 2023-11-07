import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectSilverLicenceKeyPopupView extends GetView {
  const SelectSilverLicenceKeyPopupView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectSilverLicenceKeyPopupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectSilverLicenceKeyPopupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
