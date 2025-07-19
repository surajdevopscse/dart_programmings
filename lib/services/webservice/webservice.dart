import 'package:get/get.dart';
import 'package:dart_programing/models/blog_post.dart';
import 'dio_client.dart';

class Webservice extends GetxService {
  Future<Webservice> init() async {
    return this;
  }

  Future<List<BlogPost>> fetchBlogs({int page = 1, int pageSize = 10}) async {
    final String url =
        'https://localhost:44370/api/posts/cards?page=$page&pageSize=$pageSize';
    final response = await DioClient()
        .get(url, token: "my_super_secret_fixed_token_for_blog");
    if (response.statusCode == 200) {
      final data = response.data;
      if (data is List) {
        return data.map((e) => BlogPost.fromJson(e)).toList();
      } else if (data is Map && data['blogs'] is List) {
        return (data['blogs'] as List)
            .map((e) => BlogPost.fromJson(e))
            .toList();
      }
    }
    return [];
  }
}
