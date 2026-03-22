import 'package:dart_programing/app/routes/path.dart';
import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/modules/search/models/search_result.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSearchController extends GetxController {
  late TextEditingController textController;
  var query = RxString('');
  var selectedCategory = Rx<SearchCategory?>(null);
  var recentSearches = RxList<String>([]);

  static const List<SearchResult> _allContent = [
    // Dart topics
    SearchResult(title: 'Introduction to Dart', preview: 'What is Dart? Key features, typing, and use cases.', route: AppPath.INTRODUCION, category: SearchCategory.dart, matchedKeyword: 'dart introduction overview'),
    SearchResult(title: 'Variables in Dart', preview: 'var, final, const — differences and usage.', route: '${AppPath.INTRODUCION}/${AppPath.VARIABLE_IN_DART}', category: SearchCategory.dart, matchedKeyword: 'var final const variable'),
    SearchResult(title: 'Data Types in Dart', preview: 'int, double, String, bool, List, Map, Set.', route: '${AppPath.INTRODUCION}/${AppPath.DATA_TYPES_IN_DART}', category: SearchCategory.dart, matchedKeyword: 'data types int string bool'),
    SearchResult(title: 'Null Safety', preview: 'Nullable types, !, ??, late keyword.', route: AppPath.NullSAFETY, category: SearchCategory.dart, matchedKeyword: 'null safety nullable late'),
    SearchResult(title: 'Async & Await', preview: 'Asynchronous programming with Future, async, await.', route: AppPath.ASYNCANDAWAIT, category: SearchCategory.dart, matchedKeyword: 'async await future'),
    SearchResult(title: 'Streams', preview: 'Stream, StreamController, broadcast streams.', route: AppPath.STREAM, category: SearchCategory.dart, matchedKeyword: 'stream async'),
    SearchResult(title: 'Isolates', preview: 'Concurrency with Dart isolates, SendPort, ReceivePort.', route: AppPath.ISOLATE, category: SearchCategory.dart, matchedKeyword: 'isolate concurrency thread'),
    SearchResult(title: 'OOP in Dart', preview: 'Classes, objects, inheritance, polymorphism.', route: AppPath.OOPSINDART, category: SearchCategory.dart, matchedKeyword: 'oop class object inheritance'),
    SearchResult(title: 'Mixins', preview: 'Reuse code across class hierarchies with mixins.', route: AppPath.MIXINDART, category: SearchCategory.dart, matchedKeyword: 'mixin with'),
    SearchResult(title: 'Generics', preview: 'Type parameters, generic classes and functions.', route: AppPath.GENERIC, category: SearchCategory.dart, matchedKeyword: 'generics type parameter'),
    SearchResult(title: 'Extensions', preview: 'Add methods to existing types.', route: AppPath.EXTENSION, category: SearchCategory.dart, matchedKeyword: 'extension method'),
    SearchResult(title: 'Functions in Dart', preview: 'Named, anonymous, arrow, closures, higher-order.', route: AppPath.FUNCTIONS, category: SearchCategory.dart, matchedKeyword: 'function lambda closure'),
    SearchResult(title: 'Collections: List', preview: 'List operations, collection if/for.', route: AppPath.LISTINDART, category: SearchCategory.dart, matchedKeyword: 'list array collection'),
    SearchResult(title: 'Collections: Map', preview: 'Key-value pairs, iteration, manipulation.', route: AppPath.MAPINDART, category: SearchCategory.dart, matchedKeyword: 'map dictionary key value'),
    SearchResult(title: 'Exception Handling', preview: 'try/catch/finally, custom exceptions.', route: '${AppPath.CONDITIONS}/${AppPath.EXCEPTION}', category: SearchCategory.dart, matchedKeyword: 'exception error try catch'),

    // Flutter topics
    SearchResult(title: 'Flutter Introduction', preview: 'What is Flutter, how it works, architecture.', route: AppPath.FLUTTER_INTRO, category: SearchCategory.flutter, matchedKeyword: 'flutter introduction overview'),
    SearchResult(title: 'Flutter Setup', preview: 'Install Flutter SDK, set up IDE.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_SETUP}', category: SearchCategory.flutter, matchedKeyword: 'flutter setup install'),
    SearchResult(title: 'Stateless Widget', preview: 'Immutable widgets that depend only on configuration.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATELESS}', category: SearchCategory.flutter, matchedKeyword: 'stateless widget'),
    SearchResult(title: 'Stateful Widget', preview: 'Widgets with mutable state using setState.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATEFUL}', category: SearchCategory.flutter, matchedKeyword: 'stateful widget setstate'),
    SearchResult(title: 'ListView & GridView', preview: 'Scrollable lists and grids, builder pattern.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_LISTVIEW}', category: SearchCategory.flutter, matchedKeyword: 'listview gridview scroll'),
    SearchResult(title: 'Navigation & Routing', preview: 'Screen navigation, push, pop, named routes.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_NAVIGATION}', category: SearchCategory.flutter, matchedKeyword: 'navigation routing navigate'),
    SearchResult(title: 'go_router', preview: 'Declarative URL-based routing for Flutter.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_GOROUTER}', category: SearchCategory.flutter, matchedKeyword: 'go_router routing deep link'),
    SearchResult(title: 'State Management', preview: 'Overview of state management options.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_STATE_MGMT}', category: SearchCategory.flutter, matchedKeyword: 'state management provider bloc getx'),
    SearchResult(title: 'GetX State Management', preview: 'GetxController, Obx, GetBuilder, reactive state.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_GETX}', category: SearchCategory.flutter, matchedKeyword: 'getx state management reactive'),
    SearchResult(title: 'Networking with Dio', preview: 'HTTP requests with Dio, interceptors, REST API.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_DIO}', category: SearchCategory.flutter, matchedKeyword: 'dio http networking api'),
    SearchResult(title: 'Shared Preferences', preview: 'Persist simple key-value data locally.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_SHARED_PREF}', category: SearchCategory.flutter, matchedKeyword: 'shared preferences local storage'),
    SearchResult(title: 'Firebase in Flutter', preview: 'Firestore, Auth, Storage integration.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_FIREBASE}', category: SearchCategory.flutter, matchedKeyword: 'firebase firestore auth'),
    SearchResult(title: 'Animations', preview: 'Implicit, explicit, and Hero animations.', route: '${AppPath.FLUTTER_INTRO}/${AppPath.FLUTTER_ANIMATIONS}', category: SearchCategory.flutter, matchedKeyword: 'animation animated transition'),

    // Interview prep
    SearchResult(title: 'Dart Interview Q&A', preview: '30+ Dart interview questions with answers.', route: '${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_DART_QA}', category: SearchCategory.interview, matchedKeyword: 'dart interview questions qa'),
    SearchResult(title: 'Flutter Interview Q&A', preview: '30+ Flutter interview questions with answers.', route: '${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_FLUTTER_QA}', category: SearchCategory.interview, matchedKeyword: 'flutter interview questions qa'),
    SearchResult(title: 'Mock Interview', preview: 'Practice one question at a time with answer reveal.', route: '${AppPath.INTERVIEW_HOME}/${AppPath.INTERVIEW_MOCK}', category: SearchCategory.interview, matchedKeyword: 'mock interview practice'),

    // Best Guide
    SearchResult(title: 'Project Structure', preview: 'Organize Flutter project for scalability.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_STRUCTURE}', category: SearchCategory.guide, matchedKeyword: 'project structure folder organization'),
    SearchResult(title: 'Clean Architecture', preview: 'Layers, repository pattern, dependency injection.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_CLEAN_ARCH}', category: SearchCategory.guide, matchedKeyword: 'clean architecture layers'),
    SearchResult(title: 'Performance Tips', preview: 'Optimize rendering, memory, and startup time.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_PERFORMANCE}', category: SearchCategory.guide, matchedKeyword: 'performance optimization'),
    SearchResult(title: 'Responsive Design', preview: 'Build UIs that adapt to any screen size.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_RESPONSIVE}', category: SearchCategory.guide, matchedKeyword: 'responsive design adaptive'),
    SearchResult(title: 'Common Mistakes', preview: 'What to avoid and what to do instead.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_MISTAKES}', category: SearchCategory.guide, matchedKeyword: 'mistakes avoid best practices'),
    SearchResult(title: 'Useful Packages', preview: 'Essential pub.dev packages for Flutter apps.', route: '${AppPath.BEST_GUIDE_HOME}/${AppPath.BEST_GUIDE_PACKAGES}', category: SearchCategory.guide, matchedKeyword: 'packages plugins pub.dev'),
  ];

  List<SearchResult> get results {
    final q = query.value.trim().toLowerCase();
    if (q.isEmpty) return [];
    return _allContent.where((item) {
      final matchesQuery = item.title.toLowerCase().contains(q) ||
          item.preview.toLowerCase().contains(q) ||
          item.matchedKeyword.toLowerCase().contains(q);
      final matchesCategory = selectedCategory.value == null ||
          item.category == selectedCategory.value;
      return matchesQuery && matchesCategory;
    }).toList();
  }

  void onQueryChanged(String value) {
    query.value = value;
  }

  void setCategory(SearchCategory? cat) {
    selectedCategory.value = cat;
  }

  void addRecentSearch(String term) {
    if (term.trim().isEmpty) return;
    recentSearches.remove(term);
    recentSearches.insert(0, term);
    if (recentSearches.length > 8) {
      recentSearches.removeLast();
    }
  }

  void clearRecentSearches() {
    recentSearches.clear();
  }

  void selectRecent(String term) {
    textController.text = term;
    query.value = term;
  }

  @override
  void onInit() async {
    textController = TextEditingController();
    Get.find<SideMenuController>().selectPage(
      parent: SideNavBarParentEnum.search,
      child: SideNavBarChildEnum.searchPage,
    );
    Get.find<AppBarController>().appBarTitle = SK.search;
    update();
    super.onInit();
  }

  @override
  void onClose() {
    textController.dispose();
    super.onClose();
  }
}
