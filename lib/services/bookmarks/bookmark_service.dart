import 'package:dart_programing/services/shared_preference_service/shared_preference_service.dart';
import 'package:get/get.dart';

class BookmarkService extends GetxController {
  final SharedPreferenceService _prefs = Get.find();

  List<String> getBookmarks() => _prefs.getStringList('bookmarks') ?? [];

  bool isBookmarked(String routePath) => getBookmarks().contains(routePath);

  Future<void> toggleBookmark(String routePath, String title) async {
    final list = getBookmarks();
    if (list.contains(routePath)) {
      list.remove(routePath);
    } else {
      list.add(routePath);
      await _prefs.setString('bookmark_title_$routePath', title);
    }
    await _prefs.setStringList('bookmarks', list);
    update();
  }
}
