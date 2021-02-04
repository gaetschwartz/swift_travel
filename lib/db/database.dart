import 'package:flutter_riverpod/all.dart';
import 'package:hive/hive.dart';
import 'package:swift_travel/models/local_route.dart';

final _databaseProvider = Provider((_) => Hive.box<Map<String, Object>>('route_history'));

final routeHistoryProvider = Provider((ref) => RouteHistoryManager(ref.read));

class RouteHistoryManager {
  final Reader read;

  RouteHistoryManager(this.read);

  void add(LocalRoute route) => box.add(route.toJson());

  List<LocalRoute> get routes => values.toList();

  void clear() => box.clear();

  Box<Map<String, Object>> get box => read(_databaseProvider);

  Iterable<LocalRoute> get values => box.values.map((e) => LocalRoute.fromJson(e));

  LocalRoute get first => LocalRoute.fromJson(box.getAt(0));
  LocalRoute get last {
    final box = read(_databaseProvider);
    return LocalRoute.fromJson(box.getAt(box.length - 1));
  }
}
