// Web / desktop stub — all methods are no-ops so the rest of the app
// can call AdService without platform-guarding every call site.
import 'package:get/get.dart';

class AdService extends GetxService {
  static bool get isSupported => false;

  @override
  void onInit() {
    super.onInit();
    // No-op: ads are not supported on web/desktop.
  }

  Future<void> loadInterstitialAd() async {}

  Future<void> showInterstitialAd() async {}

  Future<void> loadRewardedAd() async {}

  Future<void> showRewardedAd({
    required void Function(dynamic ad, dynamic reward) onUserEarnedReward,
  }) async {}
}
