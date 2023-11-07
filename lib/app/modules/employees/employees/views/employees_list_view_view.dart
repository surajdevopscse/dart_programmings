import 'package:flutter/material.dart';

import 'package:get/get.dart';

class EmployeesListViewView extends GetView {
  const EmployeesListViewView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EmployeesListViewView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'EmployeesListViewView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
