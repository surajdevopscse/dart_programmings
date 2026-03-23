// Mobile implementation — imported only on Android / iOS (non-web).
// Desktop (Windows/Linux/macOS) is also non-web but isSupported returns false
// at runtime, so MobileAds is never initialised there.
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdService extends GetxService {
  // ── Supported platforms ────────────────────────────────────────────────────
  static bool get isSupported =>
      !kIsWeb && (Platform.isAndroid || Platform.isIOS);

  // ── Internal ad objects ────────────────────────────────────────────────────
  InterstitialAd? _interstitialAd;
  RewardedAd? _rewardedAd;

  // ── Test ad unit IDs (Google's official test IDs) ─────────────────────────
  // Replace the right-hand values with your real IDs before publishing.
  static const String _androidBanner = 'ca-app-pub-3940256099942544/6300978111';
  static const String _iosBanner = 'ca-app-pub-3940256099942544/2934735716';
  static const String _androidInterstitial =
      'ca-app-pub-3940256099942544/1033173712';
  static const String _iosInterstitial =
      'ca-app-pub-3940256099942544/4411468910';
  static const String _androidRewarded =
      'ca-app-pub-3940256099942544/5224354917';
  static const String _iosRewarded = 'ca-app-pub-3940256099942544/1712485313';

  // ── Public ad unit ID getters ──────────────────────────────────────────────
  // In debug / profile mode the test IDs are used.
  // Swap the right-hand side of the release branch with your real IDs.
  String get bannerAdUnitId {
    if (kDebugMode || kProfileMode) {
      return Platform.isAndroid ? _androidBanner : _iosBanner;
    }
    // TODO: replace with real banner IDs for release build
    return Platform.isAndroid ? _androidBanner : _iosBanner;
  }

  String get interstitialAdUnitId {
    if (kDebugMode || kProfileMode) {
      return Platform.isAndroid ? _androidInterstitial : _iosInterstitial;
    }
    // TODO: replace with real interstitial IDs for release build
    return Platform.isAndroid ? _androidInterstitial : _iosInterstitial;
  }

  String get rewardedAdUnitId {
    if (kDebugMode || kProfileMode) {
      return Platform.isAndroid ? _androidRewarded : _iosRewarded;
    }
    // TODO: replace with real rewarded IDs for release build
    return Platform.isAndroid ? _androidRewarded : _iosRewarded;
  }

  // ── Lifecycle ──────────────────────────────────────────────────────────────
  @override
  void onInit() {
    super.onInit();
    if (!isSupported) return;
    MobileAds.instance.initialize();
    loadInterstitialAd();
  }

  @override
  void onClose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
    super.onClose();
  }

  // ── Banner ─────────────────────────────────────────────────────────────────
  /// Creates and starts loading a [BannerAd].
  /// Call [BannerAd.dispose] when the owning widget is disposed.
  BannerAd loadBannerAd({bool leaderboard = false}) {
    return BannerAd(
      adUnitId: bannerAdUnitId,
      size: leaderboard ? AdSize.leaderboard : AdSize.banner,
      request: const AdRequest(),
      listener: const BannerAdListener(),
    )..load();
  }

  // ── Interstitial ───────────────────────────────────────────────────────────
  Future<void> loadInterstitialAd() async {
    if (!isSupported) return;
    await InterstitialAd.load(
      adUnitId: interstitialAdUnitId,
      request: const AdRequest(),
      adLoadCallback: InterstitialAdLoadCallback(
        onAdLoaded: (ad) {
          _interstitialAd?.dispose();
          _interstitialAd = ad;
        },
        onAdFailedToLoad: (_) {},
      ),
    );
  }

  Future<void> showInterstitialAd() async {
    if (!isSupported || _interstitialAd == null) return;
    final ad = _interstitialAd!;
    _interstitialAd = null;
    ad.fullScreenContentCallback = FullScreenContentCallback(
      onAdDismissedFullScreenContent: (a) {
        a.dispose();
        loadInterstitialAd(); // preload the next one
      },
      onAdFailedToShowFullScreenContent: (a, _) {
        a.dispose();
        loadInterstitialAd();
      },
    );
    await ad.show();
  }

  // ── Rewarded ───────────────────────────────────────────────────────────────
  Future<void> loadRewardedAd() async {
    if (!isSupported) return;
    await RewardedAd.load(
      adUnitId: rewardedAdUnitId,
      request: const AdRequest(),
      rewardedAdLoadCallback: RewardedAdLoadCallback(
        onAdLoaded: (ad) {
          _rewardedAd?.dispose();
          _rewardedAd = ad;
        },
        onAdFailedToLoad: (_) {},
      ),
    );
  }

  Future<void> showRewardedAd({
    required void Function(AdWithoutView ad, RewardItem reward)
        onUserEarnedReward,
  }) async {
    if (!isSupported || _rewardedAd == null) return;
    final ad = _rewardedAd!;
    _rewardedAd = null;
    await ad.show(onUserEarnedReward: onUserEarnedReward);
  }

  // ── Dispose helper (alias) ─────────────────────────────────────────────────
  void dispose() {
    _interstitialAd?.dispose();
    _rewardedAd?.dispose();
  }
}
