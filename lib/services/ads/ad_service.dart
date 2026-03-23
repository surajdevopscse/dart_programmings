// Conditional export: non-web platforms get the real AdMob implementation;
// web gets a no-op stub so google_mobile_ads (which uses dart:io) is never
// imported on web.
export '_ad_service_impl.dart' if (dart.library.html) '_ad_service_stub.dart';
