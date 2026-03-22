import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterAnimationsController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Flutter has a rich animation system. Animations can range from simple property transitions (implicit) to complex choreographed sequences (explicit). Understanding Tween, AnimationController, and CurvedAnimation is key.';
  String typesDesc = '''Flutter animations fall into two categories:

Implicit Animations — Simple, property-based
  • AnimatedContainer, AnimatedOpacity, AnimatedSwitcher
  • Just change a value and Flutter animates the transition
  • No AnimationController needed
  • Best for simple UI transitions

Explicit Animations — Full control
  • AnimationController + Tween + AnimatedBuilder
  • You control every aspect of the animation
  • Can create complex, choreographed sequences
  • Required for looping animations, physics-based animations''';
  String animationControllerCode = '''// AnimationController — the core of explicit animations
class PulseWidget extends StatefulWidget {
  const PulseWidget({super.key});
  @override
  State<PulseWidget> createState() => _PulseWidgetState();
}

class _PulseWidgetState extends State<PulseWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,                           // vsync prevents off-screen animations
      duration: const Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.3)
        .animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));

    _controller.repeat(reverse: true);       // ping-pong loop
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: _animation.value,
          child: child,
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.blue,
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.favorite, color: Colors.white, size: 40),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}''';
  String tweenCode = '''// Tween — defines start and end values
// ColorTween
final colorAnimation = ColorTween(
  begin: Colors.blue,
  end: Colors.red,
).animate(_controller);

// SizeTween
final sizeAnimation = SizeTween(
  begin: const Size(100, 50),
  end: const Size(200, 100),
).animate(_controller);

// RectTween (for position + size)
final rectAnimation = RectTween(
  begin: Rect.fromLTWH(0, 0, 100, 100),
  end: Rect.fromLTWH(200, 200, 200, 200),
).animate(_controller);

// Sequenced animation with TweenSequence
final sequencedAnimation = TweenSequence([
  TweenSequenceItem(
    tween: Tween<double>(begin: 0, end: 1).chain(CurveTween(curve: Curves.easeIn)),
    weight: 50,  // 50% of duration
  ),
  TweenSequenceItem(
    tween: Tween<double>(begin: 1, end: 0).chain(CurveTween(curve: Curves.easeOut)),
    weight: 50,  // remaining 50%
  ),
]).animate(_controller);

// Common Curves:
// Curves.linear, easeIn, easeOut, easeInOut
// Curves.bounceIn, bounceOut, elasticIn, elasticOut
// Curves.fastOutSlowIn, Curves.decelerate''';
  List<String> tips = [
    'Always dispose AnimationController in dispose() method',
    'Use SingleTickerProviderStateMixin for one controller, TickerProviderStateMixin for multiple',
    'Use const constructors for AnimatedWidget children that don\'t change',
    'Curves.fastOutSlowIn is great for Material Design-style animations',
    'Use Interval to offset animations in a sequence',
    'flutter_animate package makes complex animations much easier',
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
      child: SideNavBarChildEnum.flutterAnimations,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterAnimations;
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
