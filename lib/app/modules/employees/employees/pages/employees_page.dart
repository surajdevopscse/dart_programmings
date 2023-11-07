import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/images.dart';
import '../../../../../constants/strings/string_keys.dart';

import '../../../../views/table/common_table_widget.dart';
import '../controllers/employees_controller.dart';
import '../dialogs/add_employee_dialog.dart';
import '../views/employee_grid_item_view.dart';

class EmployeesPage extends GetView<EmployeesController> {
  const EmployeesPage({Key? key, this.shouldShowAddEmployeeDialog = false})
      : super(key: key);

  final bool shouldShowAddEmployeeDialog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      SK.employees,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: C.primaryText,
                      ),
                    ),
                    Text(
                      SK.adminPartnersSubPartners,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: C.subTitleText,
                        letterSpacing: 1.28,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton.icon(
                    onPressed: () {
                      addEmployeeDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: C.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    icon: SvgPicture.asset(I.icAdd),
                    label: Text(SK.addEmployee))
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    color: Colors.transparent,
                    height: 40,
                    child: TextFormField(
                      decoration: InputDecoration(
                        filled: true,
                        suffixIcon: const Icon(Icons.search),
                        contentPadding: const EdgeInsets.all(8),
                        fillColor: C.bluishGray50.withOpacity(0.7),
                        hintText: ' ${SK.search}',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            controller.isGridView.value = false;
                            controller.update();
                          },
                          child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: !controller.isGridView.value
                                    ? C.primary50
                                    : C.bluishGray50.withOpacity(0.7),
                              ),
                              child: !controller.isGridView.value
                                  ? SvgPicture.asset(I.icRowVertical)
                                  : SvgPicture.asset(I.icRowVertical1)),
                        );
                      }),
                      const SizedBox(width: 8),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            controller.isGridView.value = true;
                            controller.update();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: controller.isGridView.value
                                  ? C.primary50
                                  : C.bluishGray50.withOpacity(0.7),
                            ),
                            child: controller.isGridView.value
                                ? SvgPicture.asset(I.icFourBoxActive)
                                : SvgPicture.asset(I.icFourBox),
                          ),
                        );
                      }),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: GetBuilder<EmployeesController>(
                  init: controller,
                  builder: (_) {
                    return Visibility(
                        visible: !controller.isGridView.value,
                        replacement: const EmployeeGridItemView(),
                        child: HbDataTable(
                          columnData: controller.employeeTable,
                          currentPageIndex: 1,
                          // frozeEndColumns: 1,
                          // frozeStartColumns: 2,
                          limit: 15,
                          totalItems: controller.employeeTable.length,
                          pageCount: 0,
                        ));
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
