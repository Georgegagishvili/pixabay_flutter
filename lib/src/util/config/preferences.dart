import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static Preferences? _instance;
  SharedPreferences _client;

  static Preferences get instance {
    if (_instance == null) {
      throw StateError('Preferences not initialized. call #create() first');
    }
    return _instance!;
  }

  Preferences(SharedPreferences client) : _client = client;

  factory Preferences.create(SharedPreferences client) {
    if (_instance != null) {
      debugPrint('Preferences are already initialized');
      return _instance!;
    }

    _instance = Preferences(client);
    return _instance!;
  }

  void setString(key, value) {
    _client.setString(key, value);
  }

  void setBool(key, value) {
    _client.setBool(key, value);
  }

  void setInt(key, value) {
    _client.setInt(key, value);
  }

  void setDouble(key, value) {
    _client.setDouble(key, value);
  }

  void setStringList(key, value) {
    _client.setStringList(key, value);
  }

  String? getString(key) {
    return _client.getString(key);
  }

  bool? getBool(key) {
    return _client.getBool(key);
  }

  int? getInt(key) {
    return _client.getInt(key);
  }

  double? getDouble(key) {
    return _client.getDouble(key);
  }

  List<String>? getStringList(key) {
    return _client.getStringList(key);
  }

  void removeKey(key) {
    _client.remove(key);
  }
}

class PreferenceKeys{
  static const String USER_TOKEN = 'userToken';
}