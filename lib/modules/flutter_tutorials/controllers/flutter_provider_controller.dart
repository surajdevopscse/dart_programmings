import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterProviderController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Provider is the officially recommended state management solution by the Flutter team. It is built on top of InheritedWidget and makes sharing and accessing state across the widget tree easy.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   provider: ^6.1.0

// Wrap your app with ChangeNotifierProvider
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
        ChangeNotifierProvider(create: (_) => UserModel()),
      ],
      child: const MyApp(),
    ),
  );
}''';
  String notifierCode = '''// ChangeNotifier — your state class
class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => List.unmodifiable(_items);
  int get itemCount => _items.length;

  void addItem(String item) {
    _items.add(item);
    notifyListeners();  // triggers rebuild of listening widgets
  }

  void removeItem(String item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}''';
  String consumerCode = '''// Consumer — listens to ChangeNotifier and rebuilds
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        actions: [
          // context.watch — rebuilds when model changes
          Text('\${context.watch<CartModel>().itemCount} items'),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return const Center(child: Text('Cart is empty'));
          }
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(cart.items[index]),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => cart.removeItem(cart.items[index]),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        // context.read — does NOT rebuild, just calls a method
        onPressed: () => context.read<CartModel>().addItem('New Item'),
        child: const Icon(Icons.add),
      ),
    );
  }
}

// Selector — rebuild only when a specific part changes
Selector<CartModel, int>(
  selector: (_, cart) => cart.itemCount,
  builder: (context, count, child) {
    return Badge(label: Text('\$count'));
  },
)''';
  List<String> tips = [
    'context.watch<T>() — read and rebuild when T changes',
    'context.read<T>() — read without rebuilding (use in callbacks)',
    'context.select<T, R>() — rebuild only when selected value changes',
    'Use Consumer to limit rebuilds to the smallest widget subtree',
    'Prefer MultiProvider when you have multiple providers',
    'ProxyProvider creates a provider that depends on another provider',
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
      child: SideNavBarChildEnum.flutterProvider,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterProvider;
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
