abstract class SharedPreferencesInterface {
  //Inicia a instância do sharedPreference
  Future<void> initializeInstance();
  //Map
  Future<bool> setMap(String key, Map<String, dynamic> value);
  Future<Map<String, dynamic>>? getMap(String key);

  //Bool
  Future<bool> setBool(String key, bool value);
  Future<bool?> getBool(String key, bool value);

  //Clear
  Future<void> clear(String key);
  Future<void> clearAll();

  //String
  Future<bool> setString(String key, String value);
  Future<String?> getString(String key);

  //List String
  Future<bool> setStringList(String key, List<String> value);
  List<String>? getStringList(String key);
}
