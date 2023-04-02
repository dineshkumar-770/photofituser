import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static SharedPreferencesHelper? _instance;
  static SharedPreferences? _preferences;

  SharedPreferencesHelper._internal();

  static Future<SharedPreferencesHelper> getInstance() async {
    _instance ??= SharedPreferencesHelper._internal();
    _preferences ??= await SharedPreferences.getInstance();
    return _instance!;
  }

  Future<bool> setString(String key, String value) async {
    return _preferences!.setString(key, value);
  }

  String? getString(String key) {
    return _preferences!.getString(key);
  }

  Future<bool> setBool(String key, bool value) async {
    return _preferences!.setBool(key, value);
  }

  bool? getBool(String key) {
    return _preferences!.getBool(key);
  }

  Future<bool> setInt(String key, int value) async {
    return _preferences!.setInt(key, value);
  }

  int? getInt(String key) {
    return _preferences!.getInt(key);
  }

  Future<bool> setDouble(String key, double value) async {
    return _preferences!.setDouble(key, value);
  }

  double? getDouble(String key) {
    return _preferences!.getDouble(key);
  }

  Future<bool> setStringList(String key, List<String> value) async {
    return _preferences!.setStringList(key, value);
  }

  List<String>? getStringList(String key) {
    return _preferences!.getStringList(key);
  }
}
