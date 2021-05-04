import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/apis/navigation/search.ch/search_ch.dart';
import 'package:swift_travel/pages/settings/properties/property.dart';

final preferencesProvider = Provider<PreferencesBloc>((r) => PreferencesBloc.i);

class PreferencesBloc {
  PreferencesBloc(this.prefix);

  static const String mapsKey = 'maps_app';
  static const String navigationApiKey = 'nav_api_id';
  static const String analyticsKey = 'accepted_analytics';
  static late final i = PreferencesBloc('prefs_');

  static late final ChangeNotifierProvider<Property<NavigationApiId>> apiProvider =
      ChangeNotifierProvider((r) => r.watch(preferencesProvider).api);

  final String prefix;
  late SharedPreferences _prefs;

  Future<void> _syncToPrefs(String key, int index) => _prefs.setInt(prefix + key, index);

  T _getEnum<T>(String key, List<T> values, T defaultValue) {
    final i = _prefs.getInt(prefix + key);
    return i != null && i >= 0 && i < values.length ? values[i] : defaultValue;
  }

  late final mapsApp = AsyncProperty<Maps>(
    defaultValue: Maps.google,
    onSet: (v) => _syncToPrefs(mapsKey, v.index),
    getValue: (d) => _getEnum(mapsKey, Maps.values, d),
  );

  late final api = AsyncProperty<NavigationApiId>(
    defaultValue: searchChApi.id,
    onSet: (v) => _prefs.setString(prefix + navigationApiKey, v.id),
    getValue: (d) {
      final string = _prefs.getString(prefix + navigationApiKey);
      return string != null ? NavigationApiId(string) : null;
    },
  );

  late final useAnalytics = Property.boolean(prefix + analyticsKey, true, _prefs);

  Future<void> loadFromPreferences({SharedPreferences? prefs}) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();

    await mapsApp.computeValue();
    await api.computeValue();
    await useAnalytics.computeValue();
  }
}

enum Maps {
  apple,
  google,
}

extension MapsX on Maps {
  String toStringFull() {
    switch (this) {
      case Maps.apple:
        return 'Apple Maps';
      case Maps.google:
        return 'Google Maps';
    }
  }
}

enum QuickActionsDisplays { stops, routes, generic }
