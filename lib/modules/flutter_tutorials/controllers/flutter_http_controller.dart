import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterHttpController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'The http package is the official Flutter HTTP client for making network requests. It provides simple methods for GET, POST, PUT, DELETE operations with support for headers and JSON body.';
  String getCode = '''# pubspec.yaml
# dependencies:
#   http: ^1.1.0

import 'package:http/http.dart' as http;
import 'dart:convert';

// GET — retrieve data
Future<void> getRequest() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  final response = await http.get(
    url,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer your-token-here',
    },
  );

  if (response.statusCode == 200) {
    final List<dynamic> posts = jsonDecode(response.body);
    print('Got \${posts.length} posts');
  } else {
    throw Exception('GET failed: \${response.statusCode}');
  }
}''';
  String postCode = '''// POST — create new resource
Future<Map<String, dynamic>> createPost({
  required String title,
  required String body,
  required int userId,
}) async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

  final response = await http.post(
    url,
    headers: {
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({
      'title': title,
      'body': body,
      'userId': userId,
    }),
  );

  if (response.statusCode == 201) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('POST failed: \${response.statusCode}');
  }
}''';
  String putCode = '''// PUT — update entire resource
Future<void> updatePost(int id, String title, String body) async {
  final response = await http.put(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/\$id'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({'id': id, 'title': title, 'body': body, 'userId': 1}),
  );

  if (response.statusCode != 200) {
    throw Exception('PUT failed: \${response.statusCode}');
  }
}

// PATCH — partial update
Future<void> patchPost(int id, String title) async {
  final response = await http.patch(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/\$id'),
    headers: {'Content-Type': 'application/json; charset=UTF-8'},
    body: jsonEncode({'title': title}),
  );

  if (response.statusCode != 200) {
    throw Exception('PATCH failed');
  }
}''';
  String deleteCode = '''// DELETE — remove resource
Future<void> deletePost(int id) async {
  final response = await http.delete(
    Uri.parse('https://jsonplaceholder.typicode.com/posts/\$id'),
    headers: {'Authorization': 'Bearer your-token'},
  );

  if (response.statusCode == 200) {
    print('Post \$id deleted successfully');
  } else {
    throw Exception('DELETE failed: \${response.statusCode}');
  }
}

// Using Client for multiple requests (more efficient)
Future<void> multipleRequests() async {
  final client = http.Client();
  try {
    final response1 = await client.get(Uri.parse('https://api.example.com/1'));
    final response2 = await client.get(Uri.parse('https://api.example.com/2'));
    // process responses...
  } finally {
    client.close(); // always close the client
  }
}''';
  List<String> tips = [
    'Always specify Content-Type header for POST/PUT/PATCH requests',
    'Use http.Client() for multiple requests to reuse the connection',
    'Add timeout: const Duration(seconds: 30) to avoid hanging requests',
    'Encode request body with jsonEncode() and decode response with jsonDecode()',
    'Check response.statusCode before processing the response body',
    'For file uploads, use http.MultipartRequest',
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
      child: SideNavBarChildEnum.flutterHttp,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterHttp;
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
