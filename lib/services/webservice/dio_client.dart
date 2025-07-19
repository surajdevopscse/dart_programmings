import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late final Dio _dio;

  DioClient._internal() {
    _dio = Dio();
    // You can add interceptors, base options, etc. here if needed
  }

  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    return _dio.get(
      url,
      queryParameters: queryParameters,
      options: Options(headers: _buildHeaders(headers, token)),
    );
  }

  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    return _dio.post(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: _buildHeaders(headers, token)),
    );
  }

  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    return _dio.put(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: _buildHeaders(headers, token)),
    );
  }

  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? token,
  }) async {
    return _dio.delete(
      url,
      data: data,
      queryParameters: queryParameters,
      options: Options(headers: _buildHeaders(headers, token)),
    );
  }

  Map<String, dynamic> _buildHeaders(
      Map<String, dynamic>? headers, String? token) {
    final Map<String, dynamic> result = {};
    if (headers != null) {
      result.addAll(headers);
    }
    if (token != null && token.isNotEmpty) {
      result['Authorization'] = 'Bearer $token';
    }
    return result;
  }
}
