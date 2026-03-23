// Conditional export: non-web → real AdMob banner; web → SizedBox.shrink() stub.
export '_banner_ad_impl.dart' if (dart.library.html) '_banner_ad_stub.dart';
