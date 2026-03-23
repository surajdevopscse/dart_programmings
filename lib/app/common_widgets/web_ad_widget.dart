// Conditional export: web → AdSense HtmlElementView; non-web → SizedBox.shrink().
// dart.library.io is available on Android/iOS/desktop but NOT on web,
// so when it IS available we export the stub and on web we export the real impl.
export '_web_ad_impl.dart' if (dart.library.io) '_web_ad_stub.dart';
