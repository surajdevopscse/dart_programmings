import 'package:dart_programing/services/shared_preference_service/shared_preference_service.dart';
import 'package:get/get.dart';

enum ProgressState { notStarted, inProgress, completed }

class ProgressService extends GetxController {
  final SharedPreferenceService _prefs = Get.find();

  // Use a new prefix so old bool-based data doesn't conflict.
  static const String _prefix = 'prog2_';

  ProgressState getProgress(String routePath) {
    final val = _prefs.getString('$_prefix$routePath');
    if (val == 'completed') return ProgressState.completed;
    if (val == 'inProgress') return ProgressState.inProgress;
    return ProgressState.notStarted;
  }

  bool isCompleted(String routePath) =>
      getProgress(routePath) == ProgressState.completed;

  /// Marks a page as in-progress only when it was not started yet.
  Future<void> markInProgress(String routePath) async {
    if (getProgress(routePath) == ProgressState.notStarted) {
      await _prefs.setString('$_prefix$routePath', 'inProgress');
      update();
    }
  }

  /// Always marks a page as completed (called on scroll-to-bottom or via button).
  Future<void> markCompleted(String routePath) async {
    if (!isCompleted(routePath)) {
      await _prefs.setString('$_prefix$routePath', 'completed');
      update();
    }
  }

  /// Toggle: completed → inProgress, anything else → completed.
  Future<void> toggleComplete(String routePath) async {
    if (getProgress(routePath) == ProgressState.completed) {
      await _prefs.setString('$_prefix$routePath', 'inProgress');
    } else {
      await _prefs.setString('$_prefix$routePath', 'completed');
    }
    update();
  }

  double sectionProgress(List<String> sectionRoutes) {
    if (sectionRoutes.isEmpty) return 0;
    final completed = sectionRoutes.where(isCompleted).length;
    return completed / sectionRoutes.length;
  }
}
