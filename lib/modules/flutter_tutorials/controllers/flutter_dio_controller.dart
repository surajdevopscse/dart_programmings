import 'package:dart_programing/app/views/enum/side_menu_enum.dart';
import 'package:dart_programing/app/views/side_menu/side_menu_controller.dart';
import 'package:dart_programing/modules/home/controllers/app_bar_controller.dart';
import 'package:dart_programing/utils/constants/strings/string_keys.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FlutterDioController extends GetxController {
  bool showBackToTopButton = false;
  late ScrollController scrollController;

  String intro = 'Dio is a powerful HTTP client for Flutter/Dart that supports interceptors, global configuration, FormData, request cancellation, file downloading, timeout, and custom adapters.';
  String setupCode = '''# pubspec.yaml
# dependencies:
#   dio: ^5.3.0

import 'package:dio/dio.dart';

// Create a Dio instance with base configuration
final dio = Dio(BaseOptions(
  baseUrl: 'https://api.example.com',
  connectTimeout: const Duration(seconds: 5),
  receiveTimeout: const Duration(seconds: 10),
  headers: {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  },
));

// Singleton service class
class ApiService {
  static final ApiService _instance = ApiService._internal();
  factory ApiService() => _instance;
  ApiService._internal();

  final Dio _dio = Dio(BaseOptions(
    baseUrl: 'https://api.example.com',
    connectTimeout: const Duration(seconds: 5),
    receiveTimeout: const Duration(seconds: 10),
  ));
}''';
  String interceptorCode = '''// Interceptors — middleware for requests and responses
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Add token to every request
    final token = StorageService.getToken();
    options.headers['Authorization'] = 'Bearer \$token';
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // Log responses
    print('RESPONSE[\${response.statusCode}]: \${response.requestOptions.uri}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 — refresh token and retry
    if (err.response?.statusCode == 401) {
      refreshTokenAndRetry(err, handler);
    } else {
      super.onError(err, handler);
    }
  }
}

// Add interceptors to dio
dio.interceptors.add(AuthInterceptor());
dio.interceptors.add(LogInterceptor(responseBody: true));''';
  String getCode = '''// GET request with Dio
Future<List<User>> getUsers() async {
  try {
    final response = await dio.get(
      '/users',
      queryParameters: {'page': 1, 'limit': 20},
    );
    final List data = response.data as List;
    return data.map((json) => User.fromJson(json)).toList();
  } on DioException catch (e) {
    throw _handleError(e);
  }
}

// Error handling helper
Exception _handleError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      return Exception('Connection timeout');
    case DioExceptionType.receiveTimeout:
      return Exception('Response timeout');
    case DioExceptionType.badResponse:
      return Exception('Server error: \${e.response?.statusCode}');
    case DioExceptionType.connectionError:
      return Exception('No internet connection');
    default:
      return Exception('Unexpected error: \${e.message}');
  }
}''';
  String postCode = '''// POST with JSON body
Future<User> createUser(String name, String email) async {
  final response = await dio.post(
    '/users',
    data: {'name': name, 'email': email},
  );
  return User.fromJson(response.data);
}

// Upload file with FormData
Future<void> uploadAvatar(String filePath) async {
  final formData = FormData.fromMap({
    'file': await MultipartFile.fromFile(filePath, filename: 'avatar.jpg'),
    'userId': '123',
  });

  await dio.post('/upload', data: formData,
    onSendProgress: (sent, total) {
      print('Upload: \${(sent / total * 100).toStringAsFixed(1)}%');
    },
  );
}

// Cancel request
final cancelToken = CancelToken();
Future<void> cancelableRequest() async {
  try {
    await dio.get('/long-request', cancelToken: cancelToken);
  } on DioException catch (e) {
    if (CancelToken.isCancel(e)) print('Request cancelled');
  }
}
// Cancel it: cancelToken.cancel('User cancelled');''';
  List<String> tips = [
    'Use interceptors for token refresh, logging, and error formatting',
    'BaseOptions sets default headers and timeouts for all requests',
    'CancelToken allows you to cancel in-flight requests',
    'Use Dio\'s built-in FormData for multipart uploads',
    'LogInterceptor is great for debugging API responses',
    'RetryInterceptor (dio_retry package) handles automatic retries',
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
      child: SideNavBarChildEnum.flutterDio,
    );
    Get.find<AppBarController>().appBarTitle = SK.flutterDio;
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
