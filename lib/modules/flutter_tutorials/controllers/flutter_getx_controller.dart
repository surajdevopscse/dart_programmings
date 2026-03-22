import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterGetXController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'GetX is a lightweight, powerful Flutter package that provides state management, dependency injection, and route management in one solution. It is known for its simplicity and minimal boilerplate.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   get: ^4.6.6

// Replace MaterialApp with GetMaterialApp
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetX App',
      home: const HomePage(),
    );
  }
}''';
  String controllerCode = '''// GetxController — your state class
class CounterController extends GetxController {
  // Rx variables — observable state
  var count = 0.obs;
  var isLoading = false.obs;
  var username = 'Guest'.obs;
  var items = <String>[].obs;

  void increment() => count++;
  void decrement() => count--;
  void reset() => count.value = 0;

  void addItem(String item) {
    items.add(item);
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize your state here
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    username.value = 'John Doe';
    isLoading.value = false;
  }
}''';
  String rxCode = '''// Rx (Reactive) variables
// .obs makes any variable reactive

int simpleInt = 0;
var rxInt = 0.obs;          // RxInt
var rxString = ''.obs;       // RxString
var rxBool = false.obs;      // RxBool
var rxDouble = 0.0.obs;      // RxDouble
var rxList = <String>[].obs; // RxList
var rxMap = <String, int>{}.obs; // RxMap

// Updating Rx values
rxInt.value = 42;
rxInt++;            // shorthand
rxString.value = 'Hello';
rxBool.toggle();    // flip boolean

// Using with Obx
Obx(() => Text('\${rxInt.value}'))

// Worker — react to changes
ever(rxInt, (value) => print('New value: \$value'));
debounce(rxString, (value) => search(value),
    time: const Duration(milliseconds: 500));
interval(rxInt, (value) => print(value),
    time: const Duration(seconds: 1));''';
  String getBuilderCode = '''// GetBuilder — non-reactive, manual update()
class ProfileController extends GetxController {
  String name = 'Alice';
  int age = 25;

  void changeName(String newName) {
    name = newName;
    update();  // triggers GetBuilder rebuild
  }
}

// GetView — convenient base class
class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Obx — reactive rebuild (requires .obs)
          Obx(() => Text('Count: \${Get.find<CounterController>().count}')),

          // GetBuilder — manual rebuild with update()
          GetBuilder<ProfileController>(
            builder: (ctrl) => Text('Name: \${ctrl.name}'),
          ),

          // GetX — combines features of GetBuilder + Obx
          GetX<ProfileController>(
            builder: (ctrl) => Text('Age: \${ctrl.age}'),
          ),
        ],
      ),
    );
  }
}

// Dependency Injection
Get.put(ProfileController());        // immediate init
Get.lazyPut(() => ProfileController()); // lazy init
Get.find<ProfileController>()        // retrieve

// Navigation
Get.to(() => const NextPage());
Get.back();
Get.off(() => const NewPage());      // replace current
Get.offAll(() => const RootPage()); // clear all history''';
  List<String> tips = [
    'Use GetView<Controller> as base class for pages with a single controller',
    'Obx requires Rx variables (.obs), GetBuilder requires update() call',
    'Get.put() registers and initializes immediately; Get.lazyPut() initializes on first use',
    'Use Get.delete<Controller>() in GoRoute onExit to avoid memory leaks',
    'GetConnect provides a built-in HTTP client with interceptors',
    'Get.snackbar, Get.dialog, Get.bottomSheet work without BuildContext',
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
      child: SideNavBarChildEnum.flutterGetX,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterGetX;
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
