import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const BigText({
    super.key,
    required this.text,
    required this.style,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
