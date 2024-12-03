import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
class StorageService {
  late final SharedPreferences _prefs;
  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
  Future<bool> setList<T>(String key, List<T> value) async {
    String jsonString = jsonEncode(value);
    return await _prefs.setString(key, jsonString);
  }
  List<T> getList<T>(String key, T Function(Map<String, dynamic>) fromJson) {
    String? jsonString = _prefs.getString(key);
    if (jsonString == null) return [];

    List<dynamic> jsonList = jsonDecode(jsonString);
    return jsonList.map((item) => fromJson(item)).toList();
  }
  String? getStringByKey(String key) {
    return _prefs.getString(key);
  }
  bool? getBoolByKey(String key)  {
    return _prefs.getBool(key);
  }
  Future<void> deleteAllData() async {
    await _prefs.clear();
  }
}
class SecureStorageService {
  late final FlutterSecureStorage _secureStorage;
  SecureStorageService init() {
    _secureStorage = const FlutterSecureStorage();
    return this;
  }
  AndroidOptions _getAndroidOptions() => const AndroidOptions(
    encryptedSharedPreferences: true,
  );
  Future<void> writeSecureData(String key, String value) async {
    await _secureStorage.write(
        key: key, value: value, aOptions: _getAndroidOptions());
  }
  Future<String?> readSecureData(String key) async {
    var readData =
    await _secureStorage.read(key: key, aOptions: _getAndroidOptions());
    return readData;
  }
  Future<void> deleteSecureData(String key) async {
    await _secureStorage.delete(key: key, aOptions: _getAndroidOptions());
  }
  Future<void> deleteAllSecureData() async {
    await _secureStorage.deleteAll(aOptions: _getAndroidOptions());
  }
}