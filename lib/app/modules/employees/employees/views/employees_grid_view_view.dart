import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EmployeesGridViewView extends GetView {
  const EmployeesGridViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeesGridViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeesGridViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
