import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/db/preferences.dart';
import 'package:swift_travel/settings/properties/property.dart';

final ChangeNotifierProvider<ChangeNotifierProperty<NavigationApiId>>
    apiProvider =
    ChangeNotifierProvider((r) => r.watch(preferencesProvider).api);

final navigationAPIProvider = Provider<BaseNavigationApi>((ref) {
  final apiType = ref.watch(apiProvider);
  final api = NavigationApiFactory.fromId(apiType.value).create(ref.read);
  ref.onDispose(api.dispose);
  return api;
});
