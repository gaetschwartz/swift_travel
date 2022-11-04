import 'package:hive/hive.dart';

class LocalBox<T> extends Box<T> {
  final _data = <int, T>{};
  final _keys = <dynamic, int>{};

  @override
  Future<int> add(T value) async {
    final key = _data.length;
    _data[key] = value;
    return key;
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) async {
    final keys = <int>[];
    for (final value in values) {
      final key = _data.length;
      _data[key] = value;
      keys.add(key);
    }
    return keys;
  }

  @override
  Future<int> clear() async {
    _data.clear();
    _keys.clear();
    return 0;
  }

  @override
  Future<void> close() async {}

  @override
  Future<void> compact() async {}

  @override
  bool containsKey(dynamic key) => _keys.containsKey(key);

  @override
  Future<void> delete(dynamic key) async {
    final index = _keys[key];
    if (index != null) {
      _data.remove(index);
      _keys.remove(key);
    }
  }

  @override
  Future<void> deleteAll(Iterable<dynamic> keys) async {
    for (final key in keys) {
      final index = _keys[key];
      if (index != null) {
        _data.remove(index);
        _keys.remove(key);
      }
    }
  }

  @override
  Future<void> deleteAt(int index) async {
    _keys.removeWhere((dynamic _, value) => value == index);
    _data.remove(index);
  }

  @override
  Future<void> deleteFromDisk() async {}

  @override
  Future<void> flush() async {}

  @override
  T? get(dynamic key, {T? defaultValue}) =>
      _data[_keys[key] ?? -1] ?? defaultValue;

  @override
  T? getAt(int index) => _data[index];

  @override
  bool get isEmpty => _data.isEmpty;

  @override
  bool get isNotEmpty => _data.isNotEmpty;

  @override
  bool get isOpen => true;

  @override
  dynamic keyAt(int index) => _keys.keys.firstWhere(
        (dynamic key) => _keys[key] == index,
        orElse: () => null,
      );

  @override
  Iterable<dynamic> get keys => _keys.keys;

  @override
  Future<void> put(dynamic key, T value) async {
    final index = _keys[key];
    if (index != null) {
      _data[index] = value;
    } else {
      final i = _data.length;
      _data[i] = value;
      _keys[key] = i;
    }
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) async {
    for (final entry in entries.entries) {
      final index = _keys[entry.key];
      if (index != null) {
        _data[index] = entry.value;
      } else {
        final i = _data.length;
        _data[i] = entry.value;
        _keys[entry.key] = i;
      }
    }
  }

  @override
  Future<void> putAt(int index, T value) async {
    _data[index] = value;
  }

  @override
  Map<dynamic, T> toMap() {
    final map = <dynamic, T>{};
    for (final key in _keys.keys) {
      map[key] = _data[_keys[key] ?? -1] as T;
    }
    return map;
  }

  @override
  Iterable<T> get values => _data.values;

  @override
  Iterable<T> valuesBetween({dynamic startKey, dynamic endKey}) {
    final start = _keys[startKey] ?? 0;
    final end = _keys[endKey] ?? _data.length;
    return _data.values.skip(start).take(end - start);
  }

  @override
  Stream<BoxEvent> watch({dynamic key}) {
    return const Stream.empty();
  }

  @override
  String get name => '';

  @override
  String? get path => null;

  @override
  bool get lazy => false;

  @override
  int get length => _data.length;
}

class EmptyBox<T> extends Box<T> {
  @override
  Future<int> add(T value) {
    throw UnimplementedError();
  }

  @override
  Future<Iterable<int>> addAll(Iterable<T> values) {
    throw UnimplementedError();
  }

  @override
  Future<int> clear() {
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    throw UnimplementedError();
  }

  @override
  Future<void> compact() {
    throw UnimplementedError();
  }

  @override
  bool containsKey(dynamic key) {
    throw UnimplementedError();
  }

  @override
  Future<void> delete(dynamic key) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAll(Iterable<dynamic> keys) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAt(int index) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteFromDisk() {
    throw UnimplementedError();
  }

  @override
  Future<void> flush() {
    throw UnimplementedError();
  }

  @override
  T? get(dynamic key, {T? defaultValue}) {
    throw UnimplementedError();
  }

  @override
  T? getAt(int index) {
    throw UnimplementedError();
  }

  @override
  bool get isEmpty => throw UnimplementedError();

  @override
  bool get isNotEmpty => throw UnimplementedError();

  @override
  bool get isOpen => throw UnimplementedError();

  @override
  dynamic keyAt(int index) {
    throw UnimplementedError();
  }

  @override
  Iterable<dynamic> get keys => throw UnimplementedError();

  @override
  bool get lazy => throw UnimplementedError();

  @override
  int get length => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  String? get path => throw UnimplementedError();

  @override
  Future<void> put(dynamic key, T value) {
    throw UnimplementedError();
  }

  @override
  Future<void> putAll(Map<dynamic, T> entries) {
    throw UnimplementedError();
  }

  @override
  Future<void> putAt(int index, T value) {
    throw UnimplementedError();
  }

  @override
  Map<dynamic, T> toMap() {
    throw UnimplementedError();
  }

  @override
  Iterable<T> get values => throw UnimplementedError();

  @override
  Iterable<T> valuesBetween({dynamic startKey, dynamic endKey}) {
    throw UnimplementedError();
  }

  @override
  Stream<BoxEvent> watch({dynamic key}) {
    throw UnimplementedError();
  }
}
