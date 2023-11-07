import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:svg_flutter/svg.dart';
import '../../../../../constants/colors.dart';
// import '../../../../routes/app_pages.dart';
import '../../../../views/enum/side_menu_enum.dart';
import '../../../../views/side_menu/side_menu_controller.dart';
import '../../../../views/table/common_table_widget.dart';
import '../controllers/partners_controller.dart';

class PartnersPage extends GetView<PartnersController> {
  const PartnersPage({Key? key}) : super(key: key);
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
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Partners',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: C.primaryText,
                      ),
                    ),
                    Text(
                      'Admin | Partners',
                      style: TextStyle(
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
                      // final sideMenu = Get.find<SideMenuController>();
                      // sideMenu.selectedChild = SideNavBarChildEnum.addPartner;
                      // sideMenu.update();
                      // Get.toNamed(Routes.ADD_SUB_PARTNER);
                      Get.find<SideMenuController>().navigate(
                          parent: SideNavBarParentEnum.partners,
                          child: SideNavBarChildEnum.addPartner);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16),
                      backgroundColor: C.button,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    // icon: const Icon(Icons.add),
                    icon: SvgPicture.asset(I.icAdd),
                    label: const Text('Add Partner'))
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
                        hintText: ' Search',
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
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: C.primary50,
                          ),
                          child: SvgPicture.asset(I.icRowVertical)),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: C.border.withOpacity(0.7),
                        ),
                        child: SvgPicture.asset(I.icFourBox),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Flexible(
              child: HbDataTable(
                columnData: controller.partnerTable,
                currentPageIndex: 1,
                // frozeEndColumns: 1,
                // frozeStartColumns: 2,
                limit: 15,
                totalItems: controller.partnerTable.length,
                pageCount: 0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
