import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AssignLeadDialog extends GetView {
  const AssignLeadDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AssignLeadView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AssignLeadView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
