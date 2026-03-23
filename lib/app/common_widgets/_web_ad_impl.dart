// Web-only AdSense implementation.
// Compiled only when dart.library.html is available (Flutter web target).
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/material.dart';

class WebAdWidget extends StatefulWidget {
  const WebAdWidget({super.key});

  @override
  State<WebAdWidget> createState() => _WebAdWidgetState();
}

class _WebAdWidgetState extends State<WebAdWidget> {
  // Each instance gets a unique view-type so Flutter's platform-view registry
  // does not complain about duplicate registrations.
  static int _counter = 0;
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _counter++;
    _viewType = 'adsense-slot-$_counter';

    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final container = html.DivElement()
        ..style.width = '100%'
        ..style.height = '90px'
        ..style.overflow = 'hidden';

      // AdSense <ins> element
      // Replace data-ad-client and data-ad-slot with your real values.
      final ins = html.Element.tag('ins')
        ..className = 'adsbygoogle'
        ..style.display = 'block'
        ..style.width = '100%'
        ..style.height = '90px'
        ..setAttribute('data-ad-client', 'ca-pub-REPLACE_WITH_YOUR_PUBLISHER_ID')
        ..setAttribute('data-ad-slot', 'REPLACE_WITH_YOUR_AD_SLOT_ID')
        ..setAttribute('data-ad-format', 'auto')
        ..setAttribute('data-full-width-responsive', 'true');

      container.append(ins);

      // Trigger AdSense to fill the slot after the element is in the DOM.
      final script = html.ScriptElement()
        ..text =
            '(adsbygoogle = window.adsbygoogle || []).push({});';
      container.append(script);

      return container;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: HtmlElementView(viewType: _viewType),
    );
  }
}
