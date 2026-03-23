import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MetadataController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.METADATA_IN_DART}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      'Metadata in Dart is information about code that can be examined at compile time or runtime. It is expressed using annotations — identifiers prefixed with @ — placed before a class, method, field, or parameter declaration.';

  String builtInAnnotationsDesc =
      'Dart ships with three built-in annotations, and the meta package provides more. These are the most commonly used ones:';

  List<Map<String, String>> builtInAnnotations = [
    {
      'name': '@override',
      'desc':
          'Tells the compiler this method intentionally overrides a superclass member. The compiler warns if no such member exists.'
    },
    {
      'name': '@deprecated',
      'desc':
          'Marks an API element as deprecated. The compiler shows a warning when the element is used.'
    },
    {
      'name': '@pragma',
      'desc':
          'Passes hints to tools and compilers. Commonly used with dart2native for tree-shaking hints.'
    },
  ];

  String overrideCode = '''class Animal {
  String speak() => 'Some sound';
}

class Dog extends Animal {
  @override              // ← compiler verifies speak() exists in Animal
  String speak() => 'Woof!';
}

void main() {
  print(Dog().speak()); // Woof!
}''';

  String deprecatedCode = '''class OldApi {
  @deprecated           // use newMethod() instead
  void legacyMethod() => print('legacy');

  void newMethod() => print('new and improved');
}

void main() {
  OldApi().legacyMethod(); // ⚠️  warning: legacyMethod is deprecated
  OldApi().newMethod();    // ✓  no warning
}''';

  String customAnnotationDesc =
      'You can create your own annotations by defining a class with a const constructor. Custom annotations are widely used in code-generation packages like json_serializable, freezed, and injectable.';

  String customAnnotationCode = '''// 1. Define the annotation class
class Route {
  final String path;
  const Route(this.path);        // must have a const constructor
}

// 2. Use it
@Route('/home')
class HomePage {}

@Route('/settings')
class SettingsPage {}

// 3. Read it at runtime using dart:mirrors (server/CLI only)
// or let a build_runner code generator read it at build time.''';

  String metaPackageDesc =
      'The meta package (pub.dev/packages/meta) extends the annotation vocabulary with useful markers for static analysis:';

  String metaPackageCode = '''import 'package:meta/meta.dart';

class Authenticator {
  // @required — argument must be provided (legacy; use Dart null-safety instead)
  void login({required String email, required String password}) { }

  // @visibleForTesting — warns if used outside tests or the defining library
  @visibleForTesting
  String hashPassword(String raw) => '...';

  // @immutable — all fields of the class should be final
  // (applied to the class declaration)
}

@immutable
class Config {
  final String host;
  final int port;
  const Config({required this.host, required this.port});
}''';

  List<String> tips = [
    'Annotations are compile-time constants — their constructor must be const.',
    '@override is zero-cost at runtime; it only aids static analysis.',
    'Custom annotations enable powerful code generation with build_runner.',
    'Prefer Dart null safety over @required from the meta package.',
    'Use @visibleForTesting to keep helper methods out of the public API.',
    'The @sealed annotation (meta) prevents external classes from extending your class.',
  ];

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        if (scrollController.position.pixels >=
            scrollController.position.maxScrollExtent - 150) {
          Get.find<ProgressService>().markCompleted(routePath);
        }
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.metaData,
    );
    Get.find<AppBarController>().appBarTitle = SK.metaData;
    Get.find<ProgressService>().markInProgress(routePath);
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
