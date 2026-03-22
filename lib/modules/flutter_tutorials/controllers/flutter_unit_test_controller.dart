import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterUnitTestController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Unit tests verify that individual functions, methods, and classes work correctly in isolation. They are fast, easy to write, and should make up the bulk of your test suite.';
  String basicTestCode = '''import 'package:test/test.dart';

// Class to test
class StringUtils {
  static String capitalize(String s) {
    if (s.isEmpty) return s;
    return s[0].toUpperCase() + s.substring(1).toLowerCase();
  }

  static bool isValidEmail(String email) {
    return RegExp(r'^[\\w-\\.]+@[\\w-]+\\.[a-z]{2,4}\$').hasMatch(email);
  }

  static List<String> splitWords(String sentence) {
    return sentence.trim().split(RegExp(r'\\s+'));
  }
}

void main() {
  group('StringUtils', () {
    test('capitalize works for normal strings', () {
      expect(StringUtils.capitalize('hello'), equals('Hello'));
      expect(StringUtils.capitalize('WORLD'), equals('World'));
      expect(StringUtils.capitalize('dart'), equals('Dart'));
    });

    test('capitalize handles empty string', () {
      expect(StringUtils.capitalize(''), equals(''));
    });

    test('isValidEmail validates correctly', () {
      expect(StringUtils.isValidEmail('user@example.com'), isTrue);
      expect(StringUtils.isValidEmail('invalid-email'), isFalse);
      expect(StringUtils.isValidEmail('missing@domain'), isFalse);
    });

    test('splitWords handles multiple spaces', () {
      expect(StringUtils.splitWords('hello   world'), equals(['hello', 'world']));
      expect(StringUtils.splitWords('  trim me  '), equals(['trim', 'me']));
    });
  });
}''';
  String groupCode = '''import 'package:test/test.dart';

// Testing async code
class UserRepository {
  Future<User> fetchUser(int id) async {
    await Future.delayed(const Duration(milliseconds: 100));
    if (id <= 0) throw ArgumentError('Invalid ID');
    return User(id: id, name: 'User \$id');
  }

  Future<List<User>> fetchAll() async {
    await Future.delayed(const Duration(milliseconds: 200));
    return [User(id: 1, name: 'Alice'), User(id: 2, name: 'Bob')];
  }
}

void main() {
  group('UserRepository', () {
    late UserRepository repo;

    setUp(() => repo = UserRepository());

    test('fetchUser returns user with correct id', () async {
      final user = await repo.fetchUser(1);
      expect(user.id, equals(1));
      expect(user.name, startsWith('User'));
    });

    test('fetchUser throws on invalid id', () async {
      expect(() => repo.fetchUser(0), throwsArgumentError);
      expect(() => repo.fetchUser(-5), throwsArgumentError);
    });

    test('fetchAll returns non-empty list', () async {
      final users = await repo.fetchAll();
      expect(users, isNotEmpty);
      expect(users.length, greaterThan(0));
    });

    test('fetchAll contains expected names', () async {
      final users = await repo.fetchAll();
      final names = users.map((u) => u.name).toList();
      expect(names, containsAll(['Alice', 'Bob']));
    });
  });
}''';
  String mockCode = '''import 'package:test/test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

// Generate mocks: flutter pub run build_runner build
@GenerateMocks([UserRepository, AuthService])
import 'user_service_test.mocks.dart';

class UserService {
  final UserRepository _repo;
  final AuthService _auth;

  UserService(this._repo, this._auth);

  Future<User> getCurrentUser() async {
    final token = await _auth.getToken();
    if (token == null) throw Exception('Not authenticated');
    return await _repo.fetchUser(1);
  }
}

void main() {
  late MockUserRepository mockRepo;
  late MockAuthService mockAuth;
  late UserService service;

  setUp(() {
    mockRepo = MockUserRepository();
    mockAuth = MockAuthService();
    service = UserService(mockRepo, mockAuth);
  });

  test('getCurrentUser returns user when authenticated', () async {
    // Arrange
    when(mockAuth.getToken()).thenAnswer((_) async => 'valid-token');
    when(mockRepo.fetchUser(1)).thenAnswer((_) async => User(id: 1, name: 'Alice'));

    // Act
    final user = await service.getCurrentUser();

    // Assert
    expect(user.name, equals('Alice'));
    verify(mockAuth.getToken()).called(1);
    verify(mockRepo.fetchUser(1)).called(1);
  });

  test('getCurrentUser throws when not authenticated', () async {
    when(mockAuth.getToken()).thenAnswer((_) async => null);
    expect(service.getCurrentUser(), throwsException);
    verifyNever(mockRepo.fetchUser(any));
  });
}''';
  List<String> tips = [
    'Each test should verify one specific behavior',
    'Use descriptive test names: what it does, with what input, expected result',
    'Arrange-Act-Assert (AAA) pattern keeps tests readable',
    'Mock external dependencies (HTTP, DB) to keep tests fast and reliable',
    'Test both happy path and edge cases/error conditions',
    'Use expect() matchers: equals, isTrue, throwsException, isA<Type>(), etc.',
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
      child: SideNavBarChildEnum.flutterUnitTest,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterUnitTest;
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
