import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/services/progress/progress_service.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateTimeController extends GetxController {
  static const String routePath =
      '${AppPath.INTRODUCION}/${AppPath.DATETIME}';

  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro =
      "Dart's DateTime class represents a point in time. It supports creation, parsing, formatting, arithmetic, and comparison. All DateTime objects are either UTC or local (device timezone).";

  String creatingCode = """void main() {
  // Current local date & time
  final now = DateTime.now();
  print(now);   // 2025-06-15 14:30:00.000

  // Specific date
  final birthday = DateTime(1990, 6, 15);      // June 15, 1990  00:00:00
  final withTime = DateTime(2025, 1, 1, 9, 30); // Jan 1, 2025   09:30:00

  // UTC
  final utcNow = DateTime.now().toUtc();
  final utcDate = DateTime.utc(2025, 12, 31);

  // From Unix timestamp (milliseconds)
  final epoch = DateTime.fromMillisecondsSinceEpoch(0);
  print(epoch);  // 1970-01-01 00:00:00.000Z

  // Parsing from ISO 8601 string
  final parsed = DateTime.parse('2025-06-15T14:30:00.000Z');
  print(parsed.isUtc);  // true
}""";

  String propertiesCode = """void main() {
  final dt = DateTime(2025, 6, 15, 14, 30, 45);

  print(dt.year);         // 2025
  print(dt.month);        // 6
  print(dt.day);          // 15
  print(dt.hour);         // 14
  print(dt.minute);       // 30
  print(dt.second);       // 45
  print(dt.weekday);      // 7  (DateTime.sunday == 7)
  print(dt.isUtc);        // false
  print(dt.millisecondsSinceEpoch);  // Unix timestamp ms
}""";

  String arithmeticCode = """void main() {
  final now = DateTime(2025, 6, 15, 12, 0);

  // Add / subtract with Duration
  final tomorrow    = now.add(const Duration(days: 1));
  final lastWeek    = now.subtract(const Duration(days: 7));
  final in2Hours    = now.add(const Duration(hours: 2));
  final in90Mins    = now.add(const Duration(minutes: 90));

  print(tomorrow);    // 2025-06-16 12:00:00.000
  print(lastWeek);    // 2025-06-08 12:00:00.000

  // Difference between two DateTimes → Duration
  final conference = DateTime(2025, 9, 1);
  final diff = conference.difference(now);
  print(diff.inDays);     // 77
  print(diff.inHours);    // 1860

  // copyWith — change specific fields (Dart 2.17+)
  final newYear = now.copyWith(month: 1, day: 1);
  print(newYear);  // 2025-01-01 12:00:00.000
}""";

  String comparisonCode = """void main() {
  final a = DateTime(2025, 1, 1);
  final b = DateTime(2025, 6, 15);

  // Comparison operators
  print(a.isBefore(b));         // true
  print(b.isAfter(a));          // true
  print(a.isAtSameMomentAs(b)); // false

  // Sort a list of dates
  final dates = [b, a, DateTime(2025, 3, 10)];
  dates.sort((x, y) => x.compareTo(y));
  print(dates.first);  // 2025-01-01 00:00:00.000

  // Check if a date is today
  bool isToday(DateTime d) {
    final now = DateTime.now();
    return d.year == now.year && d.month == now.month && d.day == now.day;
  }
}""";

  String formattingCode = """// Dart has no built-in formatter — use the intl package.
// Add to pubspec.yaml: intl: ^0.18.1

import 'package:intl/intl.dart';

void main() {
  final dt = DateTime(2025, 6, 15, 14, 30);

  print(DateFormat('yyyy-MM-dd').format(dt));          // 2025-06-15
  print(DateFormat('dd/MM/yyyy').format(dt));          // 15/06/2025
  print(DateFormat('MMMM d, y').format(dt));           // June 15, 2025
  print(DateFormat('h:mm a').format(dt));              // 2:30 PM
  print(DateFormat('EEE, MMM d').format(dt));          // Sun, Jun 15
  print(DateFormat.yMMMMEEEEd().format(dt));           // Sunday, June 15, 2025
  print(DateFormat.Hm().format(dt));                   // 14:30

  // Manual formatting without intl
  String pad(int n) => n.toString().padLeft(2, '0');
  final manual = '\${dt.year}-\${pad(dt.month)}-\${pad(dt.day)}';
  print(manual);   // 2025-06-15
}""";

  List<String> tips = [
    'Always use DateTime.now() at the call site — never cache it in a const.',
    'Store times as UTC in databases; convert to local only for display.',
    'DateTime.parse() expects ISO 8601 — use tryParse() to avoid exceptions.',
    'Duration arithmetic can cross month/year boundaries correctly.',
    'Use the intl package for locale-aware date/time formatting.',
    'daylight saving: DateTime.now() respects DST automatically on most platforms.',
    'copyWith() (Dart 2.17+) is the cleanest way to adjust one field.',
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
      child: SideNavBarChildEnum.dateTimeInDart,
    );
    Get.find<AppBarController>().appBarTitle = SK.dateTime;
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
