import 'package:flutter/material.dart';

class CommonHeight extends StatelessWidget {
  final double height;

  const CommonHeight({super.key, this.height = 20.0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
