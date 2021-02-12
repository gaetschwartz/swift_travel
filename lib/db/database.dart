import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:swift_travel/models/local_route.dart';

class RouteHistoryRepository {
  static const _maxSize = 50;
  static const boxKey = 'route_history';

  RouteHistoryRepository._();
  static late final i = RouteHistoryRepository._();

  @visibleForTesting
  factory RouteHistoryRepository() => RouteHistoryRepository._();

  Box<Map>? _box;
  Box<Map> get box {
    assert(_debugInitialized,
        '$runtimeType needs to be initiated using open() before accessing the underlying box');
    if (_box == null) throw StateError('Tried accessing the box before opening it. Use `open()`.');
    return _box!;
  }

  bool _debugInitialized = false;

  Future<int> add(LocalRoute route, {bool guardNullValues = true}) async {
    if (box.length >= _maxSize) {
      await box.deleteAll(List.generate(_maxSize ~/ 8, (i) => i));
    }
    if (route.timestamp == null) return box.length;
    return await box.add(route.toJson());
  }

  Future<int> safeAdd(LocalRoute route, {bool guardNullValues = true}) async {
    if (_box == null) await open();
    return await add(route, guardNullValues: guardNullValues);
  }

  List<LocalRoute> get routes => values.toList();

  Future<int> clear() => box.clear();

  Future<RouteHistoryRepository> open() async {
    assert(() {
      _debugInitialized = true;
      return true;
    }());
    _box = await Hive.openBox<Map>(boxKey);
    return this;
  }

  Iterable<LocalRoute> get values =>
      box.values.map((e) => LocalRoute.fromJson(e.cast<String, Object>()));

  LocalRoute get first => LocalRoute.fromJson(box.getAt(0) as Map<String, dynamic>);
  LocalRoute get last => LocalRoute.fromJson(box.getAt(box.length - 1) as Map<String, dynamic>);

  Stream<BoxEvent> watch({dynamic key}) => box.watch();

  int get size => box.length;
}
