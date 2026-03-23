import 'package:dart_programing/utils/constants/colors.dart';
import 'package:flutter/material.dart';

/// A reusable scroll-to-top FAB. Wrap in GetBuilder to rebuild on state change.
/// Usage:
///   GetBuilder<MyController>(
///     builder: (_) => ScrollToTopFab(
///       show: controller.showBackToTopButton,
///       onPressed: controller.scrollToTop,
///     ),
///   )
class ScrollToTopFab extends StatelessWidget {
  final bool show;
  final VoidCallback onPressed;

  const ScrollToTopFab({
    super.key,
    required this.show,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    if (!show) return const SizedBox.shrink();
    return Positioned(
      bottom: 20,
      right: 20,
      child: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.primary700,
        onPressed: onPressed,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }
}
