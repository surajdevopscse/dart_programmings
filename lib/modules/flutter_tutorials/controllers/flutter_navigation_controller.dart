import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterNavigationController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Navigation in Flutter is handled by the Navigator widget, which maintains a stack of routes. Use Navigator.push() to navigate forward and Navigator.pop() to go back. Named routes and GoRouter offer more structured navigation.';
  String pushCode = '''// Imperative navigation with Navigator
// Push a new page onto the navigation stack
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const DetailsPage(id: 42),
      ),
    );
  },
  child: const Text('Go to Details'),
)

// Navigate and wait for result
final result = await Navigator.push<String>(
  context,
  MaterialPageRoute(builder: (context) => const SelectionPage()),
);
if (result != null) {
  print('User selected: \$result');
}

// Replace current route (no back button)
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => const HomePage()),
);

// Push and remove all previous routes
Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => const LoginPage()),
  (route) => false,
);''';
  String popCode = '''// Pop — go back to previous page
IconButton(
  icon: const Icon(Icons.arrow_back),
  onPressed: () => Navigator.pop(context),
)

// Pop with a result value
ElevatedButton(
  onPressed: () => Navigator.pop(context, 'selected_item'),
  child: const Text('Select This'),
)

// Check if can pop
if (Navigator.canPop(context)) {
  Navigator.pop(context);
}

// WillPopScope — intercept back button
WillPopScope(
  onWillPop: () async {
    final shouldLeave = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Leave page?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('No')),
          TextButton(onPressed: () => Navigator.pop(context, true), child: const Text('Yes')),
        ],
      ),
    );
    return shouldLeave ?? false;
  },
  child: const Scaffold(body: Center(child: Text('Protected Page'))),
)''';
  String namedRoutesCode = '''// Named routes setup in MaterialApp
MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const HomePage(),
    '/details': (context) => const DetailsPage(),
    '/profile': (context) => const ProfilePage(),
  },
)

// Navigate using named route
Navigator.pushNamed(context, '/details');

// Pass arguments with named routes
Navigator.pushNamed(
  context,
  '/details',
  arguments: {'id': 42, 'title': 'Item Title'},
);

// Receive arguments in destination
class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>;
    return Scaffold(
      appBar: AppBar(title: Text(args['title'])),
      body: Text('ID: \${args['id']}'),
    );
  }
}''';
  String dataPassingCode = '''// Passing data via constructor (preferred approach)
class ProductPage extends StatelessWidget {
  final int productId;
  final String productName;

  const ProductPage({
    super.key,
    required this.productId,
    required this.productName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(productName)),
      body: Center(child: Text('Product ID: \$productId')),
    );
  }
}

// Navigate with data
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ProductPage(
      productId: 123,
      productName: 'Flutter Book',
    ),
  ),
);''';
  List<String> tips = [
    'Prefer GoRouter or Navigator 2.0 for complex apps with deep linking',
    'Named routes are simpler but lack type safety',
    'Pass data via constructors for type-safe navigation',
    'Use onGenerateRoute for dynamic route generation',
    'Consider using a route guard pattern for authentication',
    'Navigator.of(context, rootNavigator: true) navigates from the root navigator',
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
      child: SideNavBarChildEnum.flutterNavigation,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterNavigation;
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
