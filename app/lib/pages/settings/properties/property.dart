import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Property<T extends Object?> extends ChangeNotifier implements ValueListenable<T> {
  Property({
    this.onSet,
    FutureOr<T> Function(T?)? computeValue,
    this.defaultValue,
  })  : assert(
          null is T || defaultValue != null,
          'You need to provide a default value for non-nullable properties.',
        ),
        _computeValue = computeValue,
        _value = defaultValue!;
  final void Function(T value)? onSet;
  final FutureOr<T> Function(T?)? _computeValue;
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

  FutureOr<void> computeValue() async {
    if (_computeValue != null) {
      _value = await _computeValue!.call(defaultValue);
      notifyListeners();
    }
  }

  static Property<T> fromSharedPreferences<T extends Object?>(
          String key, T defaultValue, SharedPreferences prefs) =>
      Property<T>(
        onSet: saveInPreferences(key, prefs),
        computeValue: getFromPreferences(key, prefs),
        defaultValue: defaultValue,
      );

  static Property<bool> boolean(
    String key,
    bool defaultValue,
    SharedPreferences prefs,
  ) =>
      Property<bool>(
        onSet: (d) => prefs.setBool(key, d),
        computeValue: getFromPreferences(key, prefs),
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

  static void Function(T) saveInPreferences<T>(
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
