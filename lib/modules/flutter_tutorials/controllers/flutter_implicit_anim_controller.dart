import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterImplicitAnimController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Implicit animations automatically animate between old and new values whenever a property changes. No AnimationController needed. Flutter handles the animation under the hood using Tweens.';
  String animatedContainerCode = '''// AnimatedContainer — animate Container properties
class AnimatedBox extends StatefulWidget {
  const AnimatedBox({super.key});
  @override
  State<AnimatedBox> createState() => _AnimatedBoxState();
}

class _AnimatedBoxState extends State<AnimatedBox> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _isExpanded = !_isExpanded),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
        width: _isExpanded ? 250 : 100,
        height: _isExpanded ? 250 : 100,
        decoration: BoxDecoration(
          color: _isExpanded ? Colors.purple : Colors.blue,
          borderRadius: BorderRadius.circular(_isExpanded ? 24 : 8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: _isExpanded ? 16 : 4,
              offset: Offset(0, _isExpanded ? 8 : 2),
            ),
          ],
        ),
        child: Center(
          child: Icon(
            _isExpanded ? Icons.close : Icons.add,
            color: Colors.white,
            size: _isExpanded ? 48 : 24,
          ),
        ),
      ),
    );
  }
}''';
  String animatedOpacityCode = '''// AnimatedOpacity — fade in/out
class FadeInContent extends StatefulWidget {
  const FadeInContent({super.key});
  @override
  State<FadeInContent> createState() => _FadeInContentState();
}

class _FadeInContentState extends State<FadeInContent> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: const Text('I fade in and out!', style: TextStyle(fontSize: 20)),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () => setState(() => _visible = !_visible),
          child: Text(_visible ? 'Hide' : 'Show'),
        ),
      ],
    );
  }
}

// AnimatedSwitcher — animate between different children
AnimatedSwitcher(
  duration: const Duration(milliseconds: 300),
  transitionBuilder: (child, animation) => FadeTransition(
    opacity: animation,
    child: child,
  ),
  child: isLoading
      ? const CircularProgressIndicator(key: ValueKey('loading'))
      : const Icon(Icons.check_circle, color: Colors.green, size: 48, key: ValueKey('done')),
)''';
  String tweenBuilderCode = '''// TweenAnimationBuilder — general purpose implicit animation
TweenAnimationBuilder<double>(
  tween: Tween<double>(begin: 0, end: 1),
  duration: const Duration(seconds: 2),
  curve: Curves.easeOut,
  builder: (context, value, child) {
    return Transform.scale(
      scale: value,
      child: Opacity(
        opacity: value,
        child: child,
      ),
    );
  },
  child: const FlutterLogo(size: 100),
)

// Animate a border radius
TweenAnimationBuilder<BorderRadius>(
  tween: Tween<BorderRadius>(
    begin: BorderRadius.circular(0),
    end: BorderRadius.circular(24),
  ),
  duration: const Duration(seconds: 1),
  builder: (context, radius, child) {
    return ClipRRect(
      borderRadius: radius,
      child: child,
    );
  },
  child: Image.network('https://picsum.photos/200', width: 200, height: 200),
)

// Other implicit animation widgets:
// AnimatedAlign      — animates alignment
// AnimatedPadding    — animates padding
// AnimatedDefaultTextStyle — animates text style
// AnimatedPositioned — animates position inside Stack
// AnimatedPhysicalModel — animates elevation/shadow''';
  List<String> tips = [
    'Implicit animations are perfect for toggle/expand/collapse interactions',
    'Always provide a unique Key when using AnimatedSwitcher',
    'TweenAnimationBuilder works with any animatable type (double, Color, etc.)',
    'onEnd callback on AnimatedContainer lets you chain animations',
    'AnimatedList adds/removes items with animations',
    'Prefer implicit over explicit when you don\'t need full animation control',
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
      child: SideNavBarChildEnum.flutterImplicitAnim,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterImplicitAnim;
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
