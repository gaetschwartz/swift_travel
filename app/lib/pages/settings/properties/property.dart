import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Property<T extends Object?> extends ChangeNotifier implements ValueListenable<T> {
  FutureOr<void> setValue(T value);

  static AsyncProperty<bool> boolean(
    String key,
    bool defaultValue,
    SharedPreferences prefs,
  ) =>
      AsyncProperty<bool>(
        onSet: (d) => prefs.setBool(key, d),
        getValue: getFromPreferences(key, prefs),
        defaultValue: defaultValue,
      );

  static Future<T> Function(T?) getFromPreferences<T>(
    String key,
    SharedPreferences prefs,
  ) =>
      (d) async {
        await prefs.reload();
        final object = prefs.get(key) ?? d;
        assert(object is T, 'Value must be of correct type.');
        return object as T;
      };

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
      assert(false, 'Type ${value.runtimeType} is not supported for shared preferences');
    }
  }
}

class SyncProperty<T extends Object?> extends Property<T> {
  SyncProperty({
    this.onSet,
    this.getValue,
    this.defaultValue,
  })  : assert(
          null is T || defaultValue != null,
          'You need to provide a default value for non-nullable properties.',
        ),
        _value = defaultValue! {
    if (getValue != null) {
      _value = getValue!.call(defaultValue) ?? defaultValue!;
      notifyListeners();
    }
  }

  final void Function(T value)? onSet;
  final T? Function(T?)? getValue;
  final T? defaultValue;

  T _value;

  @override
  T get value => _value;

  set value(T value) {
    if (value == _value) {
      return;
    }
    _value = value;
    onSet?.call(value);
    notifyListeners();
  }

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

class AsyncProperty<T extends Object?> extends Property<T> {
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
  final FutureOr<T>? Function(T?)? getValue;
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
      _value = await getValue!.call(defaultValue) ?? defaultValue!;
      notifyListeners();
    }
  }
}

class MappedSharedPreferencesProperty<TValue extends Object?, TEncValue extends Object?>
    extends Property<TValue> {
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
    await Property.saveInPreferences<TEncValue>(key, encode(value), _prefs!);
  }

  Future<void> init([SharedPreferences? prefs]) async {
    _prefs = prefs ?? await SharedPreferences.getInstance();
    final x = _prefs!.get(key) as TEncValue?;
    _value = (x == null ? null : decode(x)) ?? defaultValue!;
    notifyListeners();
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
