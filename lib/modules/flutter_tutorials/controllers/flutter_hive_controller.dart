import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterHiveController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Hive is a lightweight and blazing fast key-value database written in pure Dart. It requires no native dependencies and works on all platforms. Use TypeAdapters to store custom Dart objects.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   hive: ^2.2.3
#   hive_flutter: ^1.1.0
# dev_dependencies:
#   hive_generator: ^2.0.0
#   build_runner: ^2.4.0

// Initialize Hive in main()
import 'package:hive_flutter/hive_flutter.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Hive with app documents directory
  await Hive.initFlutter();

  // Register type adapters for custom objects
  Hive.registerAdapter(NoteAdapter());
  Hive.registerAdapter(CategoryAdapter());

  // Open boxes (like tables)
  await Hive.openBox('settings');
  await Hive.openBox<Note>('notes');

  runApp(const MyApp());
}''';
  String openBoxCode = '''// Working with Hive Boxes
// Simple key-value box
final settingsBox = Hive.box('settings');
settingsBox.put('theme', 'dark');
settingsBox.put('language', 'en');
final theme = settingsBox.get('theme', defaultValue: 'light');

// Typed box
final notesBox = Hive.box<Note>('notes');

// Lazy box (loads on demand — better for large data)
final lazyBox = await Hive.openLazyBox<Note>('large_notes');
final note = await lazyBox.get('key123');

// Close box when done
await notesBox.close();

// Delete box entirely
await Hive.deleteBoxFromDisk('notes');''';
  String crudCode = '''// CRUD operations with Hive
final box = Hive.box<Note>('notes');

// CREATE
await box.put('note_1', Note(title: 'My Note', content: 'Hello Hive!', createdAt: DateTime.now()));
// Auto-incremented key
await box.add(Note(title: 'Auto Key', content: 'Gets an int key'));

// READ
final note = box.get('note_1');
final allNotes = box.values.toList();
final noteAt0 = box.getAt(0);

// UPDATE
await box.put('note_1', Note(title: 'Updated Title', content: 'New content', createdAt: DateTime.now()));

// DELETE
await box.delete('note_1');
await box.deleteAt(0);

// Query / filter (done in Dart)
final importantNotes = box.values
    .where((note) => note.title.contains('Important'))
    .toList();

// Watch for changes (reactive)
box.watch(key: 'note_1').listen((event) {
  print('Note changed: \${event.value}');
});

// ValueListenableBuilder for reactive UI
ValueListenableBuilder<Box<Note>>(
  valueListenable: box.listenable(),
  builder: (context, box, _) {
    return ListView.builder(
      itemCount: box.length,
      itemBuilder: (context, index) {
        final note = box.getAt(index)!;
        return ListTile(title: Text(note.title));
      },
    );
  },
)''';
  String typeAdapterCode = '''// TypeAdapter — for storing custom Dart objects
// Step 1: Define your model with HiveType annotation
import 'package:hive/hive.dart';

part 'note.g.dart';  // generated file

@HiveType(typeId: 0)
class Note extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String content;

  @HiveField(2)
  DateTime createdAt;

  @HiveField(3)
  bool isPinned;

  Note({
    required this.title,
    required this.content,
    required this.createdAt,
    this.isPinned = false,
  });
}

// Step 2: Generate adapter
// Run: flutter pub run build_runner build

// Step 3: Register adapter in main()
// Hive.registerAdapter(NoteAdapter());

// The generated NoteAdapter handles serialization automatically''';
  List<String> tips = [
    'Use HiveObject as base class to get delete() and save() helper methods',
    'Hive is not suitable for relational data with complex joins',
    'Use LazyBox for large collections where you read items one at a time',
    'Hive stores data as binary — much faster than JSON parsing',
    'Encrypted box (Hive.openBox with encryptionCipher) for sensitive data',
    'Compact the box periodically to reclaim disk space after deletions',
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
      child: SideNavBarChildEnum.flutterHive,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterHive;
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
