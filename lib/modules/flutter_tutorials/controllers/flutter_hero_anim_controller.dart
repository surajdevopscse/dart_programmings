import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterHeroAnimController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Hero animations create smooth transitions of a shared element between two pages. Wrap the same element in Hero widgets on both pages with a matching tag. Flutter automatically animates the widget from its source to its destination position.';
  String heroCode = '''// Hero animation — shared element transition between pages

// SOURCE page — the list/grid page
class ProductCard extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String name;

  const ProductCard({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              productId: productId,
              imageUrl: imageUrl,
              name: name,
            ),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: 'product_\$productId',  // unique tag per item
            child: Image.network(
              imageUrl,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          Text(name),
        ],
      ),
    );
  }
}

// DESTINATION page — the detail page
class ProductDetailPage extends StatelessWidget {
  final String productId;
  final String imageUrl;
  final String name;

  const ProductDetailPage({
    super.key,
    required this.productId,
    required this.imageUrl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Column(
        children: [
          Hero(
            tag: 'product_\$productId',  // same tag as source
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(name, style: const TextStyle(fontSize: 24)),
          ),
        ],
      ),
    );
  }
}''';
  String listDetailExample = '''// Profile list to detail — practical Hero example
// In list:
Hero(
  tag: 'avatar_\${user.id}',
  child: CircleAvatar(
    radius: 24,
    backgroundImage: NetworkImage(user.avatarUrl),
  ),
),

// In detail:
Hero(
  tag: 'avatar_\${user.id}',
  child: CircleAvatar(
    radius: 60,
    backgroundImage: NetworkImage(user.avatarUrl),
  ),
),

// Custom hero transition with flightShuttleBuilder
Hero(
  tag: 'profile_\${user.id}',
  flightShuttleBuilder: (context, animation, direction, from, to) {
    return ScaleTransition(
      scale: animation,
      child: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl)),
    );
  },
  child: CircleAvatar(backgroundImage: NetworkImage(user.avatarUrl), radius: 24),
)

// Tip: use a SizedBox or Container with fixed size on source
// to prevent layout issues during the flight''';
  List<String> tips = [
    'Hero tags must be unique across all currently visible pages',
    'The Widget type does not need to match between source and destination',
    'Use MaterialPageRoute or PageRouteBuilder — Hero requires a Navigator',
    'flightShuttleBuilder customizes the widget appearance during flight',
    'placeholderBuilder shows what stays in source while hero is flying',
    'Hero animations work with GoRouter navigation too',
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
      child: SideNavBarChildEnum.flutterHeroAnim,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterHeroAnim;
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
