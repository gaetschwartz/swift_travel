import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

typedef DataConverter<R, S> = S Function(R data);

abstract class LocalDatabase<TKey extends Object, TEncValue extends Object, TValue extends Object> {
  LocalDatabase({
    required this.encoder,
    required this.decoder,
    required this.boxKey,
    required this.maxSize,
  }) {
    assert(() {
      if (_ids[boxKey] == null) {
        _ids[boxKey] = runtimeType;
        return true;
      } else {
        return _ids[boxKey] == runtimeType;
      }
    }(), 'The key `$boxKey` is already associated with a different database ${_ids[boxKey]}');
  }

  static final _ids = <String, Type>{};

  final String boxKey;
  final int maxSize;
  final DataConverter<TValue, TEncValue> encoder;
  final DataConverter<TEncValue, TValue> decoder;

  @override
  String toString() => "$runtimeType('$boxKey', $maxSize)";

  Box<TEncValue>? _box;

  @nonVirtual
  Box<TEncValue> get box {
    assert(_debugInitialized,
        '$this needs to be initiated using open() before accessing the underlying box');
    if (_box == null) {
      throw StateError("Tried $this's box before opening it. Use `open()`.");
    }
    return _box!;
  }

  bool _debugInitialized = false;

  Future<int> clear() => box.clear();

  @mustCallSuper
  Future<void> open({String? path, bool doLog = true}) async {
    assert(() {
      _debugInitialized = true;
      return true;
    }(), '');
    _box = await Hive.openBox<TEncValue>(boxKey, path: path);
    if (doLog) {
      assert(() {
        print('Opened $this at ${box.path}');
        return true;
      }(), '');
    }
  }

  Iterable<TValue> get values => box.values.map((e) => decoder(e));

  Stream<BoxEvent> watch({dynamic key}) => box.watch();

  int get size => box.length;

  @mustCallSuper
  Future<void> close() => box.close();

  /// Method called when the databse size exceeds the `maxSize`. Is is supposed to delete items.
  ///
  /// Default behavior for `IndexedDatabaseMixin` is to delete the first `10` keys.
  /// Override this method to change its behavior.
  FutureOr<void> onDatabaseExceededMaxSize();

  Future<void> put(TKey key, TValue value) async {
    if (box.length >= maxSize) {
      await onDatabaseExceededMaxSize();
    }

    final map = encoder(value);
    await box.put(formatKey(key), map);
  }

  String _maxStringSize(String s) => s.length > 0xff ? s.substring(0, 0xff) : s;

  TValue get first => values.first;
  Iterable<TKey> get keys => box.keys.cast<TKey>();
  Future<void> deleteAll(Iterable<TKey?> keys) => box.deleteAll(keys);
  Future<void> delete(TKey key) => box.delete(key);

  bool containsKey(TKey key) => box.containsKey(formatKey(key));

  TValue get(TKey key) {
    final at = box.get(formatKey(key));
    if (at == null) {
      throw StateError('No item with key `$key`');
    }
    return decoder(at);
  }

  Object formatKey(Object key) => key is String ? _maxStringSize(Uri.encodeComponent(key)) : key;

  Map<TKey, TValue> get map {
    final _map = box.toMap();
    return _map.map((dynamic key, value) => MapEntry(key! as TKey, decoder(value)));
  }
}

mixin KeyedDatabaseMixin<TKey extends Object, TEncValue extends Object, TValue extends Object>
    on LocalDatabase<TKey, TEncValue, TValue> {
  Future<void> safePut(TKey key, TValue value) async {
    if (_box == null) {
      await open();
    }
    await put(key, value);
  }
}

mixin IndexedDatabaseMixin<TEncValue extends Object, TValue extends Object>
    on LocalDatabase<int, TEncValue, TValue> {
  TValue get last => decoder(box.getAt(size - 1)!);

  Future<int> safeAdd(TValue data) async {
    if (_box == null) {
      await open();
    }
    return add(data);
  }

  Future<int> add(TValue data) async {
    if (box.length >= maxSize) {
      await onDatabaseExceededMaxSize();
    }
    final map = encoder(data);
    return box.add(map);
  }

  Future<void> hashAdd(TValue data) => put(data.hashCode, data);
  Future<void> hashDelete(TValue data) => delete(data.hashCode);

  @override
  FutureOr<void> onDatabaseExceededMaxSize() async =>
      await box.deleteAll(<int>[for (var i = 0; i < 10; i++) i]);
}
