import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends GetxService {
  late final SharedPreferences _prefs;

  Future<SharedPreferenceService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setInt(String key, int value) => _prefs.setInt(key, value);
  int? getInt(String key) => _prefs.getInt(key);

  Future<bool> setBool(String key, bool value) => _prefs.setBool(key, value);
  bool? getBool(String key) => _prefs.getBool(key);

  Future<bool> setDouble(String key, double value) =>
      _prefs.setDouble(key, value);
  double? getDouble(String key) => _prefs.getDouble(key);

  Future<bool> setString(String key, String value) =>
      _prefs.setString(key, value);
  String? getString(String key) => _prefs.getString(key);

  Future<bool> setStringList(String key, List<String> value) =>
      _prefs.setStringList(key, value);
  List<String>? getStringList(String key) => _prefs.getStringList(key);

  /// Clear All
  Future<void> clearAll() async {
    await _prefs.clear();
    await AdaptiveTheme.of(Get.context!).persist();
  }
}
