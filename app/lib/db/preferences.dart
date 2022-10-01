import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/switzerland/switzerland.dart';
import 'package:swift_travel/settings/properties/property.dart';

final preferencesProvider = Provider<PreferencesBloc>((r) => PreferencesBloc());

class PreferencesBloc {
  @visibleForTesting
  PreferencesBloc();

  static const String prefix = 'prefs_';
  static const String mapsKey = 'maps_app';
  static const String navigationApiKey = 'nav_api_id';
  static const String analyticsKey = 'accepted_analytics';

  final mapsApp = MappedSharedPreferencesProperty<NavigationApp, int>(
    prefix + mapsKey,
    defaultValue: NavigationApp.google,
    decode: (i) => NavigationApp.values[i],
    encode: (m) => m.index,
  );

  final api = MappedSharedPreferencesProperty<NavigationApiId, String>(
    prefix + navigationApiKey,
    defaultValue: searchChApi.id,
    decode: NavigationApiId.new,
    encode: (id) => id.value,
  );

  final useAnalytics = SimpleSharedPreferencesProperty<bool>(
      prefix + analyticsKey,
      defaultValue: true);

  final isDeveloper = SimpleSharedPreferencesProperty<bool>(
      '${prefix}is_developer',
      defaultValue: false);

  Future<void> loadFromPreferences({SharedPreferences? prefs}) async {
    final p = prefs ?? await SharedPreferences.getInstance();

    await Future.wait([
      mapsApp.init,
      api.init,
      useAnalytics.init,
      isDeveloper.init,
    ].map((e) => e(p)));
  }
}

enum NavigationApp {
  apple,
  google,
}

extension NavigationAppX on NavigationApp {
  String toStringFull() {
    switch (this) {
      case NavigationApp.apple:
        return 'Apple Maps';
      case NavigationApp.google:
        return 'Google Maps';
    }
  }
}

enum QuickActionsDisplays { stops, routes, generic }
