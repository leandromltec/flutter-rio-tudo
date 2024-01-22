import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'storage.dart';

class SharedPreferenceStorage implements SharedPreferencesInterface {
  late SharedPreferences _sharedPreferences;

  @override
  Future<void> initializeInstance() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  @override
  Future<void> clear(String key) async {
    _sharedPreferences.remove(key);
  }

  @override
  Future<void> clearAll() async {
    _sharedPreferences.clear();
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    return _sharedPreferences.setBool(key, value);
  }

  @override
  Future<bool?> getBool(String key, bool value) async {
    return _sharedPreferences.getBool(key);
  }

  @override
  Future<bool> setMap(String key, Map<String, dynamic> value) {
    return _sharedPreferences.setString(key, jsonEncode(value));
  }

  @override
  Future<Map<String, dynamic>>? getMap(String key) async {
    final String? valueMap = _sharedPreferences.getString(key);
    return jsonDecode(valueMap!);
  }

  @override
  List<String>? getStringList(String key) {
    return _sharedPreferences.getStringList(key);
  }

  @override
  Future<bool> setStringList(String key, List<String> value) {
    return _sharedPreferences.setStringList(key, value);
  }

  @override
  Future<bool> setString(String key, String value) {
    return _sharedPreferences.setString(key, value);
  }

  @override
  Future<String?> getString(String key) async {
    return _sharedPreferences.getString(key);
  }
}
