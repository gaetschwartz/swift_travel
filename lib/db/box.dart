import 'dart:async';

import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

class PartiallyLazyBox<TData> implements BoxBase<TData> {
  final Map<dynamic, TData> _cache = {};
  final LazyBox<TData> box;

  PartiallyLazyBox(this.box);

  @override
  Future<int> add(TData value) async {
    final l = await box.add(value);
    _cache[l - 1] = value;
    return l;
  }

  @override
  Future<Iterable<int>> addAll(Iterable<TData> values) async =>
      await Stream.fromIterable(values).asyncMap(add).toList();

  @override
  Future<int> clear() async {
    _cache.clear();
    return await box.clear();
  }

  @override
  Future<void> close() async {
    _cache.clear();
    await box.close();
  }

  @override
  Future<void> compact() async => await box.compact();

  @override
  bool containsKey(key) {
    return _cache.containsKey(key) || box.containsKey(key);
  }

  @override
  Future<void> delete(key) async {
    _cache.remove(key);
    await box.delete(key);
  }

  @override
  Future<void> deleteAll(Iterable keys) async =>
      await Stream.fromIterable(keys).asyncMap(delete).drain();

  @override
  Future<void> deleteAt(int index) async {
    await delete(keyAt(index));
  }

  @override
  Future<void> deleteFromDisk() async {
    await close();
    await box.deleteFromDisk();
  }

  @override
  bool get isEmpty => _cache.isEmpty && box.isEmpty;

  @override
  bool get isNotEmpty => !isEmpty;

  @override
  bool get isOpen => box.isOpen;

  @override
  dynamic keyAt(int index) => box.keyAt(index);

  @override
  Iterable get keys => box.keys;

  @override
  @alwaysThrows
  bool get lazy => throw StateError(
      'This box is partially lazy.' ' It thus doesn\'t make sense to check whether it is or not');

  @override
  int get length => box.length;

  @override
  String get name => box.name;

  @override
  String? get path => box.path;

  @override
  Future<void> put(key, TData value) async {
    _cache[key] = value;
    await box.put(key, value);
  }

  @override
  Future<void> putAll(Map<dynamic, TData> entries) async =>
      await Stream.fromIterable(entries.entries).asyncMap((e) => put(e.key, e.value)).drain();

  @override
  Future<void> putAt(int index, TData value) async => await put(keyAt(index), value);

  @override
  Stream<BoxEvent> watch({key}) => box.watch(key: key);

  bool get isFullyCached => _cache.length == box.length;

  TData? getCached(key, {TData? defaultValue}) => _cache[key] ?? defaultValue;
  Map<dynamic, TData> get cachedMap => Map.from(_cache);

  FutureOr<TData?> get(key, {TData? defaultValue}) async =>
      _cache[key] ?? await box.get(key) ?? defaultValue;

  FutureOr<Map<dynamic, TData>> get map async {
    if (_cache.length != box.length) {
      final keys = box.keys.toSet().difference(_cache.keys.toSet());
      for (final k in keys) {
        _cache[k] = (await box.get(k))!;
      }
    }
    return _cache;
  }

  Iterable<TData> get cachedValues => _cache.values;
  Future<Iterable<TData>> get values async => (await map).values;

  Future<Iterable<TData>> cacheKeys(Iterable keys) async {
    final l = <TData>[];
    for (final k in keys) {
      final value = (await box.get(k))!;
      _cache[k] = value;
      l.add(value);
    }
    return l;
  }

  Future<Iterable<TData>> cacheFirstValues(int n) async => await cacheKeys(keys.take(n));
}
