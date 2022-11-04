import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:gaets_logging/logging.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

typedef DataConverter<R, S> = S Function(R data);

abstract class LocalDatabase<TKey extends Object, TEncValue extends Object,
    TValue extends Object> {
  LocalDatabase({
    required this.encode,
    required this.decode,
    required this.boxKey,
    required this.maxSize,
  });
  final log = Logger.of('LocalDatabase');

  static final _runtimeTypeRegistry = <String, Type>{};

  final String boxKey;
  final int maxSize;
  final DataConverter<TValue, TEncValue> encode;
  final DataConverter<TEncValue, TValue> decode;

  @override
  String toString() => "$runtimeType('$boxKey', $maxSize)";

  Box<TEncValue>? _box;

  @nonVirtual
  Box<TEncValue> get box {
    assert(_debugInitialized,
        '$this needs to be initiated using `open()` before this operation.');
    if (_box == null) {
      throw StateError(
          "Tried $this's box before opening it. Use `open()` first.");
    }
    return _box!;
  }

  bool _debugInitialized = false;

  Future<int> clear() => box.clear();

  @mustCallSuper
  Future<void> open({String? path, bool doLog = false}) async {
    assert(
      () {
        if (_runtimeTypeRegistry[boxKey] == null) {
          _runtimeTypeRegistry[boxKey] = runtimeType;
          return true;
        } else {
          return _runtimeTypeRegistry[boxKey] == runtimeType;
        }
      }(),
      'The key `$boxKey` is already associated with a different database ${_runtimeTypeRegistry[boxKey]}',
    );
    _box = await Hive.openBox<TEncValue>(boxKey, path: path);
    assert(_debugInitialized = true, '');
    if (doLog) {
      log.log('Opened $this at ${box.path}');
    }
  }

  Iterable<TValue> get values sync* {
    for (final v in box.values) {
      try {
        yield decode(v);
        // ignore: avoid_catches_without_on_clauses
      } catch (_) {}
    }
  }

  Stream<BoxEvent> watch({dynamic key}) => box.watch(key: key);

  int get size => box.length;

  @mustCallSuper
  Future<void> close() async {
    await box.close();
    _runtimeTypeRegistry.remove(runtimeType);
  }

  /// Method called when the databse size exceeds the `maxSize`. Is is supposed to delete items.
  ///
  /// Default behavior is to delete the first `10` keys.
  /// Override this method to change its behavior.
  FutureOr<void> onDatabaseExceededMaxSize() async {
    final range = keys.take(10);
    await box.deleteAll(range);
  }

  Future<void> put(TKey key, TValue value) async {
    if (box.length >= maxSize) {
      await onDatabaseExceededMaxSize();
    }

    final map = encode(value);
    await box.put(sanitizeKey(key), map);
  }

  String _maxStringSize(String s) => s.length > 0xff ? s.substring(0, 0xff) : s;

  TValue get first => values.first;
  TValue get last => decode(box.get(keys.last)!);

  Iterable<TKey> get keys => box.keys.cast();
  Future<void> deleteAll(Iterable<TKey> keys) =>
      box.deleteAll(keys.map<TKey>(sanitizeKey));
  Future<void> delete(TKey key) => box.delete(sanitizeKey(key));

  bool containsKey(TKey key) => box.containsKey(sanitizeKey(key));

  TValue get(TKey key) {
    final at = box.get(sanitizeKey(key));
    if (at == null) {
      throw StateError('No item with key `$key`');
    }
    return decode(at);
  }

  TKey sanitizeKey(TKey key) =>
      key is String ? _maxStringSize(Uri.encodeComponent(key)) as TKey : key;

  Map<TKey, TValue> get map {
    return box
        .toMap()
        .map((dynamic key, value) => MapEntry(key! as TKey, decode(value)));
  }
}

mixin KeyedDatabaseMixin<TKey extends Object, TEncValue extends Object,
    TValue extends Object> on LocalDatabase<TKey, TEncValue, TValue> {
  Future<void> safePut(TKey key, TValue value) async {
    if (_box == null) {
      await open();
    }
    await put(key, value);
  }
}

mixin IndexedDatabaseMixin<TEncValue extends Object, TValue extends Object>
    on LocalDatabase<int, TEncValue, TValue> {
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
    final map = encode(data);
    return box.add(map);
  }

  Future<void> hashAdd(TValue data) => put(data.hashCode, data);
  Future<void> hashDelete(TValue data) => delete(data.hashCode);
}

class SimpleDatabase<TKey extends Object, TEncValue extends Object,
    TValue extends Object> extends LocalDatabase<TKey, TEncValue, TValue> {
  SimpleDatabase({
    required super.boxKey,
    required super.maxSize,
    required super.decode,
    required super.encode,
    this.onDatabaseExceededMaxSizeCallback,
  });

  final FutureOr<void> Function()? onDatabaseExceededMaxSizeCallback;

  @override
  FutureOr<void> onDatabaseExceededMaxSize() {
    if (onDatabaseExceededMaxSizeCallback != null) {
      onDatabaseExceededMaxSizeCallback!.call();
    } else {
      super.onDatabaseExceededMaxSize();
    }
  }
}
