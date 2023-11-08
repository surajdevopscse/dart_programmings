import 'package:dart_programing/app/modules/control_flow/employees/controllers/control_flow_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeesPage extends GetView<ControlFlowController> {
  const EmployeesPage({Key? key, this.shouldShowAddEmployeeDialog = false})
      : super(key: key);

  final bool shouldShowAddEmployeeDialog;

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
