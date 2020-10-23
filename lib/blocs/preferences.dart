import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferencesProvider = ChangeNotifierProvider((r) => PreferencesBloc());

class PreferencesBloc extends ChangeNotifier {
  static const String mapsKey = "maps_app";
  static const String navigationAPIKey = "navigation_api";
  SharedPreferences _prefs;
  Maps _maps;
  NavigationApiType _api;

  NavigationApiType get api => _api;

  set api(NavigationApiType api) {
    _api = api;
    _syncToPrefs(navigationAPIKey, api.index);
  }

  Future<void> _syncToPrefs(String key, int index) async {
    notifyListeners();
    await _prefs.setInt(key, api.index);
  }

  Maps get mapsApp => _maps;

  set mapsApp(Maps maps) {
    _maps = maps;
    _syncToPrefs(mapsKey, maps.index);
  }

  Future<void> loadFromPreferences({SharedPreferences prefs}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();

    _maps = _getEnum(mapsKey, Maps.values, Maps.google);
    _api = _getEnum(navigationAPIKey, NavigationApiType.values, NavigationApiType.cff);

    notifyListeners();
  }

  T _getEnum<T>(String key, List<T> values, T defaultValue) {
    final i = _prefs.getInt(key);
    return i != null && i >= 0 && i < values.length ? values[i] : defaultValue;
  }
}

enum Maps { apple, google }

enum QuickActionsDisplays { stops, routes, generic }

enum NavigationApiType { sncf, cff }
