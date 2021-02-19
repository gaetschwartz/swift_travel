import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

typedef DataConverter<R, S> = S Function(R data);

abstract class LocalDatabase<TKey extends Object, TEncValue extends Object, TValue extends Object> {
  final String boxKey;
  final int maxSize;
  final DataConverter<TValue, TEncValue> encoder;
  final DataConverter<TEncValue, TValue> decoder;

  LocalDatabase(
      {required this.encoder, required this.decoder, required this.boxKey, required this.maxSize});

  @override
  String toString() => "$runtimeType('$boxKey', $maxSize)";

  Box<TEncValue>? _box;

  @nonVirtual
  Box<TEncValue> get box {
    assert(_debugInitialized,
        '$this needs to be initiated using open() before accessing the underlying box');
    if (_box == null) throw StateError('Tried $this\'s box before opening it. Use `open()`.');
    return _box!;
  }

  bool _debugInitialized = false;

  Future<int> clear() => box.clear();

  @mustCallSuper
  Future<void> open({String? path}) async {
    assert(() {
      _debugInitialized = true;
      return true;
    }());
    _box = await Hive.openBox<TEncValue>(boxKey, path: path);
    if (kDebugMode) print('Opened $this at ${box.path}');
  }

  Iterable<TValue> get values => box.values.map((e) => decoder(e));

  Stream<BoxEvent> watch({dynamic key}) => box.watch();

  int get size => box.length;

  @mustCallSuper
  Future<void> close() async => await box.close();

  /// Method called when the databse size exceeds the `maxSize`. Is is supposed to delete items.
  ///
  /// Default behavior for `IndexedDatabaseMixin` is to delete the first `10` keys.
  /// Override this method to change its behavior.
  FutureOr<void> clean();

  Future<void> put(TKey key, TValue value) async {
    if (box.length >= maxSize) await clean();

    final map = encoder(value);
    return await box.put(formatKey(key), map);
  }

  String _maxStringSize(String s) => s.length > 0xff ? s.substring(0, 0xff) : s;

  TValue get first => values.first;
  Iterable<TKey> get keys => box.keys.cast<TKey>();
  Future<void> deleteAll(Iterable<TKey?> keys) async => await box.deleteAll(keys);

  bool containsKey(TKey key) => box.containsKey(formatKey(key));

  TValue get(TKey key) {
    final at = box.get(formatKey(key));
    if (at == null) throw StateError('No item with key `$key`');
    return decoder(at);
  }

  Object formatKey(Object key) => key is String ? _maxStringSize(Uri.encodeComponent(key)) : key;

  Map<TKey, TValue> get map {
    final _map = box.toMap();
    return _map.map((Object? key, value) => MapEntry(key as TKey, decoder(value)));
  }
}

mixin KeyedDatabaseMixin<TKey extends Object, TEncValue extends Object, TValue extends Object>
    on LocalDatabase<TKey, TEncValue, TValue> {
  Future<void> safePut(TKey key, TValue value) async {
    if (_box == null) await open();
    return await put(key, value);
  }
}

mixin IndexedDatabaseMixin<TEncValue extends Object, TValue extends Object>
    on LocalDatabase<int, TEncValue, TValue> {
  TValue get last => decoder(box.getAt(size - 1)!);

  Future<int> safeAdd(TValue data) async {
    if (_box == null) await open();
    return await add(data);
  }

  Future<int> add(TValue data) async {
    if (box.length >= maxSize) await clean();
    final map = encoder(data);
    return await box.add(map);
  }

  @override
  FutureOr<void> clean() async => await box.deleteAll(<int>[for (var i = 0; i < 10; i++) i]);
}

extension StringX on String {
  /// Not part of public API
  bool get isAscii {
    for (final cu in codeUnits) {
      if (cu > 127) return false;
    }
    return true;
  }
}
