import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterNetworkingController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Networking in Flutter involves making HTTP requests to REST APIs, handling JSON responses, and managing asynchronous operations. The http package and Dio are the two most popular choices for HTTP networking.';
  String httpBasicsCode = '''// HTTP methods overview
// GET    — retrieve data
// POST   — create new resource
// PUT    — update entire resource
// PATCH  — partial update
// DELETE — remove resource

// REST API concepts:
// Endpoint: https://api.example.com/users
// Headers: Authorization, Content-Type, Accept
// Body: JSON payload for POST/PUT/PATCH
// Status codes:
//   200 OK, 201 Created, 204 No Content
//   400 Bad Request, 401 Unauthorized, 403 Forbidden
//   404 Not Found, 500 Internal Server Error

// JSON model class
class User {
  final int id;
  final String name;
  final String email;

  User({required this.id, required this.name, required this.email});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int,
    name: json['name'] as String,
    email: json['email'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'email': email,
  };
}''';
  String jsonParseCode = '''import 'dart:convert';

// Parse JSON list
Future<List<User>> fetchUsers() async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users'),
  );
  if (response.statusCode == 200) {
    final List<dynamic> jsonList = jsonDecode(response.body);
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
  throw Exception('Failed to load users: \${response.statusCode}');
}

// Parse single JSON object
Future<User> fetchUser(int id) async {
  final response = await http.get(
    Uri.parse('https://jsonplaceholder.typicode.com/users/\$id'),
  );
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  }
  throw Exception('User not found');
}''';
  String errorHandlingCode = '''// Proper error handling pattern
class ApiResult<T> {
  final T? data;
  final String? error;
  bool get isSuccess => data != null;

  ApiResult.success(this.data) : error = null;
  ApiResult.failure(this.error) : data = null;
}

Future<ApiResult<List<User>>> fetchUsersWithHandling() async {
  try {
    final response = await http
        .get(Uri.parse('https://api.example.com/users'))
        .timeout(const Duration(seconds: 10));

    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body);
      final users = jsonList.map((j) => User.fromJson(j)).toList();
      return ApiResult.success(users);
    } else {
      return ApiResult.failure('Server error: \${response.statusCode}');
    }
  } on SocketException {
    return ApiResult.failure('No internet connection');
  } on TimeoutException {
    return ApiResult.failure('Request timed out');
  } on FormatException {
    return ApiResult.failure('Invalid response format');
  } catch (e) {
    return ApiResult.failure('Unexpected error: \$e');
  }
}''';
  List<String> tips = [
    'Always handle network errors — SocketException for no internet',
    'Use timeout() to prevent requests from hanging indefinitely',
    'Add connectivity_plus package to check network availability',
    'Cache responses locally to improve UX when offline',
    'Use https (TLS) in production; never send credentials over http',
    'Add Authorization header for authenticated API requests',
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
      child: SideNavBarChildEnum.flutterNetworking,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterNetworking;
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
