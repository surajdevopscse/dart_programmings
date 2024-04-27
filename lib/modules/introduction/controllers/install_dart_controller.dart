import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class InstallDartController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String dartInstall =
      'There are multiple ways to install a dart on your system. You can install Dart on Windows, Mac, and Linux or run it from the browser.\nTo install Dart, you can follow these general steps. Keep in mind that specific instructions might vary based on your operating system.';
  String dartCheckVersion =
      'Open your command prompt and type dart --version. The dart is successfully installed on your system if it gives you a version code. If not, watch the video above.';
  String dartPadWebTool =
      'You can run the dart program on your browser without installing any software. Dartpad is a web tool to write and run your dart code.';

  final Uri dartPadUrl = Uri.parse('https://dartpad.dev/');
  List<Map<String, dynamic>> dartInstallationStepsWindow = [
    {
      'title': 'Download Dart SDK:',
      'substeps': [
        'Visit the Dart SDK page on the Dart website: Dart SDK.',
        'Click on the Windows tab to download the Dart SDK for Windows.',
        'Follow the installation instructions provided on the Dart website.'
      ]
    },
    {
      'title': 'Add Dart to System Path:',
      'substeps': [
        "After installation, you need to add the Dart SDK to your system's PATH.",
        'Search for "Environment Variables" in the Windows Start menu and open it.',
        'Under the "System variables" section, find and select the "Path" variable, then click "Edit".',
        'Click "New" and add the path to the Dart SDK\'s bin directory. The default path is often C:\\dart\\dart-sdk\\bin (adjust accordingly).'
      ]
    },
    {
      'title': 'Verify Installation:',
      'substeps': [
        'Open a new command prompt or terminal window.',
        'Type "dart --version" and press Enter. This should display the Dart version if the installation was successful.'
      ]
    }
  ];

  List<Map<String, dynamic>> installationStepsMac = [
    {
      'title': 'Install Homebrew (if not already installed):',
      'substeps': [
        'Open Terminal.',
        'Run the following command to install Homebrew:',
        '/bin/bash -c "\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
      ]
    },
    {
      'title': 'Install Dart SDK using Homebrew:',
      'substeps': [
        'Run the following command to install Dart:',
        'brew tap dart-lang/dart',
        'brew install dart'
      ]
    },
    {
      'title': 'Verify Installation:',
      'substeps': [
        'Open a new Terminal window.',
        "Type 'dart --version' and press Enter. This should display the Dart version if the installation was successful."
      ]
    },
  ];

  List<Map<String, dynamic>> dartInstallationStepsLinux = [
    {
      'title': 'Download Dart SDK:',
      'substeps': [
        'Visit the Dart SDK page on the Dart website: Dart SDK.',
        'Click on the Linux tab to download the Dart SDK for Linux.',
        'Follow the installation instructions provided on the Dart website.'
      ]
    },
    {
      'title': 'Add Dart to System Path:',
      'substeps': [
        "After installation, you need to add the Dart SDK to your system's PATH.",
        'Open your shell profile file (e.g., ~/.bashrc, ~/.zshrc) in a text editor.',
        'Add the following line at the end of the file:',
        'export PATH="\$PATH:/path/to/dart-sdk/bin"',
        'Replace /path/to/dart-sdk with the actual path where Dart is installed.'
      ]
    },
    {
      'title': 'Verify Installation:',
      'substeps': [
        'Open a new terminal window.',
        'Type dart --version and press Enter. This should display the Dart version if the installation was successful.'
      ]
    },
  ];
  final List<Map<String, String>> dartHelpfullCommands = [
    {'Command': 'dart --help', 'Description': 'Show all available commands.'},
    {'Command': 'dart --version', 'Description': 'Version check.'},
    {'Command': 'dart filename.dart', 'Description': 'Run the dart file.'},
    {'Command': 'dart create', 'Description': 'Create a dart project.'},
    {
      'Command': 'dart fix',
      'Description': 'Update dart project to new syntax.'
    },
    {
      'Command': 'dart compile exe bin/dart.dart',
      'Description': 'Compile dart code.'
    },
    {
      'Command': 'dart compile js bin/dart.dart',
      'Description':
          'Compile dart to javascript. You can run this file with Node.js.'
    },
  ];

  Future<void> launchDartPad() async {
    if (!await launchUrl(
      dartPadUrl,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $dartPadUrl';
    }
  }

  @override
  void onInit() async {
    scrollController = ScrollController()
      ..addListener(() {
        if (scrollController.offset >= 400) {
          showBackToTopButton = true;
        } else {
          showBackToTopButton = false;
        }
      });
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.introductionAndSyntax,
      child: SideNavBarChildEnum.installDart,
    );
    update();
    super.onInit();
  }

  void scrollToTop() {
    scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}
