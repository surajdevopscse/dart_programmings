import 'package:get/get.dart';
import '../../../models/blog_details_model.dart';
import '../../../services/webservice/dio_client.dart';

class BlogController extends GetxController {
  var isLoading = false.obs;
  var error = ''.obs;
  var blogData = Rxn<BlogDetailsModel>();

  Future<void> fetchBlogById(String id, {String? token}) async {
    isLoading.value = true;
    error.value = '';
    blogData.value = null;
    try {
      final response = await DioClient().get(
        'https://localhost:44370/api/posts/$id',
        token: "my_super_secret_fixed_token_for_blog",
      );
      blogData.value = BlogDetailsModel.fromJson(response.data);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }
}
