import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class SmallText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final TextStyle style;
  const SmallText({
    super.key,
    required this.text,
    required this.style,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      textAlign: textAlign,
      text,
      style: style,
    );
  }
}
