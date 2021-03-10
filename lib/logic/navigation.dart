import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:swift_travel/apis/navigation/navigation.dart';
import 'package:swift_travel/db/preferences.dart';

final navigationAPIProvider = Provider.autoDispose<BaseNavigationApi>((ref) {
  final apiType = ref.watch(PreferencesBloc.apiProvider);
  final api = BaseNavigationApi.getFactory(apiType.value).create(ref.read);
  ref.onDispose(api.dispose);
  ref.maintainState = true;
  return api;
});
