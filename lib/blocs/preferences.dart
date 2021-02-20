import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

final preferencesProvider = ChangeNotifierProvider((r) => PreferencesBloc('prefs_'));

class PreferencesBloc extends ChangeNotifier {
  PreferencesBloc(this.prefix);

  static const String mapsKey = 'maps_app';
  static const String navigationAPIKey = 'navigation_api';
  final String prefix;
  late SharedPreferences _prefs;

  Maps _maps = Maps.google;
  NavigationApi _api = NavigationApi.sbb;

  Future<void> _syncToPrefs(String key, int index) async {
    notifyListeners();
    await _prefs.setInt(key, api.index);
  }

  Maps get mapsApp => _maps;

  set mapsApp(Maps maps) {
    _maps = maps;
    _syncToPrefs(mapsKey, maps.index);
  }

  NavigationApi get api => _api;

  set api(NavigationApi api) {
    _api = api;
    _syncToPrefs(navigationAPIKey, api.index);
  }

  Future<void> loadFromPreferences({SharedPreferences? prefs}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();

    _maps = _getEnum(mapsKey, Maps.values) ?? _maps;
    _api = _getEnum(navigationAPIKey, NavigationApi.values) ?? _api;

    notifyListeners();
  }

  T? _getEnum<T>(String key, List<T> values) {
    final i = _prefs.getInt(key);
    return i != null && i >= 0 && i < values.length ? values[i] : null;
  }
}

enum Maps {
  apple,
  google,
}

enum QuickActionsDisplays { stops, routes, generic }
