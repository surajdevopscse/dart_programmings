import 'package:flutter/material.dart';

import 'package:get/get.dart';

class SelectLicenceKeyDialog extends GetView {
  const SelectLicenceKeyDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SelectLicenceKeyPopupView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SelectLicenceKeyPopupView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
