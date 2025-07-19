import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreationCompletedDialog extends GetView {
  final VoidCallbackAction onFirstBtnTapped;
  final VoidCallbackAction onSecondBtnTapped;

  const CreationCompletedDialog(
      {Key? key,
      required this.onFirstBtnTapped,
      required this.onSecondBtnTapped})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CreationCompletedDialog'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CreationCompletedDialog is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
