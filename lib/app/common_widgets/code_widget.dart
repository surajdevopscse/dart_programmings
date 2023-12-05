import 'package:flutter/material.dart';
import 'package:flutter_highlight/flutter_highlight.dart';
import 'package:flutter_highlight/themes/github.dart';

class CodeWidget extends StatelessWidget {
  final String code;
  const CodeWidget({super.key, required this.code});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: HighlightView(
          code,
          language: 'dart',
          theme: githubTheme,
          padding: const EdgeInsets.all(12),
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
