import 'package:flutter/material.dart';

class CommonWidth extends StatelessWidget {
  final double width;
  const CommonWidth({super.key, this.width = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
