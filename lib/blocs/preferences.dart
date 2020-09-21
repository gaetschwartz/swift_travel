import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final mapsAppProvider = ChangeNotifierProvider((r) => PreferencesBloc());

class PreferencesBloc extends ChangeNotifier {
  static const mapsKey = "maps_app";
  SharedPreferences _prefs;
  Maps _maps;

  Maps get mapsApp => _maps;

  set mapsApp(Maps maps) {
    _maps = maps;
    () async {
      await _prefs.setInt(mapsKey, maps.index);
      if (hasListeners) notifyListeners();
    }();
  }

  Future<void> loadFromPreferences(
      {SharedPreferences prefs, Maps defaultApp = Maps.google}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();
    final i = _prefs.getInt(mapsKey) ?? -1;
    _maps = i >= 0 && i < Maps.values.length ? Maps.values[i] : defaultApp;
  }
}

enum Maps { apple, google }

enum QuickActionsDisplays { stops, routes, generic }
