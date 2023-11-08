import 'package:get/get.dart';

/// TODO : Remove from Here

enum AddSubPartnerView {
  addPersonalInfoSubPartnerView(i: 0, title: 'Personal Information'),
  addSubPartnerDetailsView(i: 1, title: 'Sub Partner Details'),
  addAddressInfoSubPartnerView(i: 2, title: 'Address Information'),
  addLoginCredSubPartnerView(i: 3, title: 'Login Credential');

  final int i;
  final String title;
  const AddSubPartnerView({required this.i, required this.title});
}

class AddSubPartnerController extends GetxController {
  final currentView =
      Rxn<AddSubPartnerView>(AddSubPartnerView.addPersonalInfoSubPartnerView);

  void moveToNextView() {
    if (currentView.value == null) return;

    final newValue = AddSubPartnerView.values
        .firstWhereOrNull((e) => (currentView.value!.i + 1) == e.i);

    currentView.value = newValue;
    update();
  }
}
