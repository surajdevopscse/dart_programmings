import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterRiverpodController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Riverpod is a reactive state management library that improves upon Provider. It is compile-safe, testable, and supports multiple providers of the same type. It uses a global provider scope without BuildContext.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   flutter_riverpod: ^2.4.0
#   riverpod_annotation: ^2.3.0

// Wrap your entire app with ProviderScope
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}''';
  String stateProviderCode = '''// Various provider types
import 'package:flutter_riverpod/flutter_riverpod.dart';

// StateProvider — simple state (int, String, bool, etc.)
final counterProvider = StateProvider<int>((ref) => 0);

// StateNotifierProvider — complex state with methods
class TodoList extends StateNotifier<List<String>> {
  TodoList() : super([]);

  void add(String todo) => state = [...state, todo];
  void remove(int index) {
    final list = [...state];
    list.removeAt(index);
    state = list;
  }
}

final todoProvider = StateNotifierProvider<TodoList, List<String>>(
  (ref) => TodoList(),
);

// FutureProvider — async data
final userProvider = FutureProvider<User>((ref) async {
  final response = await http.get(Uri.parse('https://api.example.com/user'));
  return User.fromJson(jsonDecode(response.body));
});

// StreamProvider — real-time data
final messagesProvider = StreamProvider<List<Message>>((ref) {
  return firestore.collection('messages').snapshots().map(
    (snap) => snap.docs.map((d) => Message.fromSnapshot(d)).toList(),
  );
});''';
  String consumerCode = '''// ConsumerWidget — Riverpod equivalent of StatelessWidget
class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch — read and rebuild when value changes
    final count = ref.watch(counterProvider);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: \$count', style: const TextStyle(fontSize: 32)),
            ElevatedButton(
              // ref.read — use in callbacks (doesn't rebuild)
              onPressed: () => ref.read(counterProvider.notifier).state++,
              child: const Text('Increment'),
            ),
          ],
        ),
      ),
    );
  }
}

// AsyncValue handling for FutureProvider/StreamProvider
class UserProfilePage extends ConsumerWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userAsync = ref.watch(userProvider);

    return userAsync.when(
      data: (user) => Text('Hello, \${user.name}!'),
      loading: () => const CircularProgressIndicator(),
      error: (err, stack) => Text('Error: \$err'),
    );
  }
}''';
  List<String> tips = [
    'ref.watch() subscribes to a provider and rebuilds on change',
    'ref.read() accesses a provider once without subscribing',
    'ref.listen() listens to changes to trigger side effects',
    'Use ref.invalidate() to force a provider to refresh',
    'family modifier creates parameterized providers: provider.family<T, P>',
    'keepAlive modifier prevents providers from being disposed when unused',
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
      child: SideNavBarChildEnum.flutterRiverpod,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterRiverpod;
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
