
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@lazySingleton
class SharedPreferenceService {
  final SharedPreferences _pref;
  SharedPreferenceService({
    required SharedPreferences pref,
  }) : _pref = pref;


  Future<void> setData<T>({required String key, required T value}) async {
    try {
      if (value is int) {
        await _pref.setInt(key, value);
      } else if (value is String) {
        await _pref.setString(key, value);
      } else if (value is double) {
        await _pref.setDouble(key, value);
      } else if (value is bool) {
        await _pref.setBool(key, value);
      } else if (value is List<String>) {
        await _pref.setStringList(key, value);
      } else {
        throw Exception('Invalid value type');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  T? getData<T>({required String key}) {
    try {
      if (T is int) {
        return _pref.getInt(key) as T?;
      } else if (T is String) {
        return _pref.getString(key) as T?;
      } else if (T is double) {
        return _pref.getDouble(key) as T?;
      } else if (T is bool) {
        return _pref.getBool(key) as T?;
      } else if (T is List<String>) {
        return _pref.getStringList(key) as T?;
      } else {
        return _pref.get(key) as T?;
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Set<String> getKeys() {
    return _pref.getKeys();
  }

  Future<bool> deleteData({required String key}) async {
    return await _pref.remove(key);
  }

  Future<bool> clearData() async {
    return await _pref.clear();
  }
}