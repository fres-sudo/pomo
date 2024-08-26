import 'package:cookie_jar/cookie_jar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefStorage implements Storage {
  SharedPreferences? _prefs;
  final _keyPrefix = "cookie_store_";

  @override
  Future<void> init(
      [bool persistSession = true, bool ignoreExpires = false]) async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  Future<void> write(String key, Object value) async {
    // Ensure _prefs has been initialized before using it
    _prefs ??= await SharedPreferences.getInstance();

    _prefs!.setString(_keyPrefix + key, value.toString());
  }

  @override
  Future<String?> read(String key) async {
    // Ensure _prefs has been initialized before using it
    _prefs ??= await SharedPreferences.getInstance();

    final value = _prefs!.getString(_keyPrefix + key);
    return value;
  }

  @override
  Future<void> delete(String key) async {
    // Ensure _prefs has been initialized before using it
    _prefs ??= await SharedPreferences.getInstance();

    await _prefs!.remove(_keyPrefix + key);
  }

  Future<void> clear() async {
    // Ensure _prefs has been initialized before using it
    _prefs ??= await SharedPreferences.getInstance();

    var keys = _prefs!.getKeys();
    for (String key in keys) {
      if (key.startsWith(_keyPrefix)) {
        await _prefs!.remove(key);
      }
    }
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    // Ensure _prefs has been initialized before using it
    _prefs ??= await SharedPreferences.getInstance();

    for (var key in keys) {
      await _prefs!.remove(_keyPrefix + key);
    }
  }
}