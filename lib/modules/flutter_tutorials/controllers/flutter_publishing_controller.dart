import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterPublishingController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Publishing a Flutter app involves signing the build, configuring app metadata, and submitting to the appropriate store. Each platform (Android, iOS, Web) has its own process and requirements.';
  List<String> androidSteps = [
    '1. Generate a keystore: keytool -genkey -v -keystore ~/key.jks -keyAlg RSA -keysize 2048 -validity 10000 -alias key',
    '2. Create android/key.properties file with keystore path and passwords',
    '3. Update android/app/build.gradle to reference the signing config',
    '4. Set applicationId in build.gradle (e.g., com.yourcompany.yourapp)',
    '5. Update app version in pubspec.yaml (version: 1.0.0+1)',
    '6. Build release APK: flutter build apk --release',
    '7. Build App Bundle (preferred for Play Store): flutter build appbundle --release',
    '8. Create Google Play Console account and upload the AAB',
    '9. Fill in store listing, screenshots, content rating, pricing',
    '10. Submit for review (usually approved within 1-7 days)',
  ];
  String androidCode = '''# android/key.properties (DO NOT commit to git!)
storePassword=your-store-password
keyPassword=your-key-password
keyAlias=key
storeFile=../key.jks

# android/app/build.gradle
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
    keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}

android {
    signingConfigs {
        release {
            keyAlias keystoreProperties['keyAlias']
            keyPassword keystoreProperties['keyPassword']
            storeFile keystoreProperties['storeFile'] ?
                file(keystoreProperties['storeFile']) : null
            storePassword keystoreProperties['storePassword']
        }
    }
    buildTypes {
        release {
            signingConfig signingConfigs.release
            minifyEnabled true
            shrinkResources true
        }
    }
}

# Build commands
\$ flutter build apk --release
\$ flutter build appbundle --release
\$ flutter install  # install on connected device''';
  List<String> iosSteps = [
    '1. Enroll in Apple Developer Program (\$99/year at developer.apple.com)',
    '2. Create an App ID in the Apple Developer portal',
    '3. Create a Distribution Certificate and Provisioning Profile',
    '4. Set bundle identifier in Xcode: Runner → General → Bundle Identifier',
    '5. Set version and build number in Xcode or pubspec.yaml',
    '6. Build release: flutter build ipa --release',
    '7. Open the .ipa in Xcode Organizer to upload to App Store Connect',
    '8. Create your app listing in App Store Connect',
    '9. Submit for Apple review (typically 1-3 days)',
    '10. Set pricing and release strategy (manual or automatic)',
  ];
  String webCode = '''# Build for web
\$ flutter build web --release

# Optimize with renderer
\$ flutter build web --release --web-renderer canvaskit  # better performance
\$ flutter build web --release --web-renderer html        # smaller size

# Output in: build/web/

# Deploy to Firebase Hosting
\$ firebase init hosting
\$ firebase deploy

# Or deploy to GitHub Pages
# Copy build/web/* to your gh-pages branch

# Netlify / Vercel
# Drag and drop build/web/ folder

# Custom web server (nginx):
# server {
#   location / {
#     try_files \$uri \$uri/ /index.html;  # required for Flutter web routing
#   }
# }

# App check and PWA config in web/index.html and web/manifest.json''';
  List<String> tips = [
    'NEVER commit key.properties or keystore to version control',
    'Use CI/CD (GitHub Actions, Fastlane, Codemagic) to automate builds',
    'Test on physical devices before submitting to stores',
    'Prepare screenshots for all required screen sizes (phones + tablets)',
    'Add a privacy policy URL — required by both stores',
    'Use flutter build web --pwa-strategy offline-first for PWA support',
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
      child: SideNavBarChildEnum.flutterPublishing,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterPublishing;
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
