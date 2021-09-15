import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin Property<T extends Object?> implements ValueListenable<T> {
  FutureOr<void> setValue(T value);
  @override
  T get value;

  static AsyncProperty<bool> boolean(
    String key,
    bool defaultValue,
    SharedPreferences prefs,
  ) =>
      AsyncProperty<bool>(
        onSet: (d) => prefs.setBool(key, d),
        getValue: getFromPreferences<bool>(key, prefs),
        defaultValue: defaultValue,
      );

  static Future<T?> Function() getFromPreferences<T>(
    String key,
    SharedPreferences prefs,
  ) =>
      () async {
        await prefs.reload();
        final object = prefs.get(key);
        assert(object is T?, 'Value must be of correct type.');
        return object as T?;
      };
}

abstract class ChangeNotifierProperty<T extends Object?> extends ChangeNotifier
    with Property<T> {}

class SyncProperty<T extends Object?> extends ChangeNotifier with Property<T> {
  SyncProperty({
    this.onSet,
    required this.initialValue,
  }) : _value = initialValue;

  final void Function(T value)? onSet;
  final T initialValue;

  T _value;

  @override
  T get value => _value;

  @override
  Future<void> setValue(T value) async {
    if (value == _value) {
      return;
    }
    _value = value;
    onSet?.call(value);
    notifyListeners();
  }
}

class AsyncProperty<T extends Object?> extends ChangeNotifier with Property<T> {
  AsyncProperty({
    this.onSet,
    this.getValue,
    this.defaultValue,
  })  : assert(
          null is T || defaultValue != null,
          'You need to provide a default value for non-nullable properties.',
        ),
        _value = defaultValue!;

  final FutureOr<void> Function(T value)? onSet;
  final FutureOr<T?> Function()? getValue;
  final T? defaultValue;

  T _value;

  @override
  T get value => _value;

  @override
  Future<void> setValue(T value) async {
    if (value == _value) {
      return;
    }
    _value = value;
    await onSet?.call(value);
    notifyListeners();
  }

  Future<void> init() async {
    if (getValue != null) {
      _value = await getValue!.call() ?? defaultValue!;
      notifyListeners();
    }
  }
}

class MappedSharedPreferencesProperty<TValue extends Object?,
    TEncValue extends Object?> extends ChangeNotifierProperty<TValue> {
  MappedSharedPreferencesProperty(
    this.key, {
    required this.decode,
    required this.encode,
    this.defaultValue,
  })  : assert(
          null is TEncValue || defaultValue != null,
          'You need to provide a default value for non-nullable properties.',
        ),
        _value = defaultValue!;

  final String key;
  final TValue? defaultValue;

  TEncValue Function(TValue value) encode;
  TValue Function(TEncValue value) decode;

  TValue _value;

  SharedPreferences? _prefs;

  @override
  TValue get value => _value;

  @override
  Future<void> setValue(TValue value) async {
    if (value == _value) {
      return;
    }
    _value = value;
    _prefs ??= await SharedPreferences.getInstance();
    notifyListeners();
    await saveInPreferences<TEncValue>(key, encode(value), _prefs!);
  }

  Future<void> init([SharedPreferences? prefs]) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();
    final x = _prefs!.get(key) as TEncValue?;
    _value = (x == null ? null : decode(x)) ?? defaultValue!;
    notifyListeners();
  }

  static Future<void> saveInPreferences<T>(
    String key,
    T value,
    SharedPreferences prefs,
  ) async {
    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    } else if (value is List<String>) {
      await prefs.setStringList(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else {
      assert(false,
          'Type ${value.runtimeType} is not supported for shared preferences');
    }
  }
}

class SimpleSharedPreferencesProperty<T extends Object?>
    extends MappedSharedPreferencesProperty<T, T> {
  SimpleSharedPreferencesProperty(String key, {T? defaultValue})
      : super(
          key,
          decode: (v) => v,
          encode: (v) => v,
          defaultValue: defaultValue,
        );
}

typedef SimpleSPProperty = SimpleSharedPreferencesProperty;
typedef MappedSPProperty = MappedSharedPreferencesProperty;
