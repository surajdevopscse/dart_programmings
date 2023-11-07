import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dart_programing/constants/colors.dart';
import 'package:dart_programing/constants/images.dart';
import 'package:dart_programing/constants/strings/string_keys.dart';
import 'package:svg_flutter/svg.dart';
import '../controllers/licence_controller.dart';
import '../dialogs/request_licence_key_dialog.dart';
import '../views/activated_licence_keys_list_view.dart';
import '../views/available_licence_keys_list_view.dart';
import '../views/request_status_licence_keys_list_view.dart';
import '../views/transferred_licence_keys_list_view.dart';

// import '../dialogs/validate_licence_key_dialog.dart';
// import '../dialogs/licence_details_dialog.dart';
// import '../dialogs/licence_keys_dialog.dart';

typedef LisenceKeysTables = List<Widget>;

class LicencePage extends GetView<LicenceController> {
  const LicencePage({Key? key}) : super(key: key);

  static const LisenceKeysTables lisenceKeysTables = [
    AvailableLicenceKeysListView(),
    ActivatedLicenceKeysListView(),
    RequestStatusLicenceKeysListView(),
    TransferredLicenceKeysListView(),
  ];
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
                      SK.licenseKeys,
                      style: const TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: C.primaryText,
                      ),
                    ),
                    Text(
                      SK.adminLicensesKeysSubPartners,
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
                    requestLicenseKeyDialog(context);

                    // validateLicenceKeyDialog(context);
                    // licenseDetailsDialog(context);
                    // licenceKeysDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: C.button,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  icon: SvgPicture.asset(I.icAdd),
                  label: Text(SK.requestLicenseKey),
                )
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
                      Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: C.bluishGray50.withOpacity(0.7)),
                          child: SvgPicture.asset(I.icFilter)),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            const _LicenceTablesRow(),
            const SizedBox(height: 16),
            Flexible(
              child: GetBuilder<LicenceController>(
                  init: controller,
                  builder: (_) {
                    return IndexedStack(
                        index: controller.selectedIndex.value,
                        children: lisenceKeysTables);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class _LicenceTablesRow extends GetView<LicenceController> {
  const _LicenceTablesRow();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // All Button
        Container(
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: C.bluishGray50),
            ),
          ),
          child: IntrinsicWidth(
            child: Row(
              children: List.generate(
                controller.buttonLabels.length,
                (index) => Obx(() {
                  return InkWell(
                    onTap: () {
                      controller.selectedIndex.value = index;
                      controller.update();
                    },
                    child: _HeaderButton(
                      text: controller.buttonLabels[index],
                      isSelected: controller.selectedIndex.value == index,
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  const _HeaderButton(
      {required this.text, required this.isSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, 1),
      child: Container(
        height: 32,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        constraints: const BoxConstraints(
          minWidth: 130,
        ),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
                color: isSelected ? C.primary600 : Colors.transparent),
          ),
        ),
        child: Text(
          text,
          style: isSelected
              ? const TextStyle(
                  color: C.primary600, fontWeight: FontWeight.w600)
              : const TextStyle(color: C.bluishGray200),
        ),
      ),
    );
  }
}
