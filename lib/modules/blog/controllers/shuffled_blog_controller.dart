import 'package:get/get.dart';
import 'package:dart_programing/models/blog_post.dart';
import 'package:dart_programing/services/webservice/webservice.dart';

class ShuffledBlogController extends GetxController {
  final Webservice _webService = Webservice();
  final RxList<BlogPost> shuffledBlogs = <BlogPost>[].obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAndShuffleBlogs();
  }

  Future<void> fetchAndShuffleBlogs() async {
    isLoading.value = true;
    error.value = '';

    try {
      final blogs = await _webService.fetchBlogs();
      // Shuffle the blogs
      final shuffled = List<BlogPost>.from(blogs);
      shuffled.shuffle();
      shuffledBlogs.value = shuffled;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void refreshBlogs() {
    fetchAndShuffleBlogs();
  }
}
