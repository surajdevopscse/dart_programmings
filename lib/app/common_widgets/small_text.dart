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
    return Text(
      textAlign: textAlign,
      text,
      style: style,
    );
  }
}
