import 'package:dart_programing/services/shared_preference_service/shared_preference_service.dart';
import 'package:get/get.dart';

class ProgressService extends GetxController {
  final SharedPreferenceService _prefs = Get.find();

  bool isCompleted(String routePath) =>
      _prefs.getBool('progress_$routePath') ?? false;

  Future<void> markComplete(String routePath) =>
      _prefs.setBool('progress_$routePath', true);

  Future<void> toggleComplete(String routePath) =>
      _prefs.setBool('progress_$routePath', !isCompleted(routePath));

  double sectionProgress(List<String> sectionRoutes) {
    if (sectionRoutes.isEmpty) return 0;
    final completed = sectionRoutes.where(isCompleted).length;
    return completed / sectionRoutes.length;
  }
}
