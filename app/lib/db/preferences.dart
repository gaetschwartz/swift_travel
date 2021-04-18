import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/pages/settings/properties/property.dart';

final preferencesProvider = Provider<PreferencesBloc>((r) => PreferencesBloc('prefs_'));

class PreferencesBloc {
  PreferencesBloc(this.prefix);

  static const String mapsKey = 'maps_app';
  static const String navigationApiKey = 'navigation_api';
  static const String analyticsKey = 'accepted_analytics';
  static late final i = PreferencesBloc('prefs_');

  static late final ChangeNotifierProvider<Property<NavigationApi>> apiProvider =
      ChangeNotifierProvider((r) => r.watch(preferencesProvider).api);

  final String prefix;
  late SharedPreferences _prefs;

  Future<void> _syncToPrefs(String key, int index) => _prefs.setInt(prefix + key, index);

  T _getEnum<T>(String key, List<T> values, T defaultValue) {
    final i = _prefs.getInt(prefix + key);
    return i != null && i >= 0 && i < values.length ? values[i] : defaultValue;
  }

  late final mapsApp = Property<Maps>(
    defaultValue: Maps.google,
    onSet: (v) => _syncToPrefs(navigationApiKey, v.index),
    computeValue: (d) => _getEnum(navigationApiKey, Maps.values, d!),
  );

  late final api = Property<NavigationApi>(
    defaultValue: NavigationApi.sbb,
    onSet: (v) => _syncToPrefs(navigationApiKey, v.index),
    computeValue: (d) => _getEnum(navigationApiKey, NavigationApi.values, d!),
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

enum QuickActionsDisplays { stops, routes, generic }
