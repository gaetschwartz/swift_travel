import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class Property<T extends Object?> extends ChangeNotifier implements ValueListenable<T> {
  void Function(T value)? get onSet;
  FutureOr<T>? Function(T?)? get getValue;
  FutureOr<void> setValue(T value);

  FutureOr<void> computeValue();

  static Property<T> fromSharedPreferences<T extends Object?>(
          String key, T defaultValue, SharedPreferences prefs) =>
      AsyncProperty<T>(
        onSet: saveInPreferences(key, prefs),
        getValue: getFromPreferences(key, prefs),
        defaultValue: defaultValue,
      );

  static Property<bool> boolean(
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

  static Future<void> Function(T) saveInPreferences<T>(
    String key,
    SharedPreferences prefs,
  ) =>
      (value) async {
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
      };
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
        _value = defaultValue!;

  @override
  final void Function(T value)? onSet;
  @override
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

  @override
  void computeValue() {
    if (getValue != null) {
      _value = getValue!.call(defaultValue) ?? defaultValue!;
      notifyListeners();
    }
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

  @override
  final FutureOr<void> Function(T value)? onSet;
  @override
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

  @override
  Future<void> computeValue() async {
    if (getValue != null) {
      _value = await getValue!.call(defaultValue) ?? defaultValue!;
      notifyListeners();
    }
  }
}
