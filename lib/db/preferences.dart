import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';

final preferencesProvider = ChangeNotifierProvider<PreferencesBloc>((r) => PreferencesBloc.i);

class PreferencesBloc extends ChangeNotifier {
  PreferencesBloc(this.prefix);

  static const String mapsKey = 'maps_app';
  static const String useAnalyticsKey = 'navigation_api';
  static const String analyticsKey = 'accepted_analytics';
  static late final i = PreferencesBloc('prefs_');
  final String prefix;
  late SharedPreferences _prefs;

  Maps _maps = Maps.google;
  NavigationApi _api = NavigationApi.sbb;

  Future<void> _syncToPrefs(String key, int index) async {
    notifyListeners();
    await _prefs.setInt(prefix + key, api.index);
  }

  Maps get mapsApp => _maps;
  set mapsApp(Maps maps) {
    _maps = maps;
    _syncToPrefs(mapsKey, maps.index);
  }

  NavigationApi get api => _api;
  set api(NavigationApi api) {
    _api = api;
    _syncToPrefs(useAnalyticsKey, api.index);
  }

  bool _useAnalytics = true;

  bool get useAnalytics => _useAnalytics;
  set useAnalytics(bool val) {
    _useAnalytics = val;
    notifyListeners();
    _prefs.setBool(prefix + analyticsKey, val);
  }

  Future<void> loadFromPreferences({SharedPreferences? prefs}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();

    _maps = _getEnum(mapsKey, Maps.values, _maps);
    _api = _getEnum(useAnalyticsKey, NavigationApi.values, _api);
    _useAnalytics = _getBool(analyticsKey, _useAnalytics);

    notifyListeners();
  }

  bool _getBool(String key, bool defaultValue) => _prefs.getBool(prefix + key) ?? defaultValue;

  T _getEnum<T>(String key, List<T> values, T defaultValue) {
    final i = _prefs.getInt(prefix + key);
    return i != null && i >= 0 && i < values.length ? values[i] : defaultValue;
  }
}

enum Maps {
  apple,
  google,
}

enum QuickActionsDisplays { stops, routes, generic }
