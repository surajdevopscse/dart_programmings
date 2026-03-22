import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterSetupController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Setting up Flutter requires installing the Flutter SDK, configuring your IDE (VS Code or Android Studio), and running flutter doctor to verify your environment.';
  List<String> installStepsWindows = [
    '1. Download Flutter SDK from flutter.dev/docs/get-started/install/windows',
    '2. Extract the zip to C:\\src\\flutter (avoid spaces in path)',
    '3. Add C:\\src\\flutter\\bin to your PATH environment variable',
    '4. Install Git for Windows if not already installed',
    '5. Install Android Studio and Android SDK',
    '6. Run flutter doctor to check for any issues',
    '7. Accept Android licenses: flutter doctor --android-licenses',
    '8. Install VS Code Flutter extension or Android Studio Flutter plugin',
  ];
  List<String> installStepsMac = [
    '1. Download Flutter SDK from flutter.dev/docs/get-started/install/macos',
    '2. Extract to ~/development/flutter',
    '3. Add export PATH="\$PATH:\$HOME/development/flutter/bin" to ~/.zshrc',
    '4. Install Xcode from the App Store (for iOS development)',
    '5. Run sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer',
    '6. Install CocoaPods: sudo gem install cocoapods',
    '7. Install Android Studio for Android development',
    '8. Run flutter doctor to verify setup',
  ];
  String flutterDoctorCode = '''# Run flutter doctor to check environment
\$ flutter doctor

Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.x.x)
[✓] Android toolchain - develop for Android devices
[✓] Xcode - develop for iOS and macOS
[✓] Chrome - develop for the web
[✓] VS Code (version x.x.x)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!''';
  String createAppCode = '''# Create a new Flutter project
\$ flutter create my_app

# With specific organization and platforms
\$ flutter create --org com.example --platforms=android,ios,web my_app

# Navigate into the project
\$ cd my_app

# Project structure:
# my_app/
#   lib/          - Your Dart source code
#   test/         - Test files
#   android/      - Android-specific code
#   ios/          - iOS-specific code
#   web/          - Web-specific code
#   pubspec.yaml  - Dependencies and metadata''';
  String runAppCode = '''# Run on connected device or emulator
\$ flutter run

# Run on specific device
\$ flutter run -d chrome      # web
\$ flutter run -d emulator-5554  # Android emulator

# Run in release mode
\$ flutter run --release

# Build APK
\$ flutter build apk --release

# Build iOS IPA
\$ flutter build ipa --release''';

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        showBackToTopButton = scrollController.offset >= 400;
        update();
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.flutterTutorials,
      child: SideNavBarChildEnum.flutterSetup,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterSetup;
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
