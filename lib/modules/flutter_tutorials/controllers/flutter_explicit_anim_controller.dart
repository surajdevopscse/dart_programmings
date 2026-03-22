import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterExplicitAnimController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Explicit animations give you full control over every aspect of an animation using AnimationController. You control when animations start, stop, reverse, and repeat. Use AnimatedBuilder or AnimatedWidget to integrate them with your UI.';
  String controllerCode = '''// Full explicit animation setup
class SpinningLogo extends StatefulWidget {
  const SpinningLogo({super.key});
  @override
  State<SpinningLogo> createState() => _SpinningLogoState();
}

class _SpinningLogoState extends State<SpinningLogo>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnim;
  late Animation<double> _scaleAnim;
  late Animation<Color?> _colorAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    // Multiple animations from one controller
    _rotationAnim = Tween<double>(begin: 0, end: 2 * 3.14159)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.linear));

    _scaleAnim = TweenSequence<double>([
      TweenSequenceItem(tween: Tween(begin: 1.0, end: 1.5), weight: 50),
      TweenSequenceItem(tween: Tween(begin: 1.5, end: 1.0), weight: 50),
    ]).animate(_controller);

    _colorAnim = ColorTween(begin: Colors.blue, end: Colors.purple)
        .animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: _rotationAnim.value,
              child: Transform.scale(
                scale: _scaleAnim.value,
                child: Icon(Icons.star, size: 80, color: _colorAnim.value),
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: _controller.forward, child: const Text('Play')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _controller.reverse, child: const Text('Reverse')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () => _controller.repeat(reverse: true), child: const Text('Loop')),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: _controller.stop, child: const Text('Stop')),
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}''';
  String animatedBuilderCode = '''// AnimatedBuilder — efficient rebuilds
// Only the builder child rebuilds, not the whole tree

class SlideInWidget extends StatefulWidget {
  final Widget child;
  const SlideInWidget({super.key, required this.child});
  @override
  State<SlideInWidget> createState() => _SlideInWidgetState();
}

class _SlideInWidgetState extends State<SlideInWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _slideAnim = Tween<Offset>(
      begin: const Offset(-1.0, 0.0),  // start offscreen left
      end: Offset.zero,                 // end at normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.forward();  // start animation immediately
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(  // uses Animation<Offset>
      position: _slideAnim,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}''';
  String curvedAnimCode = '''// CurvedAnimation — wraps an animation with a curve
final curved = CurvedAnimation(
  parent: _controller,       // the source animation (0.0 to 1.0)
  curve: Curves.bounceOut,   // apply easing to forward direction
  reverseCurve: Curves.easeIn, // optional: different curve when reversing
);

// Pre-built transition widgets that take Animation
FadeTransition(opacity: curved, child: myWidget)
ScaleTransition(scale: curved, child: myWidget)
RotationTransition(turns: curved, child: myWidget)
SlideTransition(position: offsetAnimation, child: myWidget)
SizeTransition(sizeFactor: curved, axis: Axis.vertical, child: myWidget)

// Common Curves reference:
// Curves.easeIn         — slow start, fast end
// Curves.easeOut        — fast start, slow end
// Curves.easeInOut      — slow start and end
// Curves.bounceOut      — bouncy ending
// Curves.elasticOut     — spring overshoot
// Curves.fastOutSlowIn  — Material Design default
// Curves.linear         — constant speed''';
  List<String> tips = [
    'AnimatedWidget is cleaner than AnimatedBuilder for reusable animated components',
    'Use addStatusListener on controller to react to animation completion',
    'CurvedAnimation can be used as parent for multiple Tweens',
    'controller.value goes from 0.0 to 1.0 over the duration',
    'Use Interval curve to animate only a portion of the timeline',
    'Physics simulations (SpringSimulation) allow natural-feeling animations',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterExplicitAnim,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterExplicitAnim;
    update();
    super.onInit();
  }

  void scrollToTop() => scrollController.animateTo(0,
      duration: const Duration(seconds: 1), curve: Curves.linear);

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
